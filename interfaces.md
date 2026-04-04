# Role Interface Contracts

> Exact data formats for inter-role communication on the torus.
> Each contract defines: INPUT schema, OUTPUT schema, and a concrete EXAMPLE.
> Referenced by: eradev.md Section V (Five Roles) and Section VI (Round Table).

---

## 1. Visionary -> Analyst

**Purpose**: Transform strategic vision into an actionable planning brief.
**Torus path**: Outer ring (slow) -- strategy layer.

### Input Schema (from Visionary)

```yaml
visionary_output:
  ifr: string            # Ideal Final Result in PAST TENSE with metrics
  zone: enum             # Push | Pull | Resonance
  risks:
    - description: string
      blast_radius: enum # LOW | MEDIUM | HIGH | CRITICAL
  priorities:
    - rank: int          # 1 = highest
      item: string
      rationale: string
  b_check:
    F: float             # 0.0-1.0
    E: float
    one_minus_sigma: float
    Lambda: float
    B: float             # product of above
```

### Output Schema (Analyst receives and must parse)

```yaml
analyst_intake:
  ifr: string
  zone: enum
  risks: list[{description, blast_radius}]
  priorities: list[{rank, item, rationale}]
  b_check: {F, E, one_minus_sigma, Lambda, B}
```

### Example

```yaml
visionary_output:
  ifr: "Rate limiting deployed on all API endpoints, p99 latency stayed under 50ms, zero false positives in 48h monitoring -- how did we get here?"
  zone: Pull
  risks:
    - description: "Shared Redis dependency could become SPOF under load"
      blast_radius: HIGH
    - description: "Existing health-check endpoints must be excluded from limits"
      blast_radius: MEDIUM
  priorities:
    - rank: 1
      item: "Implement token-bucket on /api/v1/* routes"
      rationale: "Covers 80% of abuse surface"
    - rank: 2
      item: "Add per-tenant rate configuration"
      rationale: "Enterprise tenants need higher limits"
  b_check:
    F: 0.9
    E: 0.85
    one_minus_sigma: 0.9
    Lambda: 0.8
    B: 0.55
```

---

## 2. Analyst -> Builder

**Purpose**: Deliver a build-ready plan with files, ownership, pipeline, and dependencies.
**Torus path**: Inner ring (fast) -- technical iteration.

### Input Schema (from Analyst)

```yaml
analyst_output:
  inertia: enum                    # S | M | L | XL
  files:
    - path: string
      action: enum                 # CREATE | MODIFY | DELETE
      description: string          # what changes in this file
  file_ownership:                  # required when 2+ Builders
    - builder: string              # Builder-A, Builder-B, ...
      files: list[string]          # paths owned exclusively
  pipeline:
    - step: int
      name: string                 # source | build | artifact | deploy | serve | verify
      command: string              # exact command to run
      depends_on: list[int]        # step numbers that must complete first
  dependencies:
    parallel: list[string]         # tasks that can run concurrently
    sequential: list[string]       # tasks that must run in order
  resource_conflicts:
    - resource: string             # port, file, process
      current_user: string
      resolution: string           # "stop OLD before start NEW" etc.
  system_deps: list[string]        # packages, utilities, kernel modules
  b_check:
    F: float
    E: float
    one_minus_sigma: float
    Lambda: float
    B: float
```

### Output Schema (Builder receives and must parse)

```yaml
builder_intake:
  inertia: enum
  files: list[{path, action, description}]
  file_ownership: list[{builder, files}]
  pipeline: list[{step, name, command, depends_on}]
  dependencies: {parallel, sequential}
  resource_conflicts: list[{resource, current_user, resolution}]
  system_deps: list[string]
  b_check: {F, E, one_minus_sigma, Lambda, B}
```

### Example

