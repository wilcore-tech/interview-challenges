# Federal Government IT — Key Concepts Primer

This document provides brief explanations of federal government IT terminology that appears in the challenge. It is intended for candidates who have not previously worked in a federal agency context. If you are already familiar with these concepts, you can skip this document.

---

## Data Classification

**CUI — Controlled Unclassified Information**  
Government information that requires safeguarding or dissemination controls per law, regulation, or government-wide policy, but is not classified (i.e., not Top Secret / Secret / Confidential). CUI covers a wide range of sensitive categories including privacy data, law enforcement information, and certain health records. Agencies are required to mark, handle, and protect CUI per the CUI Program established by Executive Order 13556.

**PHI — Protected Health Information**  
Individually identifiable health information protected under the Health Insurance Portability and Accountability Act (HIPAA). PHI includes any information that could be used to identify a person combined with health or healthcare payment data. In a federal health agency context, PHI is typically also treated as CUI.

**Classification Ceiling**  
In a tiered data architecture, the highest data classification level that may reside in a given tier. Data must be de-identified, tokenized, or otherwise transformed before it can be promoted to a tier with a lower ceiling.

---

## Authorization and Compliance

**ATO — Authority to Operate**  
A formal declaration issued by an Authorizing Official (AO) that permits a federal information system to operate. An ATO is based on a security assessment demonstrating that the system's risks are acceptable. Without an ATO, a system may not legally process government data. ATOs are time-bounded and require continuous monitoring.

**NIST RMF — Risk Management Framework**  
The National Institute of Standards and Technology framework that federal agencies follow to manage cybersecurity and privacy risk. The RMF defines a lifecycle for achieving and maintaining an ATO: Categorize the system, Select controls, Implement controls, Assess them, Authorize the system, and Monitor it continuously.

**SSP — System Security Plan**  
The primary compliance document for a system under ATO. It describes the system boundary, the data it processes, and how each required security control is implemented. When changes are made that expand the system boundary or introduce new services, the SSP must be updated and potentially re-reviewed by the AO.

**SIA — Security Impact Analysis**  
A formal analysis required before making a change to a system under ATO, when the change could affect the confidentiality, integrity, or availability of the system. The SIA determines whether the change is within the existing ATO boundary or whether the ATO must be updated. Adding a new data source, connecting to a new external system, or introducing a new cloud service would each typically trigger an SIA.

**FedRAMP — Federal Risk and Authorization Management Program**  
A government-wide program that standardizes security assessment and authorization for cloud services used by federal agencies. Cloud service providers (like Microsoft Azure, AWS, Google Cloud) must achieve FedRAMP authorization at the appropriate impact level — Low, Moderate, or High — before federal agencies can use their services to process government data. Azure Government is FedRAMP High authorized, but not every individual Azure service within it is; each service must be checked.

**BAA — Business Associate Agreement**  
A contract required under HIPAA between a covered entity (such as a federal health agency) and any third party (a "business associate") that handles PHI on its behalf. The BAA establishes the permitted uses of PHI and the third party's obligations to protect it.

---

## Architecture and Security

**Zero Trust Architecture (ZTA)**  
A security model based on the principle "never trust, always verify." Rather than granting implicit trust based on network location (e.g., being inside the agency firewall), every access request must be explicitly authenticated and authorized, regardless of origin. In a data platform context, this means access controls must be enforced at the data layer — not only at the application or network layer.

**Least Privilege**  
A security principle requiring that any identity (user, service, application) be granted only the minimum permissions necessary to perform its function. In cloud infrastructure, this means scoping IAM roles and service principal assignments to the narrowest set of actions needed, not broad roles like Owner or Contributor.

**Workload Identity Federation**  
A mechanism that allows a workload (like a pipeline or application) to authenticate to cloud services using its own managed identity rather than a stored secret. This eliminates the need to manage, rotate, and protect long-lived credentials like client secrets or API keys.

---

## Platform-Specific Concepts

**Medallion Lakehouse Architecture**  
A data organization pattern that structures a data lake into three tiers — Bronze (raw ingest), Silver (cleansed/conformed), and Gold (curated, analytics-ready). Each tier progressively refines the data. In a government context, each tier also carries a data classification ceiling, requiring sensitive data to be de-identified or transformed before promotion.

**Unity Catalog**  
Databricks' centralized governance layer for data and AI assets on the Lakehouse. Unity Catalog provides fine-grained access control, data lineage tracking, and audit logging across all Databricks workspaces in an account. In this platform, Unity Catalog is the authoritative metadata and access control system — all data assets must be registered and governed through it.

**Hive Metastore**  
The legacy metadata catalog in Databricks, local to a single workspace. It does not support cross-workspace governance, fine-grained ABAC, or the lineage and audit features required by this platform. Data registered only in the Hive metastore falls outside the enterprise governance boundary.
