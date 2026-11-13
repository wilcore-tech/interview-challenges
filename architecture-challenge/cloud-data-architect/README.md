# Cloud Data Architect Technical Challenge

## Overview

This is a **design exercise, not a coding exercise.** You will read a scenario and a component team's architecture proposal submitted to the Architecture Review Board (ARB), then complete three tasks:

1. **ARB Review Memo** — Write a structured ARB response to the proposal.
2. **Architecture Decision Record** — Write a full ADR for the single most consequential decision in the proposal.
3. **Guardrails** — Define 2–3 reusable reference patterns or guardrails that would prevent this class of problem in future onboarding.

The expected effort is approximately **2–3 hours.** Complete treatment of one part is more valuable than shallow coverage of all three. If you reach the time limit before finishing, note what you didn't get to and submit what you have — we will not hold an incomplete submission against you.

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

## Your Tasks

### Task 1 — ARB Review Memo

Using the template in [`arb-memo-template.md`](./arb-memo-template.md), write a structured ARB Review Memo. Your memo must:

- State your recommendation: **Approve**, **Approve with Conditions**, or **Defer**
- Identify every policy or design issue you find in the proposal
- For each issue: name the problem, cite the relevant policy, principle, or control it violates, and state precisely what the team must resolve before implementation
- Be specific enough that the MCH team can act on your feedback without a follow-up meeting

### Task 2 — Architecture Decision Record

Using the template in [`adr-template.md`](./adr-template.md), write a full ADR for the **single most consequential decision** surfaced by the proposal. You choose which decision to document — your selection itself is part of the evaluation.

Your ADR should cover context, the decision, consequences (positive and negative), and at least two alternatives considered.

### Task 3 — Guardrails

Based on the issues you identified, define **2–3 reusable guardrails or reference patterns** that the enterprise architecture would publish to prevent this class of problem during future component platform onboarding.

Write these as short policy statements or pattern descriptions — a paragraph each is sufficient. Think of them as entries in an enterprise architecture standards catalog: specific enough to enforce, general enough to apply to any future onboarding team.

---

## Deliverables

Please submit your work at least **4 hours before** your scheduled review session. Create a **private GitHub repository** (or share your files directly) containing:

| File | Contents |
|------|----------|
| `arb-memo.md` | Your completed ARB Review Memo |
| `adr.md` | Your completed Architecture Decision Record |
| `guardrails.md` | Your 2–3 guardrail or pattern definitions |
| `notes.md` *(optional)* | Anything you ran out of time on, assumptions made, or decisions you'd revisit |

During the review session you will walk through your decisions, respond to follow-up questions, and discuss how you would apply these patterns on a live platform.

---

## Templates

- [ARB Memo Template](./arb-memo-template.md)
- [ADR Template](./adr-template.md)