```yaml
analyst_output:
  inertia: M
  files:
    - path: "internal/middleware/ratelimit.go"
      action: CREATE
      description: "Token-bucket middleware with Redis backend"
    - path: "internal/server/router.go"
      action: MODIFY
      description: "Attach ratelimit middleware to /api/v1/* group"
    - path: "configs/ratelimit.yaml"
      action: CREATE
      description: "Per-route and per-tenant rate config"
    - path: "internal/middleware/ratelimit_test.go"
      action: CREATE
      description: "Unit tests: burst, refill, tenant override, health-check bypass"
  file_ownership:
    - builder: "Builder-A"
      files:
        - "internal/middleware/ratelimit.go"
        - "internal/middleware/ratelimit_test.go"
        - "configs/ratelimit.yaml"
    - builder: "Builder-B"
      files:
        - "internal/server/router.go"
  pipeline:
    - step: 1
      name: source
      command: "go mod tidy"
      depends_on: []
    - step: 2
      name: build
      command: "go build ./..."
      depends_on: [1]
    - step: 3
      name: artifact
      command: "docker build -t api-server:ratelimit ."
      depends_on: [2]
    - step: 4
      name: deploy
      command: "kubectl rollout restart deployment/api-server --namespace=staging"
      depends_on: [3]
    - step: 5
      name: verify
      command: "curl -s -o /dev/null -w '%{http_code}' https://staging.example.com/healthz"
      depends_on: [4]
  dependencies:
    parallel:
      - "Builder-A: ratelimit middleware + tests"
      - "Builder-B: router wiring"
    sequential:
      - "Builder-B waits for Builder-A to export RateLimiter interface"
  resource_conflicts:
    - resource: "port 6379 (Redis)"
      current_user: "session-store"
      resolution: "Reuse existing Redis, separate DB index (db=2)"
  system_deps:
    - "go >= 1.21"
    - "redis-server >= 7.0"
    - "docker >= 24.0"
  b_check:
    F: 0.9
    E: 0.9
    one_minus_sigma: 0.85
    Lambda: 0.8
    B: 0.55
```

---

## 3. Builder -> Validator

**Purpose**: Hand off completed work with build evidence and security attestation.
**Torus path**: Inner ring (fast) -- technical iteration.

### Input Schema (from Builder)

```yaml
builder_output:
  changed_files:
    - path: string
      action: enum           # CREATED | MODIFIED | DELETED
      lines_changed: int     # approximate diff size
  build_result:
    command: string           # exact build command executed
    exit_code: int            # 0 = success
    stdout_summary: string    # key output lines (truncated)
  test_result:
    command: string           # exact test command executed
    exit_code: int
    passed: int
    failed: int
    skipped: int
    coverage_pct: float       # if available, else null
  security_checklist:
    tls: enum                 # PASS | FAIL | N_A
    http_headers: enum
    input_sanitization: enum
    network_exposure: enum
    notes: string             # any deviations or explanations
  blast_radius: enum          # LOW | MEDIUM | HIGH | CRITICAL
  b_check:
    F: float
    E: float
    one_minus_sigma: float
    Lambda: float
    B: float
```

### Output Schema (Validator receives and must parse)

```yaml
validator_intake:
  changed_files: list[{path, action, lines_changed}]
  build_result: {command, exit_code, stdout_summary}
  test_result: {command, exit_code, passed, failed, skipped, coverage_pct}
  security_checklist: {tls, http_headers, input_sanitization, network_exposure, notes}
  blast_radius: enum
  b_check: {F, E, one_minus_sigma, Lambda, B}
```

### Example

