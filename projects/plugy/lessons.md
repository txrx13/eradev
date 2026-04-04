# OmniBot Platform — Lessons & Spiral Memory

> Incidents, mega-patterns, and open questions from each development cycle.
> Format: reverse chronological. Newest lessons at the top.
> Per EraDev IX: ~2% of each cycle remains unresolved — this feeds the next spiral turn.

---

## Cycle 4: ONDA-LOOP Service + Post-Convergence Roadmap — Session 2026-04-04

### L-LOOP-01: Single-lever convergence is not the ceiling
**Pattern:** B_mean stabilizes at ~0.70-0.72 with persona-only optimization. This is NOT the system ceiling — it's the persona ceiling. Six operators exist: persona, rules, retrieval, model, meta, eval.
**Action:** Sequential spiral: converge L1 → unlock L2 → converge → unlock L3. Each ~2% residual feeds next level.

### L-LOOP-02: 50 fixed dialogs = overfitting by design
**Pattern:** Benchmark convergence means fitness to 50 dialogs, not production quality. Production has edge cases, multi-language, adversarial inputs.
**Action:** Rotate 20/50 dialogs from production (PII scrubbed). Held-out validation set to detect overfitting. If opt B↑ but val B↓ → auto-halt.

### L-LOOP-03: SCW rules affect (1-σ) more than persona
**Pattern:** Consistency weight is 0.35 (highest). Rules control which knowledge is served. Contradictory rules spike σ. Persona text cannot fix factual errors in rules.
**Action:** L2 rule optimization after persona converges. One rule per iteration. Factual verification layer (not just B-score).

### L-LOOP-04: Production feedback is the binding constraint after L4
**Pattern:** After synthetic benchmark optimization (L1-L4), the binding constraint shifts to novel situations. Production escalation rate, repeat contacts, conversation length are behavioral signals that B-score doesn't capture.
**Action:** Phase 4 (production feedback collection) runs parallel to L1-L3, but only influences optimization after minimum sample size (30 rated conversations per project).

### L-LOOP-05: ONDA-LOOP as service = zero manual deploys
**Pattern:** Первая итерация запущена вручную → потом скрипт → потом cron → потом внутренний APScheduler. Каждый шаг убирает ручное вмешательство.
**Action:** Service deployed on :8092, APScheduler every 4h (justhost) / 8h (meduzavpn). Next: convergence → auto-switch to L2.

### OQ-016: PII scrubbing pipeline for production dialog sampling
### OQ-017: Optimal benchmark rotation frequency (every 3 iterations? every convergence?)
### OQ-018: DSPy integration for RAG retrieval optimization (L3)

---

## Cycle 3: TACT 3.5 ENRICH + Self-Learning Activation — Session 2026-04-04

> RT-1 (2 раунда, S_team=0.94). Исследование индустрии hosting support 2025-2026.
> Pre-response enrichment pipeline: NetBox + Zabbix + incident.io statuspage.

### New Lessons

**L-TACT-01: Confidence routing — встраивать с Phase 1, не откладывать.**
Без baseline confidence score невозможно измерить resolution rate и прогресс. Каждый enrichment должен возвращать confidence (high/medium/low). Это 30 минут работы на Phase 1, но создаёт основу для всех последующих фаз.

**L-TACT-02: Auto-fix safety tiers (GREEN/YELLOW/RED) — архитектурное решение ДО Phase 2.**
GREEN (restart, SSL renew, cache clear) безопасны для автоматизации. YELLOW (config, reboot) требуют подтверждения. RED (delete, billing, security) — никогда. Решение о тирах принимать заранее, ретрофит дорогой.

**L-TACT-03: Resolution rate benchmarks.**
FAQ bot = 20%, RAG-powered = 50%, agentic AI with actions = 80%, full agentic + self-healing + proactive = 95%+. Наш Phase 1 target: 35-40% (enrichment only). Intercom Fin 66% avg, Zendesk AI 80% enterprise, Ada CX 83%.

