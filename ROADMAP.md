# BRONCO Research-First Roadmap

BRONCO is developed by **evidence gates**, not by feature count. A later phase may prototype tooling, but no phase is considered complete until its scientific and assurance prerequisites are documented.

## R0 — Standards, terminology and scope baseline

**Question:** What vocabulary and external requirements should govern BRONCO's measurement claims?

Work:

- Maintain a dated standards register with official source links and lifecycle status.
- Separate published standards, technical reports, DIN SPEC/PAS documents, drafts and informative guidance.
- Establish BRONCO terminology around measurand, observation, result, repeatability, reproducibility, uncertainty, robustness, accuracy, bias, validity and conformance.
- Document where classical metrology concepts transfer directly to AI evaluation and where BRONCO is making an analogy that requires validation.
- Define what BRONCO explicitly does **not** claim: certification, accreditation, universal model quality or provider identity guarantees.

**Exit criteria**

- Standards register reviewed for current status.
- Core terminology has one canonical definition source or a clearly documented BRONCO-specific definition.
- Known standards gaps and draft dependencies are visible.

## R1 — Measurands, constructs and validity model

**Question:** What property is each proposed benchmark intended to measure?

Work:

- Define each construct before selecting tasks or prompts.
- Separate latent constructs (for example instruction adherence or epistemic calibration) from directly observable quantities.
- Document construct validity threats: content leakage, evaluator bias, prompt sensitivity, language effects, tool availability, context length, provider routing and hidden system prompts.
- Define admissible inference: what conclusions a result can and cannot support.
- Build a taxonomy of nuisance variables and controllable factors.

**Exit criteria**

- Every candidate benchmark family has a construct sheet.
- Each construct sheet names observable indicators, confounders, expected failure modes and invalid interpretations.
- No leaderboard metric exists without a construct definition.

## R2 — Experimental design and uncertainty model

**Question:** How must observations be sampled and analysed so the result is statistically defensible?

Work:

- Define the experimental unit and repeated-measure structure.
- Specify independent replication, reruns and blocked designs where provider/time/environment effects matter.
- Separate within-condition stochastic variation from between-condition reproducibility effects.
- Develop uncertainty budgets for derived metrics.
- Define evaluator agreement procedures for human or model-based adjudication.
- Predefine missing-data, refusal, timeout, reroute and malformed-output treatment.
- Define multiple-comparison and effect-size policy before large-scale benchmarking.

**Exit criteria**

- A measurement procedure can be executed without undocumented analyst discretion.
- Repeatability/reproducibility quantities and uncertainty reporting are defined for every reported metric.
- Failure handling is part of the protocol rather than post-hoc cleanup.

## R3 — Reproducibility and provenance specification

**Question:** Can another investigator reconstruct what was actually measured?

Work:

- Define a canonical experiment manifest.
- Record provider, requested model, returned model identifiers when available, endpoint, date/time, sampling settings, tool configuration, prompt/template version and dataset revision.
- Record all relevant software and protocol versions.
- Make routing/fallback ambiguity an explicit provenance field.
- Define raw-observation retention and evidence-bundle structure.
- Specify deterministic canonicalization before hashing/signing is considered.

**Exit criteria**

- Every result can be traced to one immutable manifest and raw evidence set.
- The schema distinguishes requested identity from observed identity.
- A third party can rerun a protocol without private analyst knowledge.

## R4 — Ada/SPARK trusted-core specification and proof

**Question:** Which deterministic operations are important enough to deserve formal assurance?

Work:

- Freeze the trusted/untrusted boundary before implementation grows.
- Formalize bounded numeric types, state machines and decision rules.
- Implement deterministic validation and calculation primitives in Ada/SPARK.
- Require flow analysis for all trusted-core code.
- Prove absence of run-time errors for release candidates.
- Prove functional contracts for measurement-critical transforms and decision rules.
- Maintain an explicit assumptions ledger for properties outside the proof boundary.

**Assurance targets**

- Bronze-level properties as the floor.
- Silver/AoRTE for all release trusted-core code.
- Gold-level contract proof for critical deterministic logic.
- Platinum only for small algorithms with complete formal requirements.

**Exit criteria**

- Trusted-core API and assumptions are documented.
- Proof reports are reproducible from a pinned toolchain.
- No network, provider SDK or secret-handling code is inside the trusted core.

## R5 — Pilot measurement studies

**Question:** Do the proposed procedures behave as expected on small, controlled studies?

Work:

- Run limited pilots across multiple models and repeated runs.
- Measure sensitivity to prompt wording, order, decoding settings and time.
- Test evaluator agreement and adjudication rules.
- Estimate variance components and refine sample-size assumptions.
- Attempt to falsify each construct with adversarial counterexamples.

**Exit criteria**

- Pilot data support the chosen measurement procedure or trigger redesign.
- Major confounders have mitigation or explicit limitations.
- No metric advances solely because it produces visually compelling provider differences.

## R6 — Cross-environment replication and robustness

**Question:** Does the measurement procedure remain useful outside the original setup?

Work:

- Replicate across time windows, provider interfaces and independent execution environments.
- Where possible, organize independent replication by external contributors.
- Quantify reproducibility degradation and model/provider interaction effects.
- Test robustness to benign perturbations and adversarially selected nuisance variables.
- Compare alternative scoring and aggregation methods.

**Exit criteria**

- Replication package is independently executable.
- Reproducibility limits/intervals are reported where applicable.
- Known environment dependence is quantified rather than hidden.

## R7 — Public benchmark release and evidence package

**Question:** Is the benchmark mature enough that public comparisons are less misleading than useful?

Release package:

- Versioned benchmark specification.
- Construct and validity documentation.
- Dataset provenance and licenses.
- Experiment-manifest schema.
- Reference implementation and trusted-core proof artifacts.
- Statistical-analysis specification.
- Reproducibility report.
- Limitations and prohibited interpretations.
- Machine-readable raw/derived result provenance.

**Exit criteria**

- Public score tables link back to evidence and uncertainty.
- Breaking methodology changes require a new benchmark version.
- Results from incompatible protocol versions are not silently ranked together.

## Cross-cutting rules

- **No feature-first work:** tooling exists to execute a defined measurement procedure, not to create activity before the procedure is defensible.
- **No hidden benchmark gardening:** failed hypotheses and negative pilot results are retained.
- **No fake precision:** report uncertainty and sample size alongside point estimates.
- **No undocumented reruns:** reruns are protocol events, not a way to obtain a preferred result.
- **No normative laundering:** drafts, technical reports, DIN SPEC documents and published International Standards retain their actual status in documentation.
- **No certification language without certification:** standards alignment is not accreditation or conformity assessment.
