# Plugy — Project Verification Checklists

---

## 1. Pre-Commit (extends universal checklist)

- [ ] `go build ./...` passes for ALL modified Go services
- [ ] `go vet ./...` passes (no suspicious constructs)
- [ ] Python: `python -m py_compile` on modified .py files
- [ ] No hardcoded IPs, passwords, API keys (check: `grep -r "sk-proj\|password\|WcA-i3K" services/`)
- [ ] No `fmt.Println` / `print()` debug statements (use `slog` / `logger`)
- [ ] KEY_ tokens in AI responses are parsed, not leaked to user (CleanResponse applied)
- [ ] New Go service added? → update `go.work` + `autodeploy.sh` GO_SERVICES array + systemd unit
- [ ] New Python service? → update `requirements.txt` + Dockerfile + systemd unit
- [ ] New DB table? → migration file in `deploy/migrations/` (idempotent, BEGIN/COMMIT)
- [ ] Fix chain counter: if 3rd consecutive fix → ANDON → write spec first (L-012)
- [ ] Telegram formatting: no `<code>` for IPs/server names (L-014, persona rule)
- [ ] Module credentials: never in env vars for multi-tenant, always from project config JSONB

---

## 2. Pre-Deploy

- [ ] All Go services compile: `for svc in gateway conversation adapters/jivo adapters/telegram modules/*; do cd services/$svc && go build ./...; done`
- [ ] All Python deps installed: `/opt/plugy/venv/bin/pip install -r requirements.txt`
- [ ] Migrations applied: `make migrate` (all .sql files in order)
- [ ] Rules seeded: `python scripts/seed_rules.py --project-id justhost`
- [ ] Persona seeded: `python scripts/seed_persona.py`
- [ ] .env has ALL required vars (check .env.example)
- [ ] All systemd units in deploy/systemd/ copied to /etc/systemd/system/
- [ ] `systemctl daemon-reload` after unit changes
- [ ] All services healthy: curl healthz on ports 8080-8091
- [ ] Rollback plan: `git reset --hard HEAD~1` + restart services (< 2 min)
- [ ] CANARY_CHECKLIST.md: 7 acceptance criteria verified on live Telegram bot

---

## 3. Pre-Migration (n8n → Plugy)

- [ ] Shadow mode active: nginx mirrors JIVO webhooks to both n8n and Plugy
- [ ] Compare report generated: `python scripts/migration/02_compare.py`
- [ ] B-score from shadow ≥ 0.7 (equivalent to n8n quality)
- [ ] Canary project selected (Tegas first, per config.md migration order)
- [ ] JIVO webhook URL updated for canary project
- [ ] n8n workflow disabled but NOT deleted (30-day retention)
- [ ] Monitoring: 24h observation after canary switch
- [ ] Rollback script tested: `bash scripts/migration/05_rollback.sh --dry-run`

---

## 4. Security Baseline (Plugy-specific)

- [ ] JWT_SECRET is not the default "dev-secret-change-me" in production
- [ ] POSTGRES_PASSWORD is not "omnibot_dev_password" in production
- [ ] Module credentials encrypted in `module_credentials` table (AES-256-GCM)
- [ ] Admin Panel API: passwords masked in GET responses ("********")
- [ ] client_profiles: issue_history purged after 12 months (GDPR)
- [ ] project_learning / global_learning: no PII (regex + LLM-judge gate)
- [ ] TLS on all public endpoints (certbot auto-renewal active)
- [ ] UFW firewall: SSH + HTTP/HTTPS only
- [ ] Docker services bound to 127.0.0.1 (not 0.0.0.0)
- [ ] Webhook secrets validated (JIVO, Telegram, GitHub)

---

## 5. ONDA Quality Gate

- [ ] B_mean > 0.3 → Level 3 entry (ONDA-L3 complete)
- [ ] B_mean > 0.5 AND S_adjusted > 0.35 → Level 6 entry (ONDA-L6 complete)
- [ ] B_mean > 0.7 AND convergence criteria met → Level 9 entry (ONDA-LOOP active)
- [ ] Phantom coherence check: S_intra > 0.7 AND B_mean < 0.5 → ALERT
- [ ] Micro-verify: all scores > 0.3 on benchmark (FocusScore, MemoryScore, ConsistencyScore)
- [ ] AutoAgent Lyapunov guardian: ΔV < 0 for every prompt modification
