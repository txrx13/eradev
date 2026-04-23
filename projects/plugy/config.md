# OmniBot Platform — Project Config

> EraDev project configuration | Last updated: 2026-04-02

---

## True North

Universal AI chatbot platform that replaces fragile n8n workflows with a modular, self-learning, multi-tenant system — and evolves into a commercial SaaS product for building AI-powered customer communication.

**IFR (Ideal Final Result):** Any business creates a fully functional AI support bot in under 10 minutes — picks channels, uploads docs, gets a working bot with analytics, self-learning, and Freshdesk/CRM integration. No code, no n8n, no vendor lock-in.

---

## Domain Adapter (v9)

```yaml
domain:
  type: code
  artifact:
    primary: source_file
    secondary: [proto_file, sql_migration, requirements_txt, nginx_config]
  verify:
    method: build
    command: "cd services/gateway && go build -o /dev/null ./... && cd ../../services/ai-provider && python -m pytest && cd ../self-learning && python -m pytest"
    success_criteria: "all Go services build cleanly, all Python services pass pytest, gRPC proto contracts match between Go and Python sides, no manual VPS intervention needed (autodeploy handles deploy)"
  metrics:
    - name: B_modality
      value: text
    - name: strictness
      value: strict
  ood_scope: text-discrete
  languages: [en]            # single-language; no bilingual sync gate fires
  examples:
    - "edit gateway -> local go build -> git push -> VPS autodeploy picks up in <1 min -> monitor"
    - "add Python dep -> update requirements.txt -> git push -> autodeploy installs in venv -> verify"
    - "add channel adapter -> update proto -> regen Go+Python stubs -> build both sides -> deploy"
  subdomains:
    - "go-services"
    - "python-ai-ml"
    - "expo-mobile"
    - "astro-marketing"
    - "grpc-nats-boundary"
  skin: "templates/domain_skin.code.md"
```

**Notes:** `B_modality=text` — plugy is text-discrete multi-language code (Go + Python + TS). `strictness=strict` because gRPC/NATS cross-language contracts are the #1 failure mode. `verify.method=build` runs both Go and Python build+test. The existing `## B-weight Override` section below stays SEPARATE from this block (per v9 OQ-A3 resolution: quality weights are independent of structural metadata). `domain.metrics` declares modality/strictness; B-weight override modifies F/E/(1-σ)/Λ weights.

---

## Classification

- **Size:** XL (4+ modules, architecture change)
- **Stack:** EN (implement/build) + RU (project communication)
- **Teams:** 2+ (Platform core + AI/ML layer)
- **Coherencer hierarchy:** L1 (within team) + L2 (Go ↔ Python boundary)

---

## Tech Stack

| Layer | Technology | Notes |
|:---|:---|:---|
| Platform core | **Go** | Gateway, Channel Adapters, Conversation Manager, Module Registry, Billing |
| AI/ML layer | **Python + FastAPI** | LiteLLM proxy, RAG Service, Self-Learning (DSPy) |
| Go ↔ Python | **gRPC (protobuf) + NATS** | Sync calls via gRPC, async events via NATS |
| Frontend | **Expo (React Native + Expo Router)** | Web + App Store + Google Play from one codebase |
| Marketing site | **Astro (SSG)** | Landing, pricing, blog, docs — SEO-optimized |
| Primary DB | **PostgreSQL** (RLS) | Tenants, projects, conversations, users, billing |
| Vector DB | **pgvector** (MVP) → **Qdrant** (scale) | RAG embeddings, per-tenant collections |
| Cache / Sessions | **Redis** | Hot sessions, config cache, pub/sub |
| Message Queue | **NATS + JetStream** | Inter-service messaging with persistence |
| AI Abstraction | **LiteLLM** | Unified interface to OpenAI, Gemini, self-hosted models |
| Monitoring | **Prometheus + Grafana + Loki + OpenTelemetry** | Metrics, logs, distributed tracing |
| Billing | **Payment Abstraction Layer (Go)** | Stripe, PayPal, Payssion, Cryptomus, T-Bank, YooMoney |

---

## Architecture Nodes

```
Marketing (Astro) ─── API Gateway (Go) ─── Admin Panel (Expo)
                            │
              ┌─────────────┼─────────────┐
              │             │             │
      Channel Adapters  Conv. Manager  Module Registry
         (Go)             (Go)           (Go)
              │             │             │
              └──────── gRPC ────────────┘
                            │
              ┌─────────────┼─────────────┐
              │             │             │
        AI Provider     RAG Service   Self-Learning
      (Python/LiteLLM) (Python/FAPI) (Python/DSPy)
```

**Channels:** JIVO, Telegram, WhatsApp (future), VK (future), Web Widget (future)
**Modules:** ServiceCheck, FreshdeskCRM, BillingStub, RetentionFlow, GeoIPFix, IncidentStatus
**AI Providers:** OpenAI (Responses API), Gemini 2.5 Flash/Pro, self-hosted (Llama/Mistral/Qwen)

