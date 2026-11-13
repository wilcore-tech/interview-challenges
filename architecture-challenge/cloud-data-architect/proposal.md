# MCH Division Analytics Platform — Architecture Proposal

**Submitted to:** Enterprise Architecture Review Board  
**Submitted by:** MCH Division Data & Analytics Team  
**Review requested:** ARB approval to proceed with infrastructure provisioning  
**Version:** 1.0

---

## 1. Executive Summary

The Maternal and Child Health (MCH) Division requests ARB approval to onboard a new analytics platform as a component platform within the enterprise data and analytics environment. The platform will enable MCH analysts to access longitudinal health records for program participants and generate actionable insights to support program delivery and reporting obligations.

---

## 2. Background and Motivation

The MCH Division currently generates reports by running manual SQL queries directly against its operational case management database (CMS), hosted on-premises at the agency's co-located data center. This approach creates performance pressure on the operational system, produces inconsistent results across teams, and prevents adoption of modern analytics tooling.

The proposed platform will:

- Decouple analytics workloads from the operational system
- Provide a stable, versioned copy of program data for analysis
- Enable self-service analytics for approximately 15 analysts across four MCH program offices

---

## 3. Data Description

The MCH CMS contains longitudinal health records for approximately **2.4 million** program participants. Records include:

| Data Element | Classification | Notes |
|---|---|---|
| Participant demographics (name, DOB, SSN) | PHI / CUI | Covered under HIPAA Business Associate Agreement |
| Health encounter records | PHI / CUI | — |
| Program enrollment and status | CUI | — |
| Aggregate outcome metrics | Unclassified | Derived; no PII |

---

## 4. Proposed Architecture

### 4.1 Ingestion

An **Azure Data Factory (ADF)** pipeline will extract data from the MCH CMS using a JDBC connection over the existing site-to-site VPN between the co-located data center and the agency's Azure Government landing zone. Full load on the initial run; incremental (changed-data) loads nightly thereafter.

Extracted records will land in **Delta Lake tables** in the MCH workspace under the `mch_gold` schema, registered in the MCH Databricks workspace's default Hive catalog.

### 4.2 Storage

Data will be stored in **Azure Data Lake Storage Gen2** in the `mch-prod` container within the enterprise storage account. Because MCH analysts require access to full participant records for case-level reporting — including demographics and encounter histories — extracted records will be written directly to the **Gold tier** of the enterprise data lake.

### 4.3 Compute — Databricks Workspace

The MCH Division will operate a dedicated Databricks workspace (`dbx-mch-prod`) provisioned within the MCH Azure resource group (`rg-mch-prod`). The workspace will authenticate to Azure resources using a service principal (`sp-mch-databricks`) granted **Contributor** role on `rg-mch-prod`. The service principal client secret will be stored as a pipeline variable in the MCH Azure DevOps project for use in ADF and notebook-triggered jobs.

### 4.4 Compute — Analytics Query Layer

A **dedicated SQL Warehouse** (Always On, XL, 16 DBUs) will serve Power BI Direct Query connections for MCH analysts. The warehouse will remain active at all times to eliminate cold-start latency for the analyst population.

### 4.5 Data Catalog and Documentation

The MCH team will maintain a **data dictionary** in a SharePoint list documenting table schemas, field definitions, and data sources. This will serve as the authoritative metadata reference for MCH analytics assets.

### 4.6 Identity and Access

Analyst access to MCH dashboards will be managed through MCH's existing Active Directory security groups, enforced at the Power BI workspace level. No additional Databricks-level access controls are planned at this time, as all 15 analysts share equivalent data access needs and operate under the same BAA.

---

## 5. Network Connectivity

The ADF pipeline will connect to the on-premises CMS using the **existing site-to-site VPN**. The team has confirmed with network operations that the VPN is already in place and functional. No new network infrastructure, firewall rule changes, or additional routing configurations are anticipated.

---

## 6. Compliance and Security

The proposed platform will operate within the **existing ATO boundary**. No new FedRAMP-authorized services beyond those already in the platform's SSP are being introduced. The MCH CMS already carries its own system boundary and SSP documentation at the agency.

Data classification and handling will comply with the agency's CUI policy. PHI handling will remain under the existing BAA with the program's healthcare partners.

---

## 7. Cost Estimate

| Resource | Configuration | Monthly Estimate |
|---|---|---|
| Azure Data Lake Storage Gen2 | LRS, ~500 GB | ~$10 |
| Azure Data Factory | ~1,000 pipeline activity runs/month | ~$5 |
| Databricks Workspace | XL SQL Warehouse, Always On, 16 DBU/hr | ~$8,400 |
| Power BI Premium Per User | 15 seats | ~$150 |
| **Total** | | **~$8,565 / month** |

---

## 8. Proposed Timeline

| Milestone | Target |
|---|---|
| ARB approval | Week 1 |
| Infrastructure provisioning | Week 2–3 |
| Initial data load and validation | Week 4 |
| Analyst onboarding | Week 5 |

---

## 9. Open Items

The team acknowledges the following items are deferred to a post-launch phase:

- Disaster recovery and backup strategy for the Delta tables
- SLA commitments to analysts for pipeline freshness
- Long-term data retention and archival policy
