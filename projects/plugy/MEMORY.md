# Plugy — Project Memory (MEMORY.md)

---

## 1. Iron Rules

1. **NEVER hardcode credentials** in source code or env vars for multi-tenant use. All module credentials → `module_credentials` table (AES-256-GCM). Violation → ANDON.
2. **NEVER ship without `go build ./...`** on ALL Go services. Fix chain ≥ 3 → ANDON → write spec first (L-012).
3. **NEVER skip RT-1 for M+ tasks.** Reading EraDev without executing it = Lambda zero (BL-16).
4. **NEVER send KEY_ tokens to client.** CleanResponse() must be applied to every AI response before delivery.
5. **NEVER mix file ownership** between parallel teams. One file = one team. Overlap = ANDON.
6. **NEVER deploy ONDA phase changes without shadow mode comparison** against current production.
7. **NEVER store client PII in project_learning or global_learning.** Anonymization gate (regex + LLM-judge) must pass before data promotion. Violation → GDPR breach.
8. **NEVER let Lyapunov guardian ΔV ≥ 0 pass.** Self-modification that degrades coherence is REJECTED.
9. **ONE language per file.** Go for business logic, Python for AI/ML. No mixing (L-014).
10. **Assistants API deadline: August 26, 2026.** Migration must be production-deployed by July 15, 2026.

---

## 2. Patterns

### P1 [Builder][Validator] — Fix Chain Cascade
- **Severity**: BLOCK
- **Context**: 5 consecutive fix commits (fmt import, servicecheck, strings, context leak, red formatting) traced to shipping Telegram adapter without `go build` or smoke test.
- **Checklist**:
  - [ ] `go build ./...` for EVERY modified service before commit
  - [ ] At least one E2E curl test per service per KEY_ route
  - [ ] CANARY_CHECKLIST.md verified before deploying to production
- **Source**: Cycle 1, ANDON trigger at commit a038b15. Lesson L-012.

### P2 [Builder] — Dead Code from API Incompatibility
- **Severity**: BLOCK
- **Context**: `previous_response_id` passed to `litellm.acompletion()` (Chat Completions API) — parameter silently ignored. Bot responded without context. Went undetected for multiple conversations.
- **Checklist**:
  - [ ] Verify API compatibility BEFORE deploying provider-specific features
  - [ ] LiteLLM: `acompletion()` = Chat Completions. `aresponses()` = Responses API. Different functions.
  - [ ] Test new API features with a single message before production deployment
- **Source**: Cycle 1, BUG-1 in SPEC_QUALITY_FIX.md. Lesson L-013.

### P3 [Analyst][Builder] — Python ABC vs Go Implementation
- **Severity**: WARN
- **Context**: ROADMAP defined Python `class BotModule(ABC)` interface, but all modules implemented as Go HTTP services. Inconsistency persisted across 2 review cycles.
- **Checklist**:
  - [ ] Every interface definition includes implementation language tag
  - [ ] If config.md says "Go" and spec says "Python" → flag immediately
- **Source**: Cycle 1, consistency audit C-1. Lesson L-014.

### P4 [Builder] — Telegram MarkdownV2 Formatting Failure
- **Severity**: WARN
- **Context**: `EscapeMarkdownV2()` escaped ALL characters including markdown syntax (`**bold**` → `\*\*bold\*\*`). Switched to HTML mode (`parse_mode=HTML`).
- **Checklist**:
  - [ ] Telegram: use `parse_mode=HTML`, NOT MarkdownV2
  - [ ] IPs and server names: regular text, NOT `<code>` (shows red in Telegram)
  - [ ] ConvertMarkdownToHTML: validate with isHTMLBalanced() before sending
  - [ ] Fallback: if HTML invalid → strip ALL tags, send as plain text
- **Source**: Cycle 1, commits 60a59f8 + 8fd77b9. Lesson L-003.

### P5 [ALL] — Context Leak into System Prompt
- **Severity**: BLOCK
- **Context**: `[CLIENT CONTEXT]` block injected action-like strings ("проверить недоступность сервера 46.17.40.70") instead of informational ("client mentioned IP: 46.17.40.70"). AI treated context as instruction.
- **Checklist**:
  - [ ] CLIENT CONTEXT is INFORMATIONAL only — never action commands
  - [ ] extractFacts() scans only USER role messages (not assistant)
  - [ ] Context says "do NOT re-ask" for known facts
- **Source**: Cycle 1, commit 6fc3d4e.

### P6 [Builder] — JIVO 3-Second Timeout
- **Severity**: WARN
- **Context**: ServiceCheck path (2 AI calls + HTTP check) = 15-30 sec. JIVO times out at 3 sec, retries twice.
- **Checklist**:
  - [ ] JIVO: send immediate response within webhook HTTP response
  - [ ] ServiceCheck: async goroutine + follow-up via JIVO outbound API
  - [ ] Never block the webhook response for AI generation > 2.5 sec
- **Source**: Cycle 0/1, OQ-001 resolved. Lessons L-006, L-007.