**L-TACT-04: Escalation brief экономит 2-3 мин на тикет.**
Одно предложение контекста при передаче оператору. Исследование: saves 30-60s per handoff. При 100 escalations/день = 50-100 часов/месяц экономии оператора.

**L-TACT-05: Ручной деплой при наличии autodeploy — muda.**
Autodeploy через cron (каждую минуту git pull + rebuild) уже настроен. В сессии 2026-04-04 META вручную задеплоил через ssh+rsync вместо git push. Достаточно коммита + push в main.

### New Open Questions

- OQ-013: Какой widget URL у incident.io statuspage для JustHost? Нужно найти в dashboard.
- OQ-014: Реальный latency THINK+RETRIEVE в продакшене? Нужно для точного бюджета ENRICH.
- OQ-015: Benchmark results — какой baseline B_mean у JustHost после accumulator fix?

---

## Cycle 2: META Hansei — Session 2026-04-02/03

> Ретроспектива полного цикла. 72 коммита, ~110 агентов, скоуп взорвался M → XL.
> S_session = 0.586 — жёлтая зона. Главный урок: META читал фреймворк, но не следовал ему.

### New Lessons

**L-016: META-as-Builder is the #1 protocol failure mode.**
META read eradev.md, classified XL, then wrote Go/Python code directly for 2.5 hours. Operator had to remind 5+ times. Root cause: no enforcement gate — CLAUDE.md said "don't code" but nothing BLOCKED tool_use(edit/write). Fix: CLAUDE.md must declare META identity with INVARIANT. Session Bootstrap checklist must be the FIRST visible output, not deferred. Знание без enforcement = Lambda zero (BL-16 подтверждён).

**L-017: Code must compile before commit — no exceptions.**
3 fix chains of 3 commits each (Telegram Markdown, ServiceCheck, env.sh) all traced to pushing code without running `go build` or basic smoke test. "Fix: add strings import" = code was never compiled. Every Builder agent MUST run `go build` (Go) or equivalent before committing. Это повторение L-012 — урок не был интернализирован.

**L-018: Phantom coherence through untested deploy.**
previous_response_id was implemented via litellm.acompletion() (Chat Completions API) but this parameter belongs to Responses API. Bot ran WITHOUT context for unknown number of conversations. Deployed, announced "working", no Validator checked. Every deploy MUST have a Validator smoke test verifying the ACTUAL behavior matches intent. Связан с L-013 — тот же баг, тот же паттерн: не проверили API compatibility.

**L-019: Rate limit awareness — reduce parallelism proactively.**
4 agents hit rate limit simultaneously at peak parallelism (~20:43 UTC). All 4 tasks left incomplete (admin panel, LOOP iteration, servicecheck, seed personas). Strategy: monitor remaining quota, cap parallel agents at 3-4 when approaching limit. Better to finish 3 tasks than leave 4 half-done. Правило: N_parallel ≤ min(5, remaining_quota / estimated_cost_per_agent).

**L-020: META has no visibility into rate limit proximity — must use heuristic counter.**
META cannot see remaining API quota. Rate limit arrives as a hard error only when an agent is already mid-task. In session 2026-04-02/03, 4 agents died simultaneously because there was no early warning. Fix: META maintains a running agent counter per session. Thresholds: 0-50 agents = GREEN (full parallelism), 50-80 = YELLOW (max 3 parallel), 80+ = RED (max 2 parallel, prioritize completion over new work). Counter is announced at each RT checkpoint. Связан с L-019 — это конкретный enforcement mechanism для того урока.

**L-021: Session scope exploded from M to XL without formal reclassification.**
Started as "research + ROADMAP" (M), ended with 72 commits across 10+ modules (XL). No formal reclassification happened. Per BL-18: if cumulative work exceeds 2x initial estimate, STOP and reclassify. Announce new classification and adjust team structure. Дрейф скоупа — классический anti-pattern, усиленный отсутствием enforcement gate.

### Session Metrics

- S_session = 0.586 (YELLOW — below 0.7 healthy threshold)
- fix_rate = 0.181 (13/72 commits)
- chain_ratio = 0.125 (9/72 in chains of 3+)
- B_mean (RT-3 canary) = 0.845
- Total commits: 72
- Total agents spawned: ~110+
- EraDev compliance: 40% → 85% (after operator corrections)

