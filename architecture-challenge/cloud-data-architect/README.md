# Cloud Data Architect Technical Challenge

## Overview

This is a **design exercise, not a coding exercise.** You will read an architecture proposal that was rejected by the Architecture Review Board (ARB), then write a revised proposal that addresses every finding raised.

We suggest budgeting around **2 hours** for this exercise. You are welcome to spend more time if you'd like, but we don't expect you to — a focused, well-reasoned proposal is more valuable than an exhaustive one. If you don't cover everything, note what you left out and why; an incomplete submission that explains its own gaps will not be judged poorly.

---

## Background: The Enterprise Platform

You are a Cloud Data Architect supporting a component team at the **Agency for Health Data Analytics (AHDA)**, a federal health agency operating an enterprise cloud data and analytics platform hosted on **Azure Government**. The platform provides governed data storage, Databricks and Azure Synapse Analytics compute, and policy controls for data practitioners across the agency.

The platform is built on a **medallion lakehouse architecture** using Azure Data Lake Storage Gen2:

| Tier | Purpose | Data Classification Ceiling |
|------|---------|----------------------------|
| Bronze | Raw ingest — untransformed source data | CUI / PHI |
| Silver | Cleansed and conformed — PII tokenized or removed | CUI |
| Gold | Curated, analytics-ready — no raw PII or PHI | CUI / Low |

All Databricks workloads are governed through **Unity Catalog** for lineage tracking, access control, and audit. Analyst-facing tables are served exclusively from Gold-tier assets registered in Unity Catalog.

Identity follows **Zero Trust Architecture (ZTA)** principles enterprise-wide: least privilege, workload identity federation, and attribute-based access control (ABAC) at the data tier.

The platform holds an **Authority to Operate (ATO)** under the NIST Risk Management Framework (RMF). Any change that could affect the confidentiality, integrity, or availability of the system — including the introduction of new data sources — requires a **Security Impact Analysis (SIA)** prior to implementation, reviewed through the platform's change intake workflow.

The **ARB** reviews all proposals to onboard component platforms or add major capabilities.

---

## The Scenario

The **Maternal and Child Health (MCH) Division** drafted an architecture proposal to onboard a new analytics platform as a component platform within the enterprise. They submitted it to the ARB for approval. The ARB reviewed it and issued a rejection memo citing multiple policy and design issues.

Your job is to review the original proposal and the ARB's findings, then write a revised proposal that addresses every concern raised.

- **Original Proposal:** [`proposal.md`](./proposal.md)
- **ARB Rejection Memo:** [`arb-rejection.md`](./arb-rejection.md)

---

## Your Task — Revised Architecture Proposal

Write a revised version of the MCH Division's architecture proposal that:

- Directly addresses every finding raised in the ARB rejection memo
- Proposes a concrete, technically sound alternative for each flagged issue
- Explains the rationale for your design choices where the original proposal was silent or incorrect
- Is specific enough that the MCH team can implement it without a follow-up meeting
- Fully supports the MCH Division's stated analytics needs

You are not expected to redesign the entire proposal — sections the ARB did not flag can remain unchanged.

---

## What We're Looking For

This challenge doesn't have a single correct answer. Many of the ARB findings have more than one valid resolution, and different architects with real experience will make different defensible choices. What we're evaluating is whether you understand *why* each issue is a problem and *why* your proposed fix addresses it — not whether you arrived at the same answer as anyone else.

You will walk through your proposal live and defend your decisions. We'll ask questions like "why didn't you go with the alternative approach?" and "what would break if the MCH team changed X?" A well-reasoned proposal you can defend is worth more than an exhaustive one you can't explain.

---

## Reference Material

If you are not familiar with federal government IT terminology used in the platform background or ARB memo, see [`government-context.md`](./government-context.md) for a brief primer on key concepts.

---

## Deliverables

Please submit your work at least **4 hours before** your scheduled review session. Create a **private GitHub repository** (or share your files directly) containing:

| File | Contents |
|------|----------|
| `revised-proposal.md` | Your revised architecture proposal, including a **Design Decisions** section (see below) |
| `notes.md` *(optional)* | Anything you ran out of time on, assumptions made, or decisions you'd revisit |

### Design Decisions Section

Your `revised-proposal.md` must include a **Design Decisions** section at the end. For at least two of the choices you made in your revised architecture, describe:

1. What the decision was
2. What alternative approach you considered
3. Why you chose the approach you did

These don't need to be long — a short paragraph per decision is fine. The goal is to show your reasoning, not to demonstrate that you considered every possibility.
