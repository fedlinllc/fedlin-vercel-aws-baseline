# FEDLIN — Vercel × AWS Baseline

[![CI](https://github.com/fedlinllc/fedlin-vercel-aws-baseline/actions/workflows/ci.yml/badge.svg)](../../actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

<p align="center"><strong>Vercel × AWS baseline for regulated apps</strong><br/>
Astro on Vercel + API Gateway/Lambda, SSO-operated, compliance-ready (evidence add-on).</p>

<p align="center">
  <a href="https://fedlin-vercel-aws-baseline.vercel.app"><b>See the live baseline</b></a> ·
  <a href="https://fedlin.com/contact">Talk to us about compliance</a>
</p>

---

### What this proves
- **Production in hours**: Astro on Vercel calling a real AWS HTTP API (API Gateway → Lambda).
- **Security by default**: CORS pinned to your domain; SSO-only ops (no long-lived keys).
- **Compliance-ready**: Clean landing zone for continuous checks & evidence on demand.

### Who it’s for
- Teams shipping on **Vercel + Astro** facing **HIPAA / PCI** buyer questions.
- Leaders wanting **low ops, predictable spend**, and inspection-ready posture.

### What you get
- **Live, secure baseline**: Astro on Vercel calling a real AWS HTTP API (`/health`).
- **Security by default**: CORS pinned to your domain; SSO-only operations.
- **Compliance-ready**: Evidence automation path via AWS Config/Security Hub (optional add-on).


---

## Optional add-on: Compliance Pack (HIPAA/PCI-ready)
A lightweight AWS layer alongside your Vercel/Astro site that keeps you inspection-ready.

- **Continuous checks** (single region): enable Security Hub (FSBP/CIS) + Config (selective recording)  
- **Evidence on demand**: API endpoint compiles findings & inventory to S3 (JSON + summary.md)  
- **Guardrails**: CORS pinned to prod, SSO-only ops, throttling defaults, log-retention caps, lifecycle on artifacts

> Not a certification product. We automate technical controls & evidence—**you own policy & process**.  
> More: `docs/compliance-pack.md`

> **Scope & Limitations**
> - This repository demonstrates *technical controls & evidence automation*.
> - It is **not** a certification product (HIPAA/PCI). Policy & process remain customer-owned.
> - The live demo uses a public health endpoint only; admin/privileged routes require authentication.


---

## License
MIT — see [LICENSE](./LICENSE).