### Resolved from Cycle 1

- None (Cycle 1 open questions OQ-007..OQ-009 remain open)

### New Open Questions

- OQ-010: Is CLAUDE.md enforcement sufficient, or do we need a pre-commit hook that blocks META from editing non-eradev files?
- OQ-011: What is the optimal parallelism cap to avoid rate limits while maximizing throughput?
- OQ-012: Admin panel JWT auth — works after commit 991e920?

### Prediction Delta

| Aspect | Plan | Actual |
|--------|------|--------|
| Scope | Research + ROADMAP (M) | 72 commits, 10+ modules (XL) |
| ONDA level | Not planned | L6 deployed |
| Quality | Not measured | B_mean=0.845 (canary), 0.0 (LOOP broken) |
| Protocol | Full EraDev compliance | 40%→85% after 5+ reminders |

---

## Cycle 1: ONDA v2 Audit + Quality Fix (2026-04-03)

### New Lessons

**L-009: Lyapunov guardian cannot be validated on synthetic data alone.**
AutoAgent's self-modification loop (ΔV < 0 gate) requires real production conversation data to calibrate thresholds. Synthetic benchmarks may converge to a local minimum that fails on real edge cases. Always validate convergence criteria on a held-out set of REAL conversations.

**L-010: B-score thresholds are domain-specific — this is a permanent spiral gap, not an open question.**
Hosting support (JustHost) has different B-component distributions than VPN sales (MeduzaVPN). The threshold S_adjusted < 0.35 for phantom coherence was chosen analytically but must be calibrated empirically per project. This gap feeds every cycle.

**L-011: ROADMAP-to-implementation gap amplifies at Phase 3+.**
9 HIGH-severity discrepancies between ROADMAP.md and ROADMAP_ONDA.md concentrated in Phases 3-5 (furthest from MVP). Abstract architecture descriptions degrade in precision with distance from implementation. Fix: write SPEC_*.md per phase BEFORE coding, not after.

**L-012: Fix chain = 5 commits without spec → ANDON was correct.**
The 5 consecutive fix commits (fmt import, servicecheck, strings, context leak, red formatting) all traced to one root cause: Telegram adapter shipped without running `go build` or testing a single ServiceCheck path end-to-end. Every new adapter MUST pass compile + smoke test against ALL module entry points before merge.

**L-013: previous_response_id via litellm.acompletion() = dead code.**
litellm.acompletion() uses Chat Completions API. previous_response_id is a Responses API parameter. LiteLLM has separate litellm.aresponses() function. The bot ran without context for an unknown number of conversations before detection. Lesson: always verify API compatibility BEFORE deploying provider-specific features.

**L-014: Module interface language must match implementation language.**
ROADMAP Section 3.3 defined Python ABC for modules that are implemented in Go. Persisted across 2 review cycles undetected. Root cause: spec written in "design mode" (Python prototyping) but AD-001 mandates Go for business logic. Every interface definition must include implementation language tag.

**L-015: Module outputs are first-class learning signals.**
3-level learning (ONDA XI) was designed without considering module execution results (ServiceCheck outcomes, RetentionFlow progression, Freshdesk resolution times) as learning inputs. These behavioral signals are equal in value to conversation text. When adding any subsystem, enumerate ALL data producers — not just the obvious ones.

### Resolved Open Questions

- OQ-001 (JIVO 3-sec timeout): Resolved via async ServiceCheck in goroutine + immediate response + follow-up message.
- OQ-005 (Multi-LLM consistency): Resolved — use primary always, fallback only on error. Not worth running both.

### New Open Questions

- OQ-007: How many AutoAgent iterations to convergence? Cost per iteration ~$2.
- OQ-008: Is anomalous diffusion exponent measurable in real-time for conversation coherence?
- OQ-009: Can Gamma(B,S) client estimation work from text alone without explicit feedback?

---

## Cycle 0: Research & ROADMAP (2026-04-02)

### RT-1 Findings (Round Table — Start)