---

## Key Constraints

- **Assistants API deadline:** August 26, 2026 — must migrate to Responses API before this
- **JIVO timeout:** 3 seconds for webhook response (2 retries = 9 sec window)
- **Multi-tenant isolation:** PostgreSQL RLS, per-project Redis namespaces, per-tenant Qdrant collections
- **No App Store IAP:** billing through web only (Stripe/etc.), mobile apps = login + access

---

## B-weight Override

Default weights (w1=w2=w3=w4=0.25) adjusted for this project:

| Component | Weight | Rationale |
|:---|:---|:---|
| **F** (Focus) | 0.20 | Standard |
| **E** (Alignment) | 0.25 | Critical — bot must solve the RIGHT problem |
| **(1-σ)** (Consistency) | 0.35 | **Boosted** — multi-service system, contradictions between Go/Python/Expo layers are the #1 risk |
| **Λ** (Experience) | 0.20 | Standard |

Consistency weight boosted because the system spans 3 languages (Go, Python, TS), 3 communication protocols (gRPC, NATS, REST), and multiple deployment targets. Interface contracts between layers are the primary failure mode.

---

## ODTOE Integration Points

| ODTOE Concept | Application in OmniBot |
|:---|:---|
| B = F * E * (1-σ) * Λ | Bot quality metric (B-score per project) |
| READ / WRITE / VERIFY / SYNC | Message lifecycle: receive → generate → validate → sync |
| Strange Loop (Φ = ι ∘ Ô) | Self-learning feedback loop (dialog → outcome → prompt optimization) |
| P_coll = 1 - ∏(1 - Bi^k) | Multi-LLM reliability (ChatGPT + Gemini → 97% correctness) |
| S_team coherence | Cross-dialog consistency metric (alert if S < 0.5) |
| Spiral gap ~2% | Continuous improvement: each self-learning cycle leaves ~2% open questions |
| D-Prot hierarchy | Data isolation levels: platform → project → conversation → message |
| SCW matrix (4-tact cycle) | AI Studio: instruction generation follows expand-compress-expand-compress |

---

## Repo Structure

```
plugy/
  eradev/
    eradev.md                    # Universal core (this framework)
    projects/plugy/
      config.md                  # THIS FILE
      lessons.md                 # Incidents, patterns, spiral memory
  ROADMAP.md                     # Full project roadmap
  services/
    gateway/                     # Go: API Gateway
    adapters/                    # Go: Channel Adapters (JIVO, Telegram, ...)
    conversation/                # Go: Conversation Manager
    modules/                     # Go: Module Registry + modules
    billing/                     # Go: Payment Abstraction Layer
    ai-provider/                 # Python: LiteLLM + AI Provider
    rag/                         # Python: RAG Service
    self-learning/               # Python: DSPy, feedback loops
  packages/
    proto/                       # Protobuf definitions (Go ↔ Python)
    shared/                      # Shared types, constants
  admin/                         # Expo: Admin Panel (Web + iOS + Android)
  marketing/                     # Astro: Marketing site
  deploy/
    docker-compose.yml           # Local development
    k8s/                         # Kubernetes manifests
```

---

## Current Bots (migration targets)

| Bot | Project ID | Complexity | Channels | Key Modules |
|:---|:---|:---|:---|:---|
| **JustHost** | `justhost` | High | JIVO | ServiceCheck, Freshdesk, RetentionFlow, IncidentStatus, GeoIPFix |
| **MeduzaVPN** | `meduzavpn` | Medium | JIVO | Sales flow, KEY_TO_OPERATOR |
| **Tegas** | `tegas` | Low | JIVO | Sales flow, KEY_TO_OPERATOR |

Migration order: Tegas (canary) → MeduzaVPN → JustHost (last, most complex).

---

## Deployment (VPS: 150.251.139.218)

**Autodeploy:** `scripts/autodeploy.sh` via cron (every minute). On any git push to main:
1. `git fetch` + `git reset --hard origin/main`
2. Rebuild ALL Go services → `/opt/plugy/bin/`
3. Install AI Provider deps (`services/ai-provider/requirements.txt`) via `/opt/plugy/venv/`
4. Install Self-Learning deps (`services/self-learning/requirements.txt`) via `/opt/plugy/venv/`
5. Apply SQL migrations (`deploy/migrations/*.sql`)
6. Sync nginx configs, static files, prompts

**Key rule:** Never deploy manually — just `git push`, VPS picks up in <1 minute.

**Python dependencies that MUST be in autodeploy:**
- `services/ai-provider/requirements.txt` — LiteLLM, FastAPI
- `services/self-learning/requirements.txt` — httpx, numpy, pydantic, google-generativeai

**Adding new dependencies:** Add to the relevant `requirements.txt`. Autodeploy will install on next push. For system-level packages (not pip), add install step to `autodeploy.sh` section 3b.
