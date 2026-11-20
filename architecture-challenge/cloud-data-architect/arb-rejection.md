# Architecture Review Board — Rejection Memo

**Proposal:** MCH Division Analytics Platform Onboarding  
**Submitted by:** MCH Division Data & Analytics Team  
**ARB Decision:** Defer — Resubmit Required  
**Date of Review:** [redacted]

---

## Decision

The ARB is unable to approve this proposal as submitted. The findings below identify policy violations and design deficiencies that must be resolved before this platform can proceed to provisioning. The MCH team must address all findings and resubmit a revised proposal for ARB review.

---

## Findings

---

### Finding 1 — Data Classification Violation: PHI Written to Gold Tier

**Severity:** Critical

The proposal writes extracted records — including participant demographics (name, DOB, SSN) and health encounter records — directly to the Gold tier of the enterprise data lake. The enterprise platform's medallion architecture policy sets the data classification ceiling for the Gold tier at **CUI/Low**. PHI may not reside in the Gold tier.

The revised proposal must describe a compliant ingestion path for this data that respects the classification ceiling of each tier before data is promoted.

---

### Finding 2 — Governance Bypass: Hive Metastore Instead of Unity Catalog

**Severity:** Critical

The proposal registers Delta Lake tables in the MCH workspace's default Hive metastore catalog (`mch_gold` schema). The enterprise platform requires all data assets to be registered in **Unity Catalog**. The default Hive metastore bypasses the platform's lineage tracking, audit logging, and attribute-based access control (ABAC) enforcement.

The revised proposal must describe how MCH data assets will be onboarded into Unity Catalog under the appropriate catalog/schema hierarchy.

---

### Finding 3 — Missing Security Impact Analysis

**Severity:** Critical

The proposal introduces a new data source containing CUI and PHI into the ATO boundary. Per the platform's change management policy, any change that could affect the confidentiality, integrity, or availability of the system requires a **Security Impact Analysis (SIA)** submitted through the platform's change intake workflow prior to implementation. No SIA was submitted with this proposal.

The revised proposal must include a commitment to submit an SIA through the established intake process before infrastructure provisioning begins.

---

### Finding 4 — Overprivileged Service Principal

**Severity:** Critical

The service principal `sp-mch-databricks` is granted the **Contributor** role on the entire resource group `rg-mch-prod`. The Contributor role grants broad control including the ability to create, modify, and delete any resource in the resource group. This violates the platform's least-privilege requirement under its Zero Trust Architecture policy.

The revised proposal must scope the service principal's permissions to only what is required for the specific operations it performs.

---

### Finding 5 — Secret Stored in Pipeline Variable

**Severity:** Critical

The service principal client secret is stored as a plain-text pipeline variable in the MCH Azure DevOps project. Secrets must not be stored in pipeline variables. The platform's credential management policy requires secrets to be stored in **Azure Key Vault** and accessed at runtime.

The revised proposal must describe a compliant credential management approach.

---

### Finding 6 — Access Control Enforced Only at Power BI Layer

**Severity:** Major

The proposal enforces analyst access exclusively at the Power BI workspace level. This does not constitute data-layer access control under the platform's Zero Trust Architecture policy. Access controls enforced only at the BI layer leave the underlying data accessible through other Databricks pathways.

The revised proposal must describe access controls enforced at the **Databricks/Unity Catalog layer**, not only at the BI presentation layer.

---

### Finding 7 — Non-Authoritative Metadata Catalog

**Severity:** Major

The proposal designates a SharePoint list as the authoritative metadata catalog for MCH analytics assets. The enterprise authoritative catalog is **Unity Catalog**. Component platforms may maintain supplementary documentation in other systems, but the authoritative metadata reference must be Unity Catalog.

The revised proposal must reflect Unity Catalog as the authoritative metadata and governance layer for all MCH data assets.

---

## Path to Resubmission

The MCH team must submit a revised proposal addressing all findings above. The revised proposal should describe the specific changes to the architecture for each finding and explain the rationale for the approach taken. The ARB does not require a full redraft — sections not flagged above may remain unchanged.

Questions regarding ARB policy or platform standards should be directed to the Platform Architecture team prior to resubmission.
