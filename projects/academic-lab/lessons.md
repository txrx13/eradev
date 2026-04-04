# Academic Lab -- Project Lessons & Mega-Patterns

## Infrastructure Lessons (eradns, eraweb, autodeploy)

1. **Self->node latency != client->node latency.** NEVER use self-probe for client routing. Use ONLY real TLS client data (SubnetCache) or geographic estimation.
2. **Autodeploy restart loops: ALWAYS compare hash before write/restart.** Without hash comparison, autodeploy rewrites binary and restarts every minute even if nothing changed.
3. **Optimistic start = dead node in DNS at every restart.** Pessimistic start mandatory: new node starts with consensus=False, must prove reachability first.
4. **Build-hash may not match if commits are faster than autodeploy.** Force hash check every cycle -- compare source hash with binary hash, don't rely on "were there git changes."
5. **GeoIP unreliable for Northern Cyprus.** SubnetCache from real TLS handshakes is the only reliable source for such regions.
6. **ipset can block legitimate users during service instability.** Grace period on 5xx (3 min), auto-unblock after 15 min (was 60), whitelist node IPs.
7. **Browser security model blocks client-side networking.** CORS, mixed content, self-signed certs = 4 failed attempts at browser latency probing. ALWAYS use server-side proxy for cross-origin requests.
8. **autodeploy.sh = most dangerous file in the project.** 53 changes, controls systemctl on 7 nodes. Requires dry-run mode and hash-based change detection for ALL resources.
9. **Feature flag without E2E test = deploy bomb.** refuse_when_unhealthy enabled without test = full DNS outage, 4 HOTFIX. Feature flag CANNOT be enabled without: unit test ON/OFF, E2E on staging, canary on 1 prod node, 15 min observation.
10. **IPv6/protocol changes = canary deploy MANDATORY.** IPv6 saga: 7 commits, 4 HOTFIX, 2 Revert, site down twice. Protocol-level changes affect EVERY packet. ALWAYS: flag OFF -> 1 node -> 30 min -> rolling.
11. **Double TLS wrap = HTTP/2 framing error.** ServeTLS + tls.NewListener = double TLS. HTTP/1.1 worked, HTTP/2 crashed on 7/8 nodes. NEVER both -- either ServeTLS (wraps itself) or tls.NewListener + Serve.
12. **Cascade proxy: test the full chain, not individual hops.** 3 fixes in a row: wrong port, missing routing, stale health map. E2E test: drain node A -> request -> verify response through node B.
13. **Knowledge without enforcement = knowledge without effect.** (Loop 4) Rules existed but were IGNORED. Lambda=0 problem. Solution: pre-push hooks, decision-point checklists, automatic gates.

## Frontend Lessons (Next.js / React)

14. **Real blockchain data != happy path.** person 1052 crashes parser (birthday as string, null balances, string tags instead of array). ALWAYS get 5-10 real API responses before writing parser.
15. **Radix Dialog blocks pointer-events on body.** 4 fix commits on workaround. Solution: MutationObserver to reset pointer-events. When using UI library -- immediately check known issues on GitHub.
16. **LaTeX rendering in blockchain content is unstable.** Mixed delimiters, \bfseries, escaped braces. Solution: whitelist of supported commands + fallback to plain text on parse error.
17. **Author lookup in Erachain: maker != creator != registrar.** 4 attempts. Solution: author = resolved from list (last value), NOT from separate API request.
18. **Image proxy mandatory for blockchain avatars.** Erachain serves images via HTTP. Next.js on HTTPS = mixed content block. Solution: API route /api/erachain?url=... as proxy.
19. **Infinite scroll + pagination: offset != start.** Erachain API uses offset for persons, start=height for blocks. Document pagination protocol per endpoint.

## Crypto & Blockchain Protocol Lessons

