# Cloud Data Architect Technical Challenge

## Overview

This is a **design exercise, not a coding exercise.** You will read a scenario and a component team's architecture proposal submitted to the Architecture Review Board (ARB), then write a structured ARB Review Memo responding to the proposal.

We suggest budgeting around **2 hours** for this exercise. You are welcome to spend more time if you'd like, but we don't expect you to — a focused, well-reasoned memo is more valuable than an exhaustive one. If you don't cover everything, note what you left out and why; an incomplete submission that explains its own gaps will not be judged poorly.

---

## Background: The Enterprise Platform

You are the Cloud Data Architect for the **Agency for Health Data Analytics (AHDA)**, a federal health agency operating an enterprise cloud data and analytics platform hosted on **Azure Government**. The platform provides governed data storage, Databricks and Azure Synapse Analytics compute, and policy controls for data practitioners across the agency.

The platform is built on a **medallion lakehouse architecture** using Azure Data Lake Storage Gen2:

| Tier | Purpose | Data Classification Ceiling |
|------|---------|----------------------------|
| Bronze | Raw ingest — untransformed source data | CUI / PHI |
| Silver | Cleansed and conformed — PII tokenized or removed | CUI |
| Gold | Curated, analytics-ready — no raw PII or PHI | CUI / Low |

All Databricks workloads are governed through **Unity Catalog** for lineage tracking, access control, and audit. Analyst-facing tables are served exclusively from Gold-tier assets registered in Unity Catalog.

Identity follows **Zero Trust Architecture (ZTA)** principles enterprise-wide: least privilege, workload identity federation, and attribute-based access control (ABAC) at the data tier.

The platform holds an **Authority to Operate (ATO)** under the NIST Risk Management Framework (RMF). Any change that could affect the confidentiality, integrity, or availability of the system — including the introduction of new data sources — requires a **Security Impact Analysis (SIA)** prior to implementation, reviewed through the platform's change intake workflow.

The **ARB** reviews all proposals to onboard component platforms or add major capabilities. You chair the ARB.

---

## The Proposal

The Maternal and Child Health (MCH) Division has submitted the following proposal requesting ARB approval to onboard a new analytics platform as a component platform within the enterprise.

Read the full proposal: [`proposal.md`](./proposal.md)

---

## Your Task — ARB Review Memo

Using the template in [`arb-memo-template.md`](./arb-memo-template.md), write a structured ARB Review Memo. Your memo must:

- State your recommendation: **Approve**, **Approve with Conditions**, or **Defer**
- Identify every policy or design issue you find in the proposal
- For each issue: name the problem, cite the relevant policy, principle, or control it violates, and state precisely what the team must resolve before implementation
- Be specific enough that the MCH team can act on your feedback without a follow-up meeting

---

## Deliverables

Please submit your work at least **4 hours before** your scheduled review session. Create a **private GitHub repository** (or share your files directly) containing:

| File | Contents |
|------|----------|
| `arb-memo.md` | Your completed ARB Review Memo |
| `notes.md` *(optional)* | Anything you ran out of time on, assumptions made, or decisions you'd revisit |

During the review session you will walk through your memo, defend your recommendation, and discuss how you would apply these patterns on a live platform.

---

## Template

- [ARB Memo Template](./arb-memo-template.md)
