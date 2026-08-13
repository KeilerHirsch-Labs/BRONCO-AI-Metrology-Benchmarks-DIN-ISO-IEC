# Research Principles

BRONCO treats an AI benchmark as a **measurement procedure**, not as a bag of prompts. The purpose of this document is to prevent implementation convenience from silently defining the science.

## 1. Define the measurand before the metric

Every benchmark family starts with a construct sheet containing:

- target construct;
- observable indicators;
- unit or scale of the reported result;
- population/domain to which the claim is intended to generalize;
- nuisance variables and confounders;
- known invalid interpretations;
- expected failure modes;
- evidence needed to consider the construct measurable.

A score does not become a measurand merely because it is numeric.

## 2. Distinguish observation, result and claim

BRONCO uses three levels:

1. **Observation** — raw output/event from one defined run.
2. **Measurement result** — derived quantity produced by a specified procedure from observations, with sample size and uncertainty information.
3. **Claim** — interpretation supported by one or more results within explicitly stated validity limits.

This separation prevents an attractive individual response from being presented as a stable property of a model.

## 3. Model identity is an observed variable

Hosted AI systems can introduce ambiguity through aliases, routing, fallback, changing system prompts, server-side updates and unavailable model-version metadata.

Therefore an experiment manifest distinguishes at least:

- requested provider;
- requested model identifier;
- observed/returned model identifier, if exposed;
- endpoint/interface;
- provider response metadata retained as evidence;
- fallback/reroute indicators, when detectable;
- time window;
- client/toolchain version.

A benchmark must not infer exact model identity solely from a friendly product label.

## 4. Repeated measurement is the default

For stochastic systems, one response is a sample, not a model characteristic.

Protocols must define:

- number of independent runs;
- sampling/decoding parameters;
- random seed handling where meaningful and exposed;
- temporal replication when server-side drift is plausible;
- blocking/stratification factors;
- rules for retries and transport failures.

Retries are recorded events. They are never silently substituted until a desirable answer appears.

## 5. Repeatability and reproducibility are different questions

BRONCO borrows the discipline of ISO 5725 while documenting where adaptation to hosted AI systems is required.

Examples of **repeatability-like** conditions may include repeated executions using the same protocol, interface, requested model, prompt revision and decoding configuration within a narrow time window.

Examples of **reproducibility-like** changes may include different execution environments, API surfaces, time windows, independent laboratories/teams or materially different provider infrastructure.

The exact operational definitions belong to each released measurement procedure.

## 6. Build an uncertainty budget

A reported result should identify important uncertainty/variability contributors rather than hide them in a point estimate. Candidates include:

- stochastic generation;
- finite benchmark sampling;
- item difficulty heterogeneity;
- evaluator disagreement;
- prompt/template sensitivity;
- parsing or normalization decisions;
- provider routing/version ambiguity;
- temporal drift;
- dataset label uncertainty;
- missing/failed observations.

BRONCO does not assume that every GUM mechanism maps directly to AI evaluation. The project will document which uncertainty concepts are directly applicable, which are adapted, and which are only analogies.

## 7. Freeze analysis rules before broad comparison

Before large provider/model comparisons, define:

- primary outcome(s);
- secondary/exploratory outcomes;
- aggregation functions;
- exclusions;
- missing-data treatment;
- refusal/tool-error classification;
- evaluator adjudication;
- effect-size reporting;
- multiplicity policy where many hypotheses are tested.

Changing the rule after seeing which model wins invalidates the intended confirmatory interpretation.

## 8. Human and model evaluators are measuring instruments too

When an evaluator assigns labels or scores, BRONCO treats evaluator behaviour as part of the measurement system.

Protocols should quantify where applicable:

- inter-rater agreement;
- intra-rater stability;
- blind/adjudicated scoring;
- evaluator-order effects;
- evaluator model/version identity;
- rubric sensitivity.

A judge model is not ground truth merely because it is convenient.

## 9. Data provenance is part of validity

Evaluation items require:

- source/provenance;
- license/usage basis;
- creation or collection date where relevant;
- transformations;
- label origin and adjudication;
- contamination/leakage assessment where possible;
- version identifier.

ISO/IEC 5259 is the initial standards family used to structure this work.

## 10. Negative results are retained

BRONCO does not optimize the benchmark suite for dramatic differences between vendors.

Retain:

- hypotheses that fail;
- tasks that show no meaningful separation;
- pilot procedures rejected for poor reliability;
- robustness probes that reveal benchmark fragility;
- changes that reverse previously observed rankings.

These are measurements of the instrument's limitations.

## 11. Adversarial review precedes public scoring

Before public rankings, attempt to break the measurement procedure through:

- prompt paraphrases;
- reordered items/options;
- benign formatting changes;
- evaluator substitution;
- temporal reruns;
- context-position changes;
- tool availability changes;
- adversarial examples appropriate to the construct.

A benchmark that measures its own formatting quirks is not ready to rank models.

## 12. Evidence travels with the result

A publishable result should be traceable to:

```text
benchmark specification
  -> construct definition
  -> dataset revision
  -> immutable experiment manifest
  -> raw observations
  -> evaluator decisions
  -> trusted-core calculation/proof version
  -> statistical analysis
  -> reported result + uncertainty + limitations
```

If a link in that chain is missing, the report states the limitation rather than reconstructing certainty after the fact.
