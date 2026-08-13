# BRONCO Measurement Model

This document defines the initial abstract measurement model for BRONCO. It deliberately stops before benchmark content or provider adapters.

## 1. Measurement object

A BRONCO study evaluates a **declared AI system under declared experimental conditions**. For hosted systems, the object is not assumed to be identical to a vendor marketing name: the requested identifier, returned metadata and execution context are retained separately.

## 2. Experimental unit

The provisional experimental unit is one independently executed **trial** defined by a frozen manifest containing the information needed to interpret that trial.

A trial minimally binds:

- benchmark/procedure revision;
- item or task revision;
- requested system/provider identity;
- observed identity metadata when available;
- interface/endpoint class;
- prompt/system-instruction revision as far as observable/controlled;
- tool configuration;
- decoding/sampling controls exposed to the investigator;
- execution time window;
- software/toolchain revision;
- evaluator/rubric revision;
- retry/failure history.

The exact schema will be frozen in Roadmap R3.

## 3. Observations

An observation is raw evidence captured from a trial before benchmark scoring transforms are applied.

Examples can include:

- response text;
- structured tool call;
- refusal/abstention event;
- execution error;
- provider-returned metadata;
- latency/timing values where the protocol defines them;
- evaluator labels and rationale references.

Raw observations are not silently rewritten into successful observations. Normalization must be versioned and reproducible.

## 4. Derived quantities

A derived quantity is produced only by a specified measurement equation or decision procedure.

Each quantity definition must state:

- name and identifier;
- construct/measurand relationship;
- scale and admissible range;
- input observations;
- deterministic transformation;
- aggregation level;
- uncertainty/variability representation;
- invalid/missing-state handling;
- decision rule, if any;
- validity limits.

The trusted core implements only the deterministic subset after this definition is stable.

## 5. Result tuple

A public BRONCO result should conceptually be treated as a tuple rather than a naked score:

```text
Result = {
  procedure_version,
  system_identity_evidence,
  conditions,
  estimate,
  uncertainty_or_interval,
  sample_size,
  failure_accounting,
  provenance,
  validity_limits
}
```

A point estimate without the surrounding fields is an incomplete representation.

## 6. Repeatability model

For a given procedure, BRONCO defines a repeatability condition set explicitly. Candidate controlled factors include:

- same procedure revision;
- same benchmark item population/revision;
- same requested model identifier;
- same interface class;
- same decoding controls;
- same evaluator revision;
- narrow time window.

The project will empirically determine whether those conditions are sufficient. Hosted AI can contain hidden state or server-side changes that make classical repeatability assumptions fail.

## 7. Reproducibility model

Reproducibility studies intentionally vary one or more factors expected to matter, such as:

- execution team/laboratory;
- client implementation;
- time window;
- provider interface;
- region/infrastructure where observable and ethically/contractually permitted;
- evaluator implementation.

BRONCO reports which factors changed rather than using "reproduced" as a binary label.

## 8. Uncertainty and variability

BRONCO will not collapse all uncertainty into generation randomness.

The initial uncertainty inventory separates at least:

### Sampling variability

Variation from finite item and trial samples.

### System stochasticity

Variation between nominally repeated executions.

### Evaluator variability

Disagreement or instability introduced by human/model judges.

### Procedure sensitivity

Changes caused by prompt wording, ordering, formatting or equivalent implementation choices.

### Identity/provenance uncertainty

Ambiguity about routing, version, fallback or hidden execution configuration.

### Data uncertainty

Label ambiguity, item provenance limitations, leakage/contamination risk and data-quality defects.

The statistical treatment is metric-specific. BRONCO does not force unlike uncertainty sources into one number unless the measurement model justifies that combination.

## 9. Failure taxonomy

Failures are measurements of the execution system and must not disappear during cleaning. The initial state model distinguishes:

- valid observation;
- invalid input/protocol violation;
- missing observation;
- execution failure.

Future procedures may refine execution failure into transport, provider, tool, timeout, parser or policy categories, but only after those distinctions are defined reproducibly.

## 10. Decision rules

Pass/fail decisions are secondary to measured quantities and must name the threshold, uncertainty treatment and consequence of an indeterminate interval.

The initial SPARK core demonstrates a conservative interval rule:

- **Pass** if the complete interval is at or above the threshold.
- **Fail** if the complete interval is below the threshold.
- **Indeterminate** if the interval crosses the threshold.

This is an assurance scaffold, not yet a normative benchmark rule.

## 11. Traceability chain

BRONCO aims for software/evidence traceability of the measurement procedure:

```text
published result
  -> analysis revision
  -> trusted-core revision + proof record
  -> normalized observation set
  -> raw observation bundle
  -> immutable experiment manifest
  -> benchmark/data revisions
  -> construct + procedure specification
  -> standards/research rationale
```

This is not automatically equivalent to SI metrological traceability. Where BRONCO uses the term "traceability" outside the VIM's strict metrological sense, the documentation must qualify what is being traced.

## 12. Change control

A change requires a new procedure version when it can alter interpretation or comparability, including changes to:

- construct definition;
- item population;
- scoring equation;
- evaluator rubric;
- missing/failure policy;
- aggregation;
- uncertainty method;
- decision rule.

Provider adapter bug fixes that provably preserve procedure semantics may remain implementation revisions, but their effect must be tested.
