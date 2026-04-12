# Graphify vs EraDev v9 -- Comparison Research Note

> Date: 2026-04-12
> Role: [ANALYST] (EN stack)
> Task type: research / comparison
> B-modality: **B_text** (uniform weights, framework infrastructure)
> Scope: evaluate graphify (github.com/safishamsi/graphify) against EraDev v9 current architecture
> Operator question: "Is this approach already in EraDev, or is it something new?"

---

## 0. Activation Operator Log

- **A_F (Focus):** Fetched graphify README via WebFetch (full feature set, architecture, token claims). Read EraDev: CLAUDE.md (14 invariants, mandatory loading, self-loading context), meta.md Section 14 (13-item session bootstrap, tiered loading T1/T2/T3), MEMORY.md (Closet/Drawer pattern, 4 entries), reports/INDEX.md (92 reports indexed), Phase 2.B spec (memory hierarchy: T1/T2/T3 tiers, promotion/demotion rules, JIT loading), Phase 2.C spec (background extraction via CronCreate), BOOTSTRAP_LESSONS.md (BL-12, BL-16, BL-28), templates/extraction_prompt.md (constrained extraction agent).
- **A_E (Alignment):** Operator asked whether graphify offers something new or already exists in EraDev. This is a compare-and-classify task, not an adoption proposal. Report must be decisive -- ALREADY-IN / PARTIAL / NEW / IRRELEVANT per feature.
- **A_sigma (Consistency):** No write conflicts -- this is a read-only research report.
- **A_Lambda (Experience):** BL-11 (scope creep is Muda): evaluate graphify features against actual EraDev needs, not theoretical possibilities. BL-16 (reading != applying): if graphify has a genuinely better mechanism, say so.

All 4 steps GREEN.

---

## 1. Graphify -- What It Actually Does

**Source:** github.com/safishamsi/graphify README (fetched 2026-04-12)

### Architecture
- 3-pass scanning pipeline:
  1. **Deterministic AST** (Tree-sitter, 20 languages) -- extracts classes, functions, imports, call graphs
  2. **Audio/video transcription** (faster-whisper) -- local, cached
  3. **Semantic extraction** (Claude subagents) -- concepts and relationships from docs/papers/images
- Graph backend: NetworkX with Leiden community detection (no embeddings, no vector DB)
- Interactive visualization: vis.js (graph.html)

### Output artifacts
| Artifact | Purpose |
|----------|---------|
| `graph.json` | Persistent queryable knowledge graph (NetworkX format) |
| `graph.html` | Interactive visualization (clickable nodes, community filtering) |
| `GRAPH_REPORT.md` | One-page summary: god nodes, cross-domain connections, questions |
| `wiki/` (optional) | Wikipedia-style markdown articles per community cluster + index.md |
| `cache/` | SHA256-indexed incremental update cache |

### Key claims
- 71.5x token reduction (52-file corpus: Karpathy repos + papers + images)
- 5.4x on smaller 4-file corpus
- "Always query the graph first, only read raw files when explicitly told"

### Integration model
Adds 3 rules to CLAUDE.md:
1. Always query knowledge graph first
2. Only read raw files if explicitly instructed
3. Use graphify-out/wiki/index.md

---

## 2. Comparison Table

| Dimension | graphify | EraDev v9 | Gap? |
|-----------|----------|-----------|------|
| **Project structure indexing** | Auto-generates graph from AST + semantic analysis. Full codebase scan. | No auto-generated structural index. Structure is implicit in file organization (roles/, projects/, templates/, reports/). META and agents navigate by knowing the file tree convention. | PARTIAL -- EraDev knows WHERE things are (by convention) but has no machine-generated structural map |
| **Token optimization** | Graph-first querying: read compact GRAPH_REPORT.md instead of raw files. Claims 5-70x reduction. | Self-loading architecture (Invariant 12): agents read only their role file + task-specific files. Tiered memory (T1/T2/T3) with JIT loading. META never embeds role content. | ALREADY-IN but different mechanism. EraDev optimizes by selective loading; graphify by compression/summarization. |
| **Navigation strategy** | "Query graph first" -- agent asks graph for relevant nodes before reading files | Convention-based: CLAUDE.md defines 6-file mandatory loading sequence. META knows paths by convention. Agents self-load role files by path. | PARTIAL -- EraDev navigation is deterministic but manual. No "ask the index" capability. |
| **Auto-generation** | Fully automated: run `/graphify .` and it scans, builds graph, generates wiki/report | Manual: reports/INDEX.md is hand-maintained. MEMORY.md is hand-maintained. No auto-scan of codebase. | PARTIAL -- EraDev has indexes but they are manually maintained. Phase 2.C adds auto-extraction of patterns (BL_CANDIDATES) but not structural indexing. |
| **Visualization** | graph.html (vis.js interactive), optional Obsidian 3D plugin | None. No visualization of project structure or knowledge relationships. | NEW |
| **Knowledge graph** | NetworkX graph with typed edges, confidence scores, community clusters | No knowledge graph. Knowledge is stored as flat files (lessons.md, BL, MEMORY.md drawers). Relationships are implicit. | NEW -- but see Section 4 for whether this matters |
| **CLAUDE.md integration** | Adds 3 navigation rules to CLAUDE.md | CLAUDE.md contains 14 invariants, 6-step loading sequence, domain awareness, language stack detection. Much richer but no graph integration. | N/A -- different architectures |
| **Cross-file relationship tracking** | Explicit edges between concepts across files with confidence scores | Implicit via lessons.md cross-references, BL references, report chains. Phase 2.B adds cross-project scanning. | PARTIAL -- EraDev tracks relationships informally. Graphify makes them explicit and queryable. |
| **Incremental updates** | SHA256 cache: only re-process changed files | Every session starts fresh (cold-start by design). MEMORY.md persists across sessions via Claude Code. | PARTIAL -- EraDev's cold-start is intentional (prevents stale state), but lacks incremental awareness. |
| **Multi-modal input** | Scans code, docs, images, audio/video | Text-only (markdown, code). No image/audio processing. | IRRELEVANT for EraDev's text-discrete scope (v9 OOD boundary) |