```yaml
builder_output:
  changed_files:
    - path: "internal/middleware/ratelimit.go"
      action: CREATED
      lines_changed: 142
    - path: "internal/server/router.go"
      action: MODIFIED
      lines_changed: 8
    - path: "configs/ratelimit.yaml"
      action: CREATED
      lines_changed: 35
    - path: "internal/middleware/ratelimit_test.go"
      action: CREATED
      lines_changed: 210
  build_result:
    command: "go build ./..."
    exit_code: 0
    stdout_summary: "no errors"
  test_result:
    command: "go test ./internal/middleware/... -v -cover"
    exit_code: 0
    passed: 12
    failed: 0
    skipped: 0
    coverage_pct: 87.3
  security_checklist:
    tls: N_A
    http_headers: PASS
    input_sanitization: PASS
    network_exposure: PASS
    notes: "Rate limit headers X-RateLimit-Remaining and X-RateLimit-Reset added"
  blast_radius: MEDIUM
  b_check:
    F: 0.9
    E: 0.85
    one_minus_sigma: 0.9
    Lambda: 0.8
    B: 0.55
```

---

## 4. Validator -> Coherencer

**Purpose**: Deliver verification verdict with classified bugs and edge-case evidence.
**Torus path**: Inner ring -> Outer ring handoff (fast -> slow).

### Input Schema (from Validator)

```yaml
validator_output:
  verdict: enum              # PASS | PASS_WITH_NOTES | FAIL
  bugs:
    - id: string             # BUG-001, BUG-002, ...
      severity: enum         # LOW | MEDIUM | HIGH | CRITICAL
      description: string
      b_deficit: enum        # F | E | sigma | Lambda -- which B-component was deficient
      file: string           # affected file path
      fix_suggestion: string # optional
  edge_cases_tested:
    - scenario: string
      result: enum           # PASS | FAIL
      notes: string
  fix_chain_count: int       # consecutive fix commits per component (>= 3 = red flag)
  regression_check: enum     # CLEAR | REGRESSION_FOUND
  b_check:
    F: float
    E: float
    one_minus_sigma: float
    Lambda: float
    B: float
```

### Output Schema (Coherencer receives and must parse)

```yaml
coherencer_intake:
  verdict: enum
  bugs: list[{id, severity, description, b_deficit, file, fix_suggestion}]
  edge_cases_tested: list[{scenario, result, notes}]
  fix_chain_count: int
  regression_check: enum
  b_check: {F, E, one_minus_sigma, Lambda, B}
```

### Example

```yaml
validator_output:
  verdict: PASS_WITH_NOTES
  bugs:
    - id: "BUG-001"
      severity: LOW
      description: "Rate limit counter not reset on config hot-reload"
      b_deficit: sigma
      file: "internal/middleware/ratelimit.go"
      fix_suggestion: "Subscribe to config change signal and reset bucket state"
  edge_cases_tested:
    - scenario: "Burst of 1000 requests in 100ms from single IP"
      result: PASS
      notes: "Correctly limited to 100, remaining returned 429"
    - scenario: "Health-check endpoint excluded from rate limiting"
      result: PASS
      notes: "/healthz and /readyz bypassed as expected"
    - scenario: "Tenant with custom limit override"
      result: PASS
      notes: "Enterprise tenant limit=5000/min applied correctly"
    - scenario: "Redis connection failure fallback"
      result: PASS
      notes: "Falls back to in-memory limiter with degraded accuracy, logs warning"
  fix_chain_count: 0
  regression_check: CLEAR
  b_check:
    F: 0.95
    E: 0.9
    one_minus_sigma: 0.85
    Lambda: 0.85
    B: 0.62
```

---

## 5. Coherencer -> All Roles

**Purpose**: Broadcast team state, lessons, sync status, and conflicts to all agents.
**Torus path**: Outer ring (slow) -- strategy sync. Broadcast to both rings.

### Input Schema (from Coherencer)