**Visionary:**
- The project is not "fix the n8n bot" — it is "build a platform that makes n8n-style bot creation obsolete."
- True North: any business creates a working AI support bot in under 10 minutes.
- Biggest risk: scope creep. 5 phases from MVP to ecosystem — each must deliver standalone value.

**Analyst:**
- OpenAI Assistants API shuts down August 26, 2026. This is a hard deadline with zero flexibility.
- Current n8n architecture: Webhook → MongoDB (thread lookup) → OpenAI Assistants → KEY_ parsing → routing → JIVO response. All three bots follow this pattern with variations.
- JustHost is 10x more complex than Tegas/MeduzaVPN: service checks, incident correlation, retention flows, GeoIP correction, complaint handling, operator escalation rules.
- Go + Python split is clean: Go owns all business logic and data; Python only handles AI inference and ML. The gRPC boundary is the critical interface contract.

**Builder:**
- JIVO 3-second timeout is the hardest technical constraint. The entire pipeline (receive → AI inference → format → respond) must complete in <3 sec or the chat transfers to a human.
- Streaming from AI providers helps: start sending response chunks while still generating.
- For JIVO specifically: response must be in the HTTP response body, not a separate API call. This means the Go adapter must wait for AI completion synchronously.

**Validator:**
- Migration is the riskiest phase. Three production bots serving real customers. Zero tolerance for downtime.
- Shadow mode + canary rollout (Tegas first) is the safe path.
- Need automated comparison: n8n response vs OmniBot response for the same input. Diff report → fix → re-compare.
- B-score validation: after migration, B-score per project must be >= pre-migration baseline.

**Coherencer:**
- This is a greenfield project with a clear migration path. No legacy code to fight.
- ODTOE principles (B-score, READ/WRITE/VERIFY/SYNC, strange loop) are not decorative — they provide concrete metrics and architectural patterns. Keep them actionable, not theoretical.
- SCW matrix (4-tact cognitive cycle) proved useful for strategic decisions in the ROADMAP. Embed it in AI Studio for instruction generation.

---

### Lessons Learned from Current n8n Bots

**L-001: KEY_ system works well — keep it.**
The KEY_TO_OPERATOR, KEY_NEED_IP_CHECK, KEY_HTTP_REQUEST pattern is simple, reliable, and AI-model-agnostic. The bot outputs a keyword, the orchestrator routes to the right action. No complex function calling needed for basic routing. Keep this as the primary routing mechanism; add function calling as an optional enhancement.

**L-002: Thread-based conversation is fragile.**
MongoDB stores chat_id → thread_id mapping. If the thread gets corrupted or OpenAI loses it, the bot loses all context. The new system must own conversation state (PostgreSQL + Redis), not depend on provider-side threads. Use provider's previous_response_id for context, but keep authoritative history locally.

**L-003: HTML-to-Markdown conversion is a recurring pain point.**
Both MeduzaVPN and Tegas bots have complex Code nodes for HTML→Markdown→Telegram MarkdownV2 conversion. This is pure boilerplate. The new system needs a robust, tested formatter per channel, not per-bot copy-paste.

**L-004: JustHost instructions are massive (~800 lines) and growing.**
Every incident, every edge case, every correction gets appended to the system prompt. This approach doesn't scale — context window fills up, instructions contradict each other. RAG + modular instructions is the solution: core prompt stays small, specific knowledge is retrieved per-query.

**L-005: Retention flow must be sequential, not parallel.**
JustHost bot explicitly requires: offer location change → if declined, offer bonus → if declined, offer discount → only then discuss refund. Previous iterations tried presenting all options at once — clients got overwhelmed. The module system should enforce step-by-step flows.

**L-006: Service check (KEY_NEED_IP_CHECK) is the highest-value JustHost feature.**
It transforms the bot from "text answerer" to "actual diagnostic tool." The IP + cnXXX check, incident correlation, and automated troubleshooting flow is what makes JustHost bot genuinely useful. This must be the first module implemented and the most thoroughly tested.

