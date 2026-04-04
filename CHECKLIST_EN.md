# EraDev -- Universal Verification Checklist
# Not tied to any specific project. Adapt in projects/<project>/checklists/.

---

## 1. Pre-Commit

- [ ] Code compiles without errors
- [ ] No TODO/FIXME without a linked task
- [ ] No commented-out code (dead code = Muda)
- [ ] No hardcoded secrets (keys, tokens, passwords)
- [ ] No debug console.log / fmt.Println / print statements
- [ ] All new functions have minimal documentation
- [ ] Linter passes without errors
- [ ] Tests pass (unit, if available)
- [ ] Changes match the task scope (no scope creep)
- [ ] Fix chain counter: if this is the 3rd consecutive fix -- STOP, return to the specification

---

## 2. Pre-Deploy

- [ ] All tests pass (unit + integration)
- [ ] Build artifact is built for the target platform
- [ ] Artifact is not stale (build timestamp = current session)
- [ ] Environment configuration verified (env vars, ports, paths)
- [ ] Rollback plan documented BEFORE deployment
- [ ] Feature flag enabled, if applicable
- [ ] Health check endpoint responds after deployment
- [ ] Monitoring for 30 min after protocol/infra changes
- [ ] For canary deploy: canary vs stable metrics compared
- [ ] DNS/TLS: verify if domains or certificates were changed

---

## 3. Security Baseline

- [ ] TLS: MinVersion >= 1.2, weak cipher suites prohibited
- [ ] All endpoints require authentication (except public)
- [ ] Rate limiting on public endpoints
- [ ] Input validation: no SQL injection, XSS, path traversal
- [ ] Sensitive data does not appear in logs (passwords, tokens, PII)
- [ ] Error responses do not expose internal structure
- [ ] Security headers: HSTS, X-Content-Type-Options, X-Frame-Options
- [ ] Dependencies checked for known CVEs
- [ ] File/directory permissions are minimal (principle of least privilege)
- [ ] Secrets stored in env vars or secret manager, not in code

---

## 4. RT-3 Acceptance Criteria

> Used in Round Table 3 (final verification).
> All items must be PASS. Any FAIL = blocker.

### 4.1 Functionality
- [ ] Task completed in full (not partially)
- [ ] Edge cases verified (empty data, boundary values, concurrency)
- [ ] Backward compatibility preserved (or migration documented)
- [ ] No regressions in existing functionality

### 4.2 Coherence (ODTOE)
- [ ] B(agent) > 0.5 for each participant
- [ ] S_team > 0.7 (team homogeneity)
- [ ] No agent with B = 0 for any component (F, E, sigma, Lambda)
- [ ] fix rate < 30% per session

### 4.3 Process
- [ ] All agents fulfilled their role (none skipped)
- [ ] Andon not ignored (if raised -- documented)
- [ ] Decision Log updated
- [ ] Patterns added to MEMORY.md (if new ones discovered)
- [ ] spiral_log.md updated (new iteration)

### 4.4 Documentation
- [ ] Changes reflected in relevant docs
- [ ] MEMORY.md is up to date (no outdated rules)
- [ ] Checklists do not contradict each other (DRY)

---

## 5. Severity Levels

| Level | Meaning | Action |
|-------|---------|--------|
| BLOCK | Violation = commit/deploy halted | Fix immediately |
| WARN | Potential issue | Fix before next RT |
| INFO | Recommendation | At team's discretion |

> All items in sections 1-4 default to severity BLOCK.
> When adapting for a project -- specific items may be downgraded to WARN/INFO.
> Downgrade must be recorded in the project's Decision Log with justification.
