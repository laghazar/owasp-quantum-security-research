---
Title: QS04: Add Inventory Coverage, Evidence, and False-Assurance Controls
Labels: quantum-security, QS04, governance, very-high
Priority: Very High
Related OBS: QS04-OBS-009, 010, 011, 017, 020, 021, 026, 034, 035, 037, 038, 039, 049, 050, 051
Status: draft
---

## Problem

QS04 describes inventories as living documents but does not provide explicit
mechanisms for measuring whether the inventory is sufficiently complete,
current, and trustworthy.

An incomplete inventory can create false assurance, particularly when an
organisation declares PQC migration complete while unknown cryptographic
dependencies remain.

## Proposed improvement

Add explicit concepts for:

    Inventory coverage
    Dependency coverage
    Evidence coverage
    Freshness
    Unknown / unassessed assets
    Vendor-declared vs observed vs verified state
    Migration completeness

### Example metrics

    Inventory Coverage =
    Known Cryptographic Assets / Estimated Cryptographic Assets

    Dependency Coverage =
    Mapped Dependencies / Known Dependencies

    Evidence Coverage =
    Verified Records / Total Records

    Freshness =
    % Records Verified Within Defined Interval

    Unknown Crypto Rate =
    Unknown Records / Total Records

Unknown or stale cryptographic dependencies should be treated as residual
migration risk rather than silently excluded.

## Additional required elements

- Third-party / SaaS / cloud KMS visibility model
- Vendor-declared vs observed vs verified state model
- CBOM in software supply chain (procurement input)
- Legacy protocol discovery (SSL 3.0, TLS 1.0/1.1, SSHv1)
- Ownership granularity (business, system, crypto service, custodian,
  security, supplier)
- Key lifecycle fields expanded (creation, activation, expiration, rotation,
  backup, recovery, revocation, suspension, archival, destruction,
  compromise status)
- Inventory protection (no private keys in CBOM)
- Change management integration expansion
- Decommissioning lifecycle (Discovered / Active / Deprecated / Retired /
  Destroyed / Unknown)

## Security requirement

The inventory itself should be protected as sensitive security information,
and private keys, passwords, secrets, or raw secret values must not be placed
into a CBOM.

## Acceptance

- Coverage metrics defined
- Freshness metric defined
- Unknown state explicit
- Evidence states distinguished
- False assurance addressed
- Third-party / cloud KMS model defined
- Supply chain CBOM model defined
- Legacy protocol discovery referenced
- Inventory protection requirements stated
- Decommissioning covered
