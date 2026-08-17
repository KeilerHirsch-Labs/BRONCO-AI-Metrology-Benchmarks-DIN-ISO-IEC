# FC-001 — Policy-Driving AI Evaluation Provenance

**Status:** Open  
**Field-case type:** Measurement provenance / reproducibility / policy relevance  
**Primary public discussion:** [anthropics/claude-code#87086](https://github.com/anthropics/claude-code/issues/87086)

## Scope

This field case examines a narrow measurement question:

> When AI capability evaluations are used to support regulation, deployment restrictions, national-security policy or similar consequential decisions, can the reported numbers be independently reproduced and interpreted as measurements of the intended system rather than an inseparable combination of model, harness, scaffold, information access and trial conditions?

The current real-world test object is Anthropic's public safety- and policy-relevant evaluation record because it combines unusually strong public documentation, independent evaluation work, policy relevance and measurable experimental-condition questions.

This case does **not** presume fraud, intentional manipulation or misconduct.

## Why Anthropic is the first case

Anthropic publicly describes itself as a **"safety-first company,"** states **"Safety Is a Science,"** and says it aims to **"set the industry bar for AI safety and security."**

BRONCO takes those claims seriously. A company seeking to set the industry's safety bar is an especially useful first field case for testing whether safety- and policy-relevant measurements are reproducible, uncertainty-aware and independently auditable.

**No misconduct is presumed. If you aim to set the bar, the bar itself should be measurable.**

This selection rule is intended to be vendor-neutral. Other organizations should become later field cases when they present similarly consequential measurement claims with sufficient public evidence to audit.

## Research question

Can the policy-driving capability figures be reproduced end to end by an independent evaluator, and can the contribution of the model be distinguished from the contribution of:

- evaluation harness or agent scaffold;
- internet/network access;
- tools and filesystem access;
- retry and trial budgets;
- model checkpoint/version;
- grader configuration;
- excluded or invalid runs;
- access to reference information;
- temporal/provider/runtime conditions?

## Measurement object

The measurement object is **not assumed to be a model marketing name in isolation**.

Following the [BRONCO Measurement Model](../measurement-model.md), the relevant object is a declared AI system under declared experimental conditions. The intended result therefore has to be interpreted together with identity evidence, procedure revision, harness/scaffold, access conditions, trial design, evaluator configuration, failures/exclusions and uncertainty or variability.

## Known provenance

Public source review documented in the linked issue indicates that Anthropic's cybersecurity evaluations are substantially better documented than many public coding benchmarks.

Relevant strengths include:

- public or source-described evaluation harnesses for important cyber evaluations;
- independent work by organizations including AISI and METR;
- public system-card and evaluation documentation;
- acknowledgement of coordinated-disclosure constraints for security-sensitive material;
- disclosure of some trial budgets, harness choices, exclusions and memorization controls.

These strengths matter. FC-001 is not built on the claim that the evaluations are undocumented; it examines the remaining reproducibility and attribution gap.

## Missing or partial provenance

The public discussion identifies several fields that remain missing, partial or difficult to reproduce independently across the cited evaluations:

- exact checkpoint-to-result mapping for each published headline figure;
- equalized trial counts and per-trial variability across compared systems;
- model-only versus recommended-agent-scaffold contribution;
- network-egress sensitivity;
- per-instance outcomes, seeds and complete experimental configuration where disclosure is safe;
- explicit handling and listing of exclusions/validation exceptions;
- known-fix, memorization or reference-retrieval contribution to successful runs;
- independently reproducible strict-harness variants;
- auditor-accessible evidence for sensitive trajectories when public release is unsafe.

Not every field is necessarily required for every evaluation. The research task is to determine which fields materially affect interpretation and which can be safely omitted without changing the measurement claim.

## Potential confounders

Candidate confounders currently include:

- harness/scaffold capability;
- information and network access;
- unequal trial budgets or Best@k settings;
- retries;
- model/checkpoint drift;
- grader/judge implementation;
- exclusion policy;
- training-data recall or retrieval of known fixes;
- temporal/provider/runtime variation.

A listed confounder is **not evidence that it caused a reported result**. It is a candidate condition whose contribution should be measured or bounded where the result depends on it.

## Evidence classification

### Documented / source-backed

- Public Anthropic policy and evaluation material uses capability measurements as part of its safety/policy argument.
- Independent organizations such as AISI and METR have performed relevant evaluations.
- The cited evaluations expose meaningful methodological detail, but not all information needed for unrestricted end-to-end independent reconstruction is public.
- Trial budgets, network access, scaffolds and exclusion/validation rules can differ between reported evaluations and therefore belong in the measurement provenance.

### Inference

- The magnitude of the harness, network-access, retry or reference-information contribution to specific headline results is not established merely by observing that those conditions exist.
- A strict-harness result could be materially lower, similar or in some cases higher; this must be measured rather than assumed.

### Open questions

- Which policy-driving figures can an independent lab reproduce today from a frozen public or auditor-accessible procedure?
- How much of each result is attributable to system capability versus experimental apparatus and information access?
- Which provenance fields can be disclosed publicly and which should instead be escrowed for independent auditors?

## Good-faith falsifier

FC-001 has an explicit falsification path:

> If independent strict-harness measurements — under controlled and comparable conditions — reproduce the published results within the expected uncertainty/variability, the central provenance concern is materially weakened and the policy case becomes stronger.

A result that survives independent reconstruction is positive evidence for the measurement claim, not an inconvenience for this project.

## Public source record

Primary live discussion and current question set:

- [#87086 — policy-driving evaluation provenance](https://github.com/anthropics/claude-code/issues/87086)
- [#86979 — benchmark measurement provenance](https://github.com/anthropics/claude-code/issues/86979)

Related measurement/audit context:

- [#83510 — measured model-behaviour regression discussion](https://github.com/anthropics/claude-code/issues/83510)
- [#83795 — model selection / runtime auditability discussion](https://github.com/anthropics/claude-code/issues/83795)

The GitHub issues are public discussion/source records. This BRONCO file is the canonical long-term field-case record.

## External review / stakeholder outreach

On **2026-08-16**, the measurement-provenance question was sent as a request for technical review to U.S. science, standards and policy contacts, including contacts at **NIST**, **OSTP** and **Sen. Ted Cruz's office**. The same message was also addressed to the White House press contact.

The purpose was review/referral of the measurement question, not a request for a predetermined political conclusion.

No endorsement, response, institutional involvement or successful delivery to every listed address is implied.

See: [Stakeholder outreach record](../correspondence/2026-08-16-fc001-stakeholder-outreach.md).

## Corrections and updates

This case should be updated when:

- an evaluated organization publishes missing provenance;
- an independent replication becomes available;
- a cited source is corrected or superseded;
- a candidate confounder is experimentally shown to matter or not matter;
- the BRONCO measurement model itself changes in response to the case.

Corrections should preserve the historical claim and clearly record what changed rather than silently rewriting the record.

## Current assessment

**OPEN QUESTION.**

The public evidence is sufficient to justify asking for stronger measurement provenance and independent reproducibility for policy-relevant AI capability figures. It is **not** sufficient to infer misconduct or to quantify how much any specific published result was altered by harness, network access, retries, information access or other candidate confounders.