20. **Erachain protocol is undocumented.** Each transaction type requires reverse engineering from Java code. Budget x3 time for crypto/protocol tasks.
21. **Amount encoding: NOT_ENOUGH_FEE.** Erachain uses specific format (not standard BigInt). ALWAYS verify broadcast result before showing success to user.

## PWA & Mobile Lessons

22. **useIsMobile must return false on SSR.** matchMedia unavailable on server. For conditional DOM structure before hydration -- use CSS classes (lg:hidden), NOT JS hook.
23. **eradeploy stale-binary loop.** Execute() MUST check NeedsBuild() even when HEAD==origin/main.
24. **SW precache + stale-while-revalidate for HTML = version mismatch.** Solution: network-first for HTML, do NOT precache '/', version caches.
25. **eradeploy restart WITHOUT drain = 1-2s dead zone per node.** Solution: backend-drain -> restart -> health check poll -> undrain.
26. **overflow-x:hidden on html breaks position:sticky in ALL browsers.** CSS spec issue. Solution: overflow-x:hidden only on body, NOT on html.
27. **PWA scroll: don't duplicate browser APIs, don't add auto-hide without testing on 3+ browsers.** 3 bugs from one decision (auto-hide with scroll/touch listeners). Solution: remove auto-hide entirely, don't duplicate Radix scroll lock, test on Yandex + Chrome + Safari.

---

## Mega-Patterns (Meta-Agent Loops 3-6)

### MP1: Verify before act, at the layer you're acting on
Writing frontend? Get real API response BEFORE writing component. Writing autodeploy? Verify hash comparison on real files. Integrating protocol? Study reference implementation.

### MP2: Fix chain = absence of specification
3+ fix commits on one component = development started without sufficient research. FIRST step for NEW task = research and documentation (30 min), NOT code. Saves 3 hours of fix chain.

### MP3: Blast radius determines quality standard
autodeploy.sh (7 nodes, systemctl) requires 10x more testing than UI component. For infra: dry-run + staging + canary. For UI: rapid iteration acceptable.

### MP4: 50% commits = fix means exploration mode
Normal for first 500 commits. Goal: reduce fix rate to <30% by commit 1000 through accumulated specification and tests.

### MP5: Feature flag = deploy bomb if not tested E2E before enabling
Feature flag creates FALSE sense of security. FORBIDDEN to enable in production without: unit test (ON/OFF), E2E test, canary on 1 node, 15 min observation.

### MP6: Protocol-level changes need canary deploy on 1 node first
IPv6, HTTP/2, TLS versions affect EVERY packet. Error = 100% failure rate. Mandatory: flag OFF -> enable on 1 node -> 30 min monitoring -> rolling deploy.

### MP7: Cascade/multi-hop changes need E2E test
Test each hop individually is NOT ENOUGH. E2E: drain -> request -> verify response through full chain.

### MP8: Build MUST pass before git push -- enforce, not document
Rule "test locally" exists since Loop 1, but is VIOLATED. Documentation != habit. Need enforcement: pre-push hook or Makefile target.

### MP9: Proposal without implementation = Lambda zero
Meta-Agent proposes enforcement -> nobody creates git hook -> rule ignored -> same errors repeat. Every rule MUST have: 1) description in .md, 2) checklist in agent prompt, 3) automation (hook/CI), 4) verification in next loop.

### MP10: N feature flags in one deploy = N! failure modes
Max 1 flag activation per deploy cycle. Two flags = two separate deploys with monitoring gap.

### MP11: Fix chain length = inverse of specification quality
0-1 fix = specification exists. 7+ fix = no spec + protocol-level. If chain > 3 -> STOP -> specification step -> continue.

### MP12: Big bang multi-phase = revert risk
Max 2 phases per session, stabilization (test on 3 browsers) between phases mandatory.

### MP13: Browser scroll API = minefield, research before code
Test bench of 3 browsers (Chrome + Safari + Yandex) BEFORE writing scroll-related code.