---

## 3. Per-Feature Classification

### 3.1 ALREADY-IN-V9

| Feature | graphify version | EraDev mechanism |
|---------|------------------|------------------|
| **Token optimization** | Compressed graph instead of raw files | Invariant 12 (self-loading), T1/T2/T3 tiered loading (Phase 2.B spec), JIT drawer loading, META context kept lean by delegation |
| **Selective file reading** | "Only read raw files if explicitly told" | Agents read only their role file + task-specific artifacts. META never reads code directly (Invariant 10). |
| **Session knowledge capture** | Not a graphify feature (it indexes static files) | Phase 2.C background extraction (CronCreate + extraction_prompt.md -> BL_CANDIDATES.md) |

**Verdict:** EraDev's token optimization is architecturally different but equivalent in effect. graphify compresses ALL files into a graph and queries it. EraDev avoids loading unnecessary files in the first place. Both solve the same problem (context window management) but EraDev's approach is more aligned with multi-agent delegation (each agent loads only what IT needs).

### 3.2 PARTIAL

| Feature | graphify has | EraDev has | What's missing |
|---------|-------------|------------|----------------|
| **Project structure index** | Auto-generated, AST-based, machine-queryable | Convention-based file tree + manually maintained reports/INDEX.md and MEMORY.md | Auto-generation of structure index. EraDev could benefit from a lightweight file-tree manifest. |
| **Navigation index** | wiki/index.md as single entry point for all knowledge | CLAUDE.md as entry point -> 6-step loading -> convention paths | A "what do we have and where" index that agents can query. Currently agents must know paths by convention. |
| **Cross-file relationships** | Explicit typed edges with confidence | Implicit references in lessons, BL, report chains | Explicit relationship tracking between framework components |

### 3.3 NEW

| Feature | Description | Value for EraDev |
|---------|-------------|------------------|
| **Interactive visualization** | graph.html with vis.js, optional Obsidian 3D | Would help OPERATOR (Anton) see framework structure, find god nodes, spot orphan files. NOT useful for agents. |
| **Knowledge graph (formal)** | NetworkX with Leiden clustering, typed edges | Overkill for EraDev. The framework has ~30 files with well-defined relationships. A formal knowledge graph adds complexity without proportional insight. |
| **Graph query language** | `graphify query "what connects X to Y?"` | Interesting for large codebases. EraDev has ~30 framework files -- the operator already knows connections. |

### 3.4 IRRELEVANT

| Feature | Why irrelevant |
|---------|---------------|
| **AST code scanning** | EraDev is a framework of markdown files + shell hooks. There is no meaningful AST to parse. |
| **Audio/video transcription** | v9 OOD boundary is text-discrete. Audio/video is out of scope. |
| **20-language support** | EraDev has no polyglot codebase to index. |
| **Community detection** | Leiden clustering adds value for large unknown corpora. EraDev's structure is hand-designed and known. |

---

## 4. Integration Value Assessment

### 4.1 Auto-generated structure index (PARTIAL gap)

- **Effort:** S (a simple script that walks the file tree and outputs a manifest.md)
- **Value for EraDev:** MEDIUM -- useful when the framework grows. Currently 30 files are manageable by convention. At 100+ files, a manifest becomes essential.
- **Conflict with v9?** NO. Additive to existing CLAUDE.md loading sequence. Could be a new T1 artifact or a generated section in reports/INDEX.md.
- **Recommended action:** DEFER -- not needed at current scale. Revisit if file count exceeds ~80.

### 4.2 Interactive visualization (NEW)

- **Effort:** M (generate a dependency graph of EraDev files, render as graph.html or use Obsidian)
- **Value for EraDev:** LOW for agents, MEDIUM for operator. The operator already knows the architecture. Visualization would be a nice-to-have for onboarding new contributors or presentations, not for daily operation.
- **Conflict with v9?** NO. Pure additive.
- **Recommended action:** DEFER -- nice to have, no leverage for v9 operations.

