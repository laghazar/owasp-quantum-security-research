# CNSA 2.0 — Notes for QS01 and QS03

**Source:** NSA Commercial National Security Algorithm Suite 2.0
**Scope:** U.S. National Security Systems (NSS) only
**Not a commercial regulation**

---

## Timeline

| Year | Milestone |
|---|---|
| 2025 | New NSS acquisitions |
| 2027 | New NSS deployments |
| 2030 | Software/firmware signing exclusively CNSA 2.0 |
| 2033 | Full NSS transition |

---

## Algorithm-allowance for signatures

| Algorithm | NSS firmware/software signing |
|---|---|
| LMS (single-tree) | Approved |
| XMSS (single-tree) | Approved |
| ML-DSA | Approved |
| SLH-DSA | NOT approved |
| HSS (multi-tree LMS) | NOT approved |
| XMSS^MT (multi-tree XMSS) | NOT approved |

---

## Caveats

- Stateful HBS (LMS/XMSS) require strict state management
- Each key can produce only a fixed number of signatures
- State reuse breaks the security guarantee
- HA / failover / backup / restore must guarantee no state duplication
- Library defaults may select HSS/XMSS^MT (not NSS-approved)

---

## How to reference CNSA 2.0 correctly

- Use as NSS-specific policy directive
- Do not generalize to commercial regulation
- Do not use as sole regulatory basis for commercial organisations
- For commercial use, refer to FIPS 204 / FIPS 205 / FIPS 186-5

---

## Cross-references

- QS01 — HNDL exposure (contextual use of CNSA 2.0)
- QS03 — Vulnerable Signatures and Code-Signing (primary use for firmware/software signing)
