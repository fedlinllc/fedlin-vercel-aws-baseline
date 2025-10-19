# Evidence Summary — Sample

**Scope**: Single account / single region (us-east-2)  
**Generated**: 2025-10-19T04:36Z

## Highlights
- Security Hub standards: **Enabled** (FSBP, CIS) — findings aggregated
- AWS Config: **Recording selected resource types** — drift visible
- API Gateway: CORS **restricted** to production origin
- IAM operations: **SSO-only**, no long-lived keys

## Findings snapshot (illustrative)
- Critical/High: 0 critical, 1 high (S3 bucket missing expected tag)  
- Medium/Low: 3 medium (SG overly broad egress), 5 low (minor tag gaps)

## Evidence artifacts (example)
- `evidence.json` — raw findings & inventory
- `summary.md` — this file (human-readable)

> Contact us to run this against your environment and produce a real evidence pack.
