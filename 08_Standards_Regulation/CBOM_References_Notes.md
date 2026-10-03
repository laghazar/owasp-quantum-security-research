# CBOM — References and Notes

Reference notes for cryptographic inventory and CBOM citations used across
QS04, QS05, and other entries.

---

## CycloneDX CBOM

- **Purpose:** Machine-readable representation of cryptographic assets and
  their relationships.
- **CBOM support:** Added in CycloneDX 1.6 (2024).
- **Asset types:** cryptographic-asset with subtypes: algorithm, protocol,
  certificate, key, token, secret.
- **Relationships:** Cryptographic assets can reference each other (e.g.,
  certificate securedBy key, key usedBy algorithm).
- **Version precision:** Specify CycloneDX 1.6 or later when referencing.

---

## CycloneDX Cryptography Registry

- **Purpose:** Canonical machine-readable definitions for algorithms, curves,
  and cryptographic primitives.
- **Problem solved:** Naming inconsistency across tools and vendors (RSA vs
  RSA-2048 vs RSA2048 vs RSASSA-PKCS1-v1_5).
- **Use in QS04:** Supports normalization and canonical naming.

---

## CycloneDX use case documentation

- **Cryptographic key inventory use case:** Field-level modeling examples for
  key inventory (state, size, format, creation/activation/expiration dates,
  securedBy, relatedCryptographicAssets).
- **Cryptographic certificate inventory use case:** Field-level modeling
  examples for certificate inventory.

---

## SPDX — precision note

The current SPDX specification has profiles (Core, Software, Security,
Hardware, Service, SupplyChain, Operations) and extension mechanisms. The
statement that SPDX provides a standardized cryptographic extension
equivalent to CycloneDX CBOM should be treated with caution.

**Recommended wording:**
> "Adopt a machine-readable cryptographic inventory representation, using an
> established CBOM model such as CycloneDX where appropriate, or a clearly
> defined standards-based extension or representation for other BOM
> ecosystems."

---

## SBOM vs CBOM boundary

| Artifact | Records | Primary audience | Standard |
|---|---|---|---|
| SBOM | Software components and origins | Software supply chain | SPDX, CycloneDX |
| CBOM | Cryptographic assets and relationships | Crypto / security / migration | CycloneDX CBOM |

Both should be maintained and cross-referenced. Neither substitutes for the
other.

---

## Cross-references

- QS04 — Cryptographic discovery and inventory (parent entry)
- QS05 — Crypto agility (consumes CBOM)
- QS06 — Secure migration (consumes CBOM)
- 06_Financial_Services_Profile/03_Crypto_Inventory_Financial_Services.md
