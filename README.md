# FEDLIN — Vercel × AWS Baseline

<p align="center"><strong>Compliance-ready baseline for Vercel & Astro</strong><br/>
Security-first (SSO, CORS-locked) with an AWS API you can extend with continuous checks and on-demand evidence.</p>

<p align="center">
  <img src="docs/img/architecture.svg" alt="Vercel → API Gateway/Lambda → S3 Evidence" width="720" />
</p>

<p align="center">
  <a href="https://fedlin-vercel-aws-baseline.vercel.app"><b>See the live baseline</b></a> · <a href="https://fedlin.com/contact">Talk to us about compliance</a>
</p>


**A compliance-ready “Hello-Prod” for Vercel & Astro.**  
Security by default (SSO-operated, CORS-locked) plus an AWS API you can extend with **continuous monitoring** and **on-demand evidence** for regulated buyers.

> Live demo: https://fedlin-vercel-aws-baseline.vercel.app  
> Contact: https://fedlin.com/contact

---

## What this baseline proves
- **Production in hours**: Astro on Vercel calling an AWS HTTP API (API Gateway → Lambda).
- **Security first**: CORS pinned to your domain; no long-lived keys (IAM Identity Center / SSO).
- **Compliance-ready**: Clean landing zone for Config/Security Hub evidence—without re-platforming.

## For whom
- Teams shipping sites/apps on **Vercel & Astro** that must answer **HIPAA / PCI** buyer questions.
- Leaders who want **predictable cost** and **low ops** while staying inspection-ready.

## What’s included
- Hardened front/back integration (Astro → API Gateway → Lambda `/health`)
- SSO-based operational workflow (no access keys)
- Optional **Compliance Pack** add-on (see docs/compliance-pack.md):
  - Continuous checks via AWS Security Hub & Config (single region to control cost)
  - Evidence pack on demand (JSON + summary.md) in S3
  - Guardrails: log retention caps, throttling defaults, lifecycle on artifacts

## What this is *not*
- Not a certification product. We automate technical controls & evidence—**you own policy & process**.
- Not a DIY tutorial. If you want us to enable the Compliance Pack, **talk to us**.

---

## Outcomes you can show tomorrow
- A live, secure baseline that calls a real AWS API
- A sample evidence summary (see `docs/evidence-summary.sample.md`) you can hand to stakeholders
- A clear path to continuous checks with cost controls

---

**Questions?** https://fedlin.com/contact