```yaml
coherencer_output:
  s_team: float              # 0.0-1.0, team coherence score
  s_adjusted: float          # S after conflict resolution (may differ from s_team)
  memory_lessons:
    - rank: int              # 1, 2, 3 (top 3 only)
      lesson: string         # what was learned
      source: string         # incident or task that produced the lesson
      yokoten: string        # horizontal propagation -- where else does this apply?
  sync_status:
    aligned: list[string]    # roles that agree on direction
    divergent:
      - role: string
        issue: string        # what diverges
        resolution: string   # proposed fix or escalation
  conflicts:
    - type: enum             # FILE_OWNERSHIP | TERMINOLOGY | ARCHITECTURE | RESOURCE
      parties: list[string]  # roles or builders involved
      description: string
      status: enum           # RESOLVED | ESCALATED_L2 | ESCALATED_L3
      resolution: string     # how it was resolved, or escalation target
  spiral_gap: string         # unresolved ~2% that feeds next cycle
  kill_switch_status: enum   # INACTIVE | LEVEL_1 | LEVEL_2 | LEVEL_3 | LEVEL_4 | LEVEL_5
  b_check:
    F: float
    E: float
    one_minus_sigma: float
    Lambda: float
    B: float
```

### Output Schema (All roles receive and must parse)

```yaml
all_roles_intake:
  s_team: float
  s_adjusted: float
  memory_lessons: list[{rank, lesson, source, yokoten}]
  sync_status: {aligned, divergent: list[{role, issue, resolution}]}
  conflicts: list[{type, parties, description, status, resolution}]
  spiral_gap: string
  kill_switch_status: enum
  b_check: {F, E, one_minus_sigma, Lambda, B}
```

### Example

```yaml
coherencer_output:
  s_team: 0.78
  s_adjusted: 0.82
  memory_lessons:
    - rank: 1
      lesson: "Redis SPOF risk requires in-memory fallback for all middleware that depends on it"
      source: "Rate-limit task -- Validator found Redis failure path untested"
      yokoten: "Apply to session-store, cache-layer, queue consumers"
    - rank: 2
      lesson: "Health-check endpoints must be explicitly excluded from any request-scoped middleware"
      source: "Rate-limit task -- health-check almost blocked by limiter"
      yokoten: "Audit all middleware chains for health-check bypass"
    - rank: 3
      lesson: "Config hot-reload must trigger state reset in stateful middleware"
      source: "BUG-001 -- stale counters after config change"
      yokoten: "Check circuit-breaker, feature-flag evaluator, auth-cache"
  sync_status:
    aligned:
      - "Visionary"
      - "Analyst"
      - "Builder"
      - "Validator"
    divergent:
      - role: "Builder-B"
        issue: "Proposed adding global rate limit on top of per-route -- not in original plan"
        resolution: "Deferred to next sprint, captured in spiral gap"
  conflicts:
    - type: RESOURCE
      parties: ["Builder-A", "Builder-B"]
      description: "Both attempted to modify router.go error handler"
      status: RESOLVED
      resolution: "Builder-A owns error handler; Builder-B adds middleware chain only"
  spiral_gap: "Global rate limit layer and per-route limit interaction model -- deferred to next cycle"
  kill_switch_status: INACTIVE
  b_check:
    F: 0.9
    E: 0.85
    one_minus_sigma: 0.9
    Lambda: 0.9
    B: 0.62
```

---

## Contract Validation Rules

1. **Schema completeness**: Every field in the input schema MUST be present. Missing fields trigger Andon.
2. **B-check mandatory**: Every handoff includes b_check. If B < 0.5 or any component < 0.3, the receiving role MUST flag it before proceeding.
3. **Blast radius consistency**: blast_radius set by Visionary (in risks) propagates unchanged through Analyst -> Builder -> Validator. No role may silently downgrade it.
4. **File ownership immutability**: Once Analyst assigns file ownership, no Builder may touch files outside their assignment. Violation = Andon.
5. **Verdict semantics**:
   - PASS: proceed to next phase.
   - PASS_WITH_NOTES: proceed, but listed items must be tracked in spiral gap.
   - FAIL: return to Builder (inner ring) or escalate to Analyst (if plan-level issue).
6. **Memory lesson cap**: Coherencer broadcasts exactly 3 lessons (top 3). Additional lessons go to project lessons.md, not the broadcast.
7. **S_team threshold**: If s_team < 0.5, Coherencer MUST trigger synchronization before broadcasting. The broadcast itself must include the resolution steps taken.
