# Academic Lab -- Project Configuration

## Domain Adapter (v9)

```yaml
domain:
  type: code
  artifact:
    primary: source_file
    secondary: [config_file, deploy_script, nodes_json]
  verify:
    method: build
    command: "cd eradns && GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /dev/null . && cd ../eraweb && GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /dev/null . && cd ../eradeploy && go build -o /dev/null ."
    success_criteria: "all Go services build cleanly for Linux target, local tests pass, no manual server intervention needed (autodeploy handles deploy)"
  metrics:
    - name: B_modality
      value: text
    - name: strictness
      value: strict
  ood_scope: text-discrete
  languages: [en]            # single-language; no bilingual sync gate fires
  rigor_default: mixed        # v10 Bundle D — code services strict; research ideation/nodes-json design sometimes exploratory
  rigor_map:
    - segment: "eradns/**"
      level: strict
      rationale: "DNS resolver — protocol-level correctness"
    - segment: "eraweb/**"
      level: strict
      rationale: "reverse proxy — traffic-critical"
    - segment: "eradeploy/**"
      level: structured
      rationale: "deploy daemon — shape known; policy details emerge"
    - segment: "nodes.json"
      level: strict
      rationale: "single source of truth for node registry"
  examples:
    - "edit eradns -> local build -> git push -> autodeploy picks up -> rolling deploy across nodes"
    - "add new node -> copy deploy key -> clone repo -> crontab autodeploy -> autodeploy installs stack"
    - "bug fix -> RT-1 pipeline -> Builder + Validator -> git push -> monitor logs read-only"
  subdomains:
    - "eradns-go"
    - "eraweb-go"
    - "eradeploy-go"
    - "erachain-java"
    - "nextjs-frontend"
  skin: "templates/domain_skin.code.md"
```

**Notes:** `B_modality=text` — academic-lab is multi-service Go/TS/Java code, text-discrete. `strictness=strict` because Iron Rule #1 prohibits manual server modifications — only git push deploys. `verify.method=build` compiles for Linux target matching deploy environment. Servers are read-only via SSH (observe, don't act), so runtime verification happens post-deploy via monitoring not via builder actions.

## Architecture
- **eradns** (Go) -- DNS resolver: `eradns/`
- **eraweb** (Go) -- Reverse proxy: `eraweb/`
- **eradeploy** (Go) -- Deploy daemon (gossip + webhook + git poll): `eradeploy/`
- **Erachain** (Java) -- Blockchain node
- **Next.js** -- Frontend + API: `app/`, `lib/`
- **EraDev** -- Multi-agent framework: `eradev/`

## Servers (7 nodes)
Nodes: Toronto, Germany, Sao Paulo, New York, Turkey, Novosibirsk, Tel Aviv
Node registry: `eradns/nodes.json` (single source of truth)
Deploy: eradeploy daemon, legacy: autodeploy.sh via cron

## New Node Setup
1. SSH to new server
2. Copy GitHub deploy key from any working node: `/root/.ssh/github_deploy` + `.pub`
3. Configure SSH: `IdentityFile /root/.ssh/github_deploy` for github.com
4. `git clone git@github.com:txrx13/academic-lab.git /opt/academiclab`
5. `cp /opt/academiclab/scripts/autodeploy.sh /opt/autodeploy.sh && chmod +x /opt/autodeploy.sh`
6. `echo '* * * * * /opt/autodeploy.sh >> /var/log/autodeploy.log 2>&1' | crontab -`
7. Autodeploy installs: Java, Go, Node.js, pnpm, ipset, builds all services

## Iron Rules (violation = incident)

1. **NEVER modify servers manually -- OBSERVE, DON'T ACT.** All changes ONLY through git push. SSH = read-only (logs, diagnostics). If autodeploy fails, that's a CODE BUG -- fix via git push.
2. **Old service RUNS until new one is confirmed.** Build new -> verify new -> drain old -> swap -> undrain new.
3. **NEVER update all nodes simultaneously.** Rolling deploy: nodes update one by one. Dead nodes (Moscow) skipped.
4. **Every change goes through EraDev pipeline.** RT-1 -> Builders -> RT-2 -> RT-3. Even "quick fixes" need Builder + Validator.
5. **TEST LOCALLY before push.** Changed `eradns/*.go` -> `cd eradns && GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /dev/null .` Changed `eraweb/*.go` -> same. Changed `app/` -> `pnpm build`. Changed `eradeploy/*.go` -> `cd eradeploy && go build -o /dev/null .` Did NOT change service -> do NOT test it.
6. **Docs update WITH code.** Same commit. TESTING.md expanded with each new test. MEMORY.md with each lesson.

## Mandatory Agent Rules

- ZERO HARDCODE: no domain logic, MIME types, IPs, paths in Go/TS code. Use config, stdlib, config.json.
- FEATURE FLAGS: all new features in eradns/eraweb via config (`features` section), not hardcode.
- AUTODEPLOY: no manual server intervention. Everything via git push. SSH = monitoring only.
- PARALLELIZATION: maximize parallel work.
- ROADMAP: progress tracked in `docs/ROADMAP-v2.md`. Update status after each phase.
- Go for services: eradns, eraweb, eradeploy -- Go only. Frontend -- TypeScript/Next.js.
- nodes.json -- single source of truth for nodes. Path: `eradns/nodes.json`.
- Zero-downtime deploy: never update a node without drain.
- QUALITY > SPEED: no "quick fixes". Every solution must be universal. One quality commit > three fix commits.
- Max 2 PWA/mobile phases per session -- stabilization between them (MP12).
- Scroll/touch code: test in 3 browsers BEFORE writing (MP13).
- 3+ fix in a row on same topic = STOP, specification step (MP11).

## Testing
Full test suite before deploy: `docs/TESTING.md`