---

## 3. Mega-Patterns

### MM1 — "Verify Before Ship"
- **Generalizes**: P1, P2, P3, P4
- **Statement**: Every artifact (code, config, prompt, API call) must be VERIFIED in its target environment before production deployment. Compilation, API compatibility, formatting rendering — all are target-environment properties that cannot be validated by reading code alone.

### MM2 — "Context Is Not Instruction"
- **Generalizes**: P5, P6
- **Statement**: Data injected into AI system prompts must be clearly tagged as INFORMATIONAL or ACTIONABLE. Ambiguous context is interpreted by the model as instruction, causing unintended behavior.

### MM3 — "Interface Language = Implementation Language"
- **Generalizes**: P3
- **Statement**: Specification documents must use the same language (Go/Python/TypeScript) as the implementation. Cross-language specifications (Python ABC for Go modules) create phantom coherence — the spec looks complete but cannot be executed.

---

## 4. Metrics

| Metric | Formula | Current Value | Threshold |
|--------|---------|---------------|-----------|
| B_mean (JustHost) | F^0.20 × E^0.25 × (1-σ)^0.35 × Λ^0.20 | 0.83 (RT-3 test) | > 0.5 (L6 entry) |
| S_adjusted | S_intra × B_mean | ~0.71 (estimated) | > 0.35 |
| fix_rate | fix commits / total | 7/40 = 0.175 | < 0.35 ✅ |
| fix_chain | max consecutive fixes | 5 (Cycle 1, now reset) | < 3 |
| S_session (Cycle 1) | (1-fix_rate)(1-chain_ratio)×Δ×B_mean | ~0.106 (RED) | > 0.15 |
| P_coll (multi-LLM) | 1-(1-0.85)(1-0.80) | 0.97 (GPT+Gemini) | > 0.8 ✅ |
| Services UP | healthz check | 10/10 | 10/10 |
| DB tables | count | 12 | — |
| SKW chunks | count | 40 (JustHost) | — |
| Test files | count | 5 | — |

---

## 5. Decision Log

| Date | Decision | Rationale | Author | Status |
|------|----------|-----------|--------|--------|
| 2026-04-02 | Go + Python (not Node.js) | Go: goroutines, single binary. Python: LiteLLM, DSPy. No Node in runtime. | Operator + META | ACTIVE |
| 2026-04-02 | Expo (not React Web + migration) | One codebase → Web + iOS + Android. Zero migration cost. | Operator | ACTIVE |
| 2026-04-02 | PostgreSQL (not MongoDB continuation) | RLS for multi-tenancy, pgvector for RAG, ACID for billing. | META RT-1 | ACTIVE |
| 2026-04-02 | NATS (not Kafka, not RabbitMQ) | Sub-ms latency, single binary, JetStream for persistence. | META RT-1 | ACTIVE |
| 2026-04-03 | AutoAgent + DSPy + Lyapunov (nested) | AutoAgent = outer loop (WHAT). DSPy = inner (HOW). Lyapunov = gate (SAFE). | RT-1 5-role audit | ACTIVE |
| 2026-04-03 | HTML parse_mode for Telegram (not MarkdownV2) | MarkdownV2 requires escaping 20+ chars. HTML simpler and reliable. | Builder, after P4 | ACTIVE |
| 2026-04-03 | Per-project module credentials (not global env) | Multi-tenant: project A's Zabbix ≠ project B's. module_credentials table. | RT-1 module audit | ACTIVE |
| 2026-04-03 | 3-level federated learning (client/project/global) | ODTOE D-Prot: anonymization as dimensionality projection. GDPR by construction. | RT-1 5-role team | ACTIVE |
| 2026-04-03 | previous_response_id deferred to Phase 2 | litellm.acompletion() ≠ Responses API. Use litellm.aresponses() in L6. | SPEC_QUALITY_FIX RT-1 | ACTIVE |
| 2026-04-03 | CIDR from NetBox API (not hardcoded) | Dynamic with background refresh. Stale-while-revalidate. | Operator | ACTIVE |

---

## 6. Open Questions (Spiral Gap ~2%)

| ID | Question | Status | Phase |
|----|----------|--------|-------|
| OQ-001 | JIVO 3-sec timeout with ServiceCheck | RESOLVED (async goroutine + follow-up) | L3a |
| OQ-005 | Multi-LLM consistency | RESOLVED (primary always, fallback on error) | L3a |
| OQ-007 | AutoAgent iterations to convergence? Cost per iteration ~$2 | OPEN | LOOP |
| OQ-008 | Anomalous diffusion exponent for real-time S measurement? | OPEN | L9 |
| OQ-009 | Gamma(B,S) client estimation from text alone? | OPEN | L9 |
| OQ-010 | B-score thresholds per domain (hosting vs VPN)? | OPEN (permanent spiral gap) | L6+ |
| OQ-011 | Fine-tuning vs RAG: when is fine-tuning justified? | ANSWERED: NOT for frequently-changing rules | L6 |
