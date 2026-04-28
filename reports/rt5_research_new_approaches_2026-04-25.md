# RT5 Research — New Approaches Since 2026-04-12

Date: 2026-04-25 | Window: ~2 weeks | Researcher: [ANALYST]
Baseline: v10_theoretical_research_2026-04-12.md, multi_agent_frameworks_comparison_2026-04-11.md, v10_conditional_bim_deep_research_2026-04-24.md

## TL;DR

The window is short. Most "new" hits are pre-existing tracks (MCP/A2A consolidation, Claude 4.7 release on 2026-04-16). Only TWO findings are genuinely NEW for EraDev: (1) Semantic Consensus Framework (SCF) — formal conflict-detection layer for multi-agent enterprise systems; (2) Claude Opus 4.7 file-system memory tool — operator we already use, but scratchpad/notes uplift directly improves META's lessons.md / MEMORY discipline. Everything else is noise or partial overlap.

## Findings Table (7 dimensions × top hits)

| # | Dim | Finding | Source | Relevance | Action |
|---|-----|---------|--------|-----------|--------|
| 1 | Multi-agent frameworks | Google ADK (Apr 2025) + Anthropic Agent SDK (alongside 4.6); A2A protocol now under Linux Foundation AAIF (Dec 2025) | gurusup blog 2026; getstream blog | PARTIAL — we have own RT, not framework | DEFER (we are not a framework consumer) |
| 2 | Multi-agent frameworks | MultiAgentBench — milestone-based KPIs for collaboration/competition between agents | arxiv 2503.01935 | PARTIAL — could inform Validator metrics | ADAPT (small: import 2-3 milestone metrics into Validator role) |
| 3 | Reasoning models | Claude Opus 4.7 (2026-04-16): self-verifies outputs, hours-long agentic coherence, 14% gain in multi-step reasoning, 1/3 tool errors, file-system memory uplift | platform.claude.com whatsnew 4.7; AWS blog 2026-04-20 | NEW — directly affects META operator | ADOPT (META already uses Opus 4.7; tune lessons.md write-cadence) |
| 4 | Reasoning models | Gemini 3.1 Pro Deep Think + 77.1% ARC-AGI-2 (Apr 2026) | blog.google gemini-3-1-pro | IRRELEVANT (not our operator) | REJECT |
| 5 | Reasoning models | OpenAI consolidated o-series into GPT-5 (reasoning-as-default) | OpenAI release notes | IRRELEVANT (not our operator) | REJECT |
| 6 | Long-context | 1M token now standard (Claude 4.7, Gemini 2.5 Pro GA 2026-04-01, Qwen3 extendable to 1M) | siliconflow; elvex 2026 | ALREADY-COVERED (we use 4.7-1M) | DEFER (no architectural change needed) |
| 7 | Long-context | No new arxiv-grade architecture paper this 2-week window for 1M+ patterns | (negative result) | NEW (negative) | DEFER |
| 8 | Self-improvement | Memento-Skills — agents rewrite skills WITHOUT retraining; external evolving skill memory | venturebeat orchestration 2026 | NEW (PARTIAL overlap with our lessons.md / BL) | ADAPT (review our BL-write protocol against Memento-Skills cadence) |
| 9 | Self-improvement | Self-Improving LLM Agents at Test-Time (arxiv 2510.07841) — self-aware sample selection + self-data-augmentation, +5.48% with 68× less data | arxiv 2510.07841 | PARTIAL (intersects our Hansei) | DEFER (mechanism is fine-tune-based; we can't fine-tune Claude) |
| 10 | Self-improvement | Intrinsic Metacognitive Learning position paper (ICML 2025) — knowledge + planning + evaluation | OpenReview 4KhDd0Ozqe | PARTIAL (we already do this via meta.md Section 14) | DEFER (philosophical match, no new mechanism) |
| 11 | Coherence/consensus | **Semantic Consensus Framework (SCF)** — 6 components: Process Context Layer + Semantic Intent Graph + Conflict Detection Engine + Consensus Resolution Protocol + Drift Monitor + Process-Aware Governance. 100% workflow completion vs 25.1% baseline across AutoGen+CrewAI+LangGraph × 4 enterprise scenarios | arxiv 2604.16339 | NEW — direct overlap with Coherent role + ODTOE | ADAPT (SEE TOP-5) |
| 12 | Coherence/consensus | Token-Level Round-Robin Collaboration — agents interleave generation in shared context to defeat adversarial-majority voting | arxiv 2604.17139 | NEW (tangential — we don't vote, we synthesize) | REJECT (does not fit RT synthesis model) |
| 13 | Tool-use protocols | MCP at 97M monthly SDK downloads (Feb 2026); ACP merged INTO A2A (Aug 2025); AAIF formed Dec 2025 (OpenAI+Anthropic+Google+MS+AWS+Block) | a2a-mcp blog; jitendrazaa Feb 2026 | ALREADY-COVERED (consolidation, not new mechanism) | DEFER |
| 14 | Tool-use protocols | MCP code-execution servers — filter/transform data BEFORE LLM read, reduces token cost | onereach 2026 | NEW (small, infra-level) | ADAPT (relevant if EraDev exposes MCP server for projects/ — not yet planned) |
| 15 | Evaluation | Galileo 2026 framework: trajectory-level vs outcome-level metrics; LLM-as-judge with Cronbach α + 0.80+ Spearman vs human | galileo.ai blog 2026 | NEW (PARTIAL — we have Validator B-check but no judge calibration) | ADAPT (see TOP-5) |
| 16 | Evaluation | ICSE 2026 catalogue of evaluation metrics for LLM multi-agent SE frameworks | conf.researchr.org icse-2026 | NEW (catalog, not method) | DEFER until Validator role rev |

## Top 5 Most Actionable (ranked)

1. **Claude Opus 4.7 memory-tool / scratchpad improvements** (2026-04-16) — META already runs on this operator. Action: amend `meta.md` Section 14 to instruct META to write `projects/{name}/lessons.md` MORE granularly (per-task, not per-session) since Opus 4.7 is measurably better at scratchpad discipline. Effort: S. Direct B uplift on Λ (Experience).
2. **Semantic Consensus Framework (SCF)** — arxiv 2604.16339. Their "Drift Monitor" + "Semantic Intent Graph" map almost 1:1 onto our Coherent + ODTOE divergence detection. Action: spawn comparison RT — does our Coherent cover all 6 SCF components? Gaps probably: explicit Drift Monitor cadence + Conflict Detection Engine as a discrete artifact (we do it implicitly). Effort: M.
3. **Memento-Skills external skill memory** — venturebeat 2026. Our `BL_CANDIDATES.md → BL.md` promotion pipeline is the same mechanism in disguise. Action: audit our promotion cadence against Memento's empirical findings (skill expiry, conflict between old and new skills). Effort: S.
4. **Galileo trajectory-vs-outcome eval split + LLM-as-judge calibration** — Action: add Cronbach α requirement to Validator role for any task with `domain.verify.method = readability | dry_run` (subjective verifiers). Effort: S. Targets Validator's E_A reliability.
5. **MultiAgentBench milestone KPIs** — arxiv 2503.01935. Action: import 2-3 milestone metrics (e.g., role-handoff cleanliness, decision latency) as optional measurements in `reports/hansei-*` template. Effort: S. Strengthens Hansei evidence base.

## Honest Verdicts

- **Nothing actionable in long-context dimension.** 1M is the new normal; no new paper this window.
- **Frameworks consolidation (A2A/MCP/ACP under AAIF)** is org news, not technical news. We are not a framework — we are a discipline-on-top. DEFER permanently unless we publish EraDev as an MCP server.
- **OpenAI/Gemini reasoning advances** are operator-internal — they don't change our META protocol because we don't use those operators.

## B-check (B_research weights: w_(1-σ)=0.35, w_F=0.30, w_E=0.20, w_Λ=0.15)

- F (Focus, all 7 dims covered): 0.85 — covered all 7, negative result on dim 3
- E (Alignment, answers operator's actual question): 0.90 — research dimension, top-5 ranked
- (1-σ) (no resource conflict, source-grounded): 0.85 — every finding has arxiv/blog/docs source
- Λ (Experience, baseline-aware): 0.90 — explicitly contrasts against v9 baseline
- B = 0.35·0.85 + 0.30·0.90 + 0.20·0.85 + 0.15·0.90 = 0.2975 + 0.270 + 0.170 + 0.135 = **0.8725** ✓ (well above 0.5 ANDON line)

## Sources

- [Claude Opus 4.7 release docs](https://platform.claude.com/docs/en/about-claude/models/whats-new-claude-4-7)
- [Semantic Consensus arxiv 2604.16339](https://arxiv.org/abs/2604.16339)
- [Token-Level RR arxiv 2604.17139](https://arxiv.org/abs/2604.17139)
- [MultiAgentBench arxiv 2503.01935](https://arxiv.org/abs/2503.01935)
- [Self-Improving Test-Time arxiv 2510.07841](https://arxiv.org/abs/2510.07841)
- [Memento-Skills VentureBeat](https://venturebeat.com/orchestration/new-framework-lets-ai-agents-rewrite-their-own-skills-without-retraining-the)
- [Galileo agent eval framework 2026](https://galileo.ai/blog/agent-evaluation-framework-metrics-rubrics-benchmarks)
- [Gemini 3.1 Pro blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-1-pro/)
- [MCP/A2A consolidation 2026](https://dev.to/pockit_tools/mcp-vs-a2a-the-complete-guide-to-ai-agent-protocols-in-2026-30li)
- [GetStream agent protocols 2026](https://getstream.io/blog/ai-agent-protocols/)