**L-007: JIVO's AGENT_UNAVAILABLE event is critical for customer experience.**
When bot sends INVITE_AGENT and no operators are available, the bot must handle this gracefully — collect contact info, create Freshdesk ticket, reassure the client. The current n8n flow handles this, but the logic is buried in workflow nodes. Make it a first-class pattern in the adapter.

**L-008: Multi-language detection is harder than it seems.**
JustHost prompt has elaborate rules: check client's language → check message → check name → default to English. Technical terms (cnXXX, haXXX) must not trigger language switch. Service IDs with Latin characters in Russian conversations cause false English detection. Need a robust language detection layer that's model-agnostic.

---

### Architectural Decisions & Rationale

**AD-001: Go + Python (not Node.js + Python, not Python-only)**
- Go: goroutines for concurrency, single binary deployment, low memory, strong typing
- Python: only for AI/ML where ecosystem is irreplaceable (LiteLLM, DSPy, LangChain)
- Rejected Node.js: adds a third runtime with no unique advantage over Go for this use case
- Rejected Python-only: GIL limits concurrency, higher memory footprint for non-AI services

**AD-002: Expo (not React Web + later migration)**
- Single codebase for Web + iOS + Android from day one
- Eliminates future migration cost (React Web → React Native)
- Expo Router provides file-based routing similar to Next.js
- Trade-off: slightly more complex setup than pure React Web, but pays off immediately

**AD-003: PostgreSQL (not MongoDB continuation)**
- RLS for multi-tenant isolation at database level
- pgvector extension for RAG (zero additional infrastructure on MVP)
- Strong ACID guarantees for billing and conversation state
- MongoDB was only used for simple key-value (chat_id → thread_id) — PostgreSQL handles this trivially

**AD-004: Payment Abstraction Layer (not Stripe-only)**
- Target markets: global (Stripe, PayPal) + Russia (T-Bank, YooMoney) + crypto (Cryptomus) + local methods (Payssion)
- Same pattern as LiteLLM for AI providers: unified interface, adapter per gateway
- Gateways without native subscriptions get internal subscription manager wrapper

**AD-005: NATS (not RabbitMQ, not Kafka)**
- Sub-millisecond latency, single binary, minimal ops overhead
- JetStream for persistence when needed (conversation events, billing events)
- Not Kafka: overkill for chatbot volumes; Kafka's strength (massive throughput, event sourcing) isn't needed at MVP
- Not RabbitMQ: more operational complexity for no clear benefit at this scale

---

### Open Questions (~2% spiral gap)

**OQ-001:** How to handle JIVO's 3-sec timeout with slow AI providers? Streaming helps, but if the first token takes >2.5 sec, we're already at risk. Possible: pre-generate a "thinking" message, send it immediately, then follow up with the real answer? JIVO supports multiple BOT_MESSAGE in sequence.

**OQ-002:** Self-learning Phase 3 (DSPy optimization) — how large a dataset is needed per project before optimization produces meaningful results? Estimate: 500+ labeled conversations minimum. For small projects this may take months to accumulate.

**OQ-003:** Expo Web rendering performance for large conversation lists (10K+ messages in a project). React Native's FlatList virtualization works on mobile but may behave differently on web. Needs benchmarking.

**OQ-004:** Freshdesk webhook reliability — if our backend is down when Freshdesk sends a webhook, the ticket status update is lost. Freshdesk retries for 48 hours, but we need a dead letter queue (NATS JetStream) to handle this.

**OQ-005:** Multi-LLM consistency — if primary (OpenAI) and backup (Gemini) give different answers to the same question, which do we use? Current strategy: always use primary, fallback only on error. But could we use both and pick the better answer? Adds latency, adds cost. Probably not worth it at MVP.

**OQ-006:** When the platform becomes commercial SaaS — who hosts the AI keys? Two models: (a) OmniBot provides shared keys (included in subscription price), (b) BYOK — customer provides their own keys. Likely: both options, BYOK for enterprise tier.

---

*This file grows with each development cycle. Each RT-3 (finish) adds: Hansei reflection, new lessons, resolved and new open questions. Yokoten: lessons from one bot's migration apply to all three.*
