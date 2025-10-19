# Compliance Pack (HIPAA/PCI-ready)

A lightweight AWS layer alongside your Vercel/Astro site that keeps you inspection-ready.

**What clients get**
- **Continuous checks** (single region): enable Security Hub (FSBP/CIS) + Config (selective recording)
- **Evidence on demand**: an API endpoint compiles findings & inventory to S3 (JSON + summary.md)
- **Guardrails**: CORS pinned to prod, SSO-only ops, sensible throttling/log retention, lifecycle on artifacts

**Cost posture**
- One region, selective recording, lifecycle policies; turn on extras (HIPAA/PCI packs, WAF, SIEM) by tier.

> This is not a certification. It automates technical controls & evidence you can hand auditors.
