# HANSEI REPORT — META -> META-META

> PROJECT: [name]
> DATE: [YYYY-MM-DD]
> SESSIONS: [count since last Hansei]
> TRIGGER: [what triggered this report]

---

## 1. Process Metrics

- Total tasks: [N], Pass rate: [X%]
- Delegation efficiency: [how often META spawned Check Agents vs read raw output]
- Drift events: [count + pattern]
- Context utilization: [typical % at session end]

### Hansei Metrics (MultiAgentBench-inspired)

For each completed RT cycle, Coherencer reports:
- **task_completion_rate**: N tasks PASS first-try (no fix chain) / N total. Target: >=0.7
- **collaboration_efficiency**: actual_parallel_agents / max_parallel_possible (per Inv 13). Target: >=0.8
- **role_specialization_score**: Coherencer rating of whether Builder/Analyst/Validator/Visionary stayed in their role lane (0.0-1.0). Target: >=0.85

Trend across last 5 cycles flagged in Hansei summary. Source: MultiAgentBench arxiv 2503.01935 (RT-5 research wave, 2026-04-25).

## 2. What Worked (framework-level, not project-level)

- [max 5 bullets about orchestration patterns that succeeded]

## 3. What Failed (framework-level)

- [max 5 bullets about process breakdowns]

## 4. Proposals for EraDev Instruction

| # | What to change | Where (file + section) | Why | Expected effect |
|---|---------------|----------------------|-----|-----------------|
| P-1 | | | | |
| P-2 | | | | |

## 5. BL Candidates (lessons that generalize beyond this project)

- [lessons worth promoting to BOOTSTRAP_LESSONS.md]

---

> Level separation: META-META reads Hansei Reports, never Cycle Briefs or raw output.