### 4.3 Knowledge graph (NEW)

- **Effort:** L (would need to define node types, edge types, build pipeline, maintain consistency)
- **Value for EraDev:** LOW. The framework is small enough that flat files + conventions work. A knowledge graph would be over-engineering at current scale. The 71.5x token claim is measured on 52-file mixed corpora -- EraDev's 30 framework files fit comfortably in context with selective loading.
- **Conflict with v9?** YES, partially. graphify's "always query the graph first" rule directly conflicts with Invariant 12 (agents self-load their role file as FIRST action). Adding a graph query step before role loading would violate the self-loading architecture and add a dependency on an external tool.
- **Recommended action:** REJECT -- conflicts with self-loading architecture, overkill for current scale.

### 4.4 "Graph-first navigation" CLAUDE.md rules (graphify's 3 rules)

- **Effort:** S (just 3 lines in CLAUDE.md)
- **Value for EraDev:** NEGATIVE. These rules would actively harm EraDev. Rule 1 ("always query knowledge graph first") adds latency and a dependency. Rule 2 ("only read raw files if explicitly told") directly contradicts EraDev's self-loading architecture where agents MUST read their role files. Rule 3 ("use graphify-out/wiki/index.md") introduces a single point of failure -- if the graph is stale, agents navigate blindly.
- **Conflict with v9?** YES -- fundamentally incompatible with Invariant 12 and the self-loading design.
- **Recommended action:** REJECT -- these rules are designed for a different architecture where agents don't know where their context lives.

---

## 5. Key Insight: Different Problem Domains

**graphify solves:** "I have a large, unknown codebase and my AI assistant wastes tokens reading irrelevant files."

**EraDev solves:** "I have a multi-agent framework where each agent has a defined role, known context paths, and structured delegation."

These are fundamentally different problems:

| Aspect | graphify's assumption | EraDev's reality |
|--------|----------------------|------------------|
| Codebase knowledge | Agent doesn't know the project | META knows exact file paths by design |
| File selection | Must discover which files are relevant | Agents are TOLD which files to load (Invariant 12) |
| Context management | Compress everything into a graph | Load only what each role needs (self-loading) |
| Agent architecture | Single agent, large context | 5-role delegation, each agent loads its own context |
| Token budget | Main bottleneck | Not the bottleneck (selective loading already optimizes) |

graphify is valuable for the common case: a developer using Claude Code on an unfamiliar or large codebase. EraDev is an orchestration framework with designed context paths -- the "unfamiliar codebase" problem doesn't apply.

---

## 6. TOP 3 Recommendations (by leverage/effort)

### 1. REJECT graph-first navigation (HIGH leverage, ZERO effort)
Do NOT adopt graphify's 3 CLAUDE.md rules. They conflict with EraDev's self-loading architecture (Invariant 12) and would degrade agent performance by adding an unnecessary indirection layer. EraDev's convention-based navigation is faster and more reliable for a framework of this size.

### 2. DEFER auto-generated manifest (MEDIUM leverage, S effort)
When EraDev file count exceeds ~80 files, create a simple `make manifest` script that generates a file-tree manifest with one-line descriptions. This would be a lightweight alternative to graphify's full knowledge graph. Not needed now -- current file count (~30 framework files + ~90 reports) is manageable with reports/INDEX.md + MEMORY.md.

### 3. CONSIDER Obsidian visualization for documentation only (LOW leverage, S effort)
If EraDev needs a presentation or onboarding artifact, an Obsidian vault with wiki-linked framework files could serve that purpose. This is NOT for agent consumption -- purely for the operator's structural overview. Low priority.

---

## 7. Answer to Operator's Question

**"Is this approach already in EraDev, or is it something new?"**

**Both.** The core value proposition of graphify (token-efficient context management) is ALREADY solved in EraDev v9 through a different and arguably better-suited mechanism: self-loading agents + tiered memory + JIT loading. EraDev agents don't need a knowledge graph because they are TOLD exactly what to load.

The genuinely NEW aspects of graphify (interactive visualization, formal knowledge graph, community detection) are low-value for EraDev at its current scale and would introduce architectural conflicts with the self-loading design.

**Bottom line:** graphify is a good tool for its target audience (developers using AI on large unfamiliar codebases). EraDev is not that audience. No adoption recommended at this time.

---

## 8. B-Check

```
=== JIDOKA SELF-CHECK ===
B-diagnostics (rate 0.0-1.0):
  F (Focus):       0.90 -- Read graphify README + 8 EraDev files. Did not inspect graphify source code (not needed for feature comparison).
  E (Alignment):   0.95 -- Directly answers operator's question with per-feature classification.
  (1-sigma):       0.95 -- No internal contradictions. All classifications consistent with evidence.
  Lambda:          0.85 -- Applied BL-11 (scope creep), BL-16 (reading != applying), BL-28 (context architecture). Could have consulted more lessons.
  B = 0.90 * 0.95 * 0.95 * 0.85 = 0.69
B >= 0.5 and min >= 0.3: PASS.
```
