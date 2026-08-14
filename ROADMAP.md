# BRONCO Research-First Roadmap

BRONCO is developed by **evidence gates**, not by feature count. A later phase may prototype tooling, but no phase is considered complete until its scientific and assurance prerequisites are documented.

A second project-wide principle governs benchmark integrity:

> **Standards are public. Test instances are not.**

DIN/ISO/IEC/JCGM sources, measurement definitions, validity arguments and scoring rules should be inspectable. Concrete reportable challenge instances must remain unpredictable until the evaluated model/version and protocol are frozen, then become reproducible from auditable external entropy, a frozen deterministic generator and immutable provenance.

This is an anti-contamination and anti-cherry-picking design constraint. It does **not** assert that any specific vendor deliberately trains on any specific benchmark.

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
- Document construct validity threats: content leakage, public-item exposure, benchmark contamination, evaluator bias, prompt sensitivity, language effects, tool availability, context length, provider routing and hidden system prompts.
- Distinguish performance on known/public benchmark material from performance on newly generated or previously sealed instances.
- Define admissible inference: what conclusions a result can and cannot support.
- Build a taxonomy of nuisance variables and controllable factors.

**Exit criteria**

- Every candidate benchmark family has a construct sheet.
- Each construct sheet names observable indicators, confounders, expected failure modes and invalid interpretations.
- Exposure/contamination risk is explicitly considered for every reportable benchmark family.
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
- Define the task-family universe and sampling/stratification constraints before concrete reportable challenges are drawn.
- Separate public development/examples from sealed reportable challenge material.
- Predefine how semantically equivalent hidden variants may be generated for contamination/generalization studies without post-hoc analyst selection.

**Exit criteria**

- A measurement procedure can be executed without undocumented analyst discretion.
- Repeatability/reproducibility quantities and uncertainty reporting are defined for every reported metric.
- Failure handling is part of the protocol rather than post-hoc cleanup.
- Challenge-family membership, sample count, stratification and hidden/public data policy are fixed before a reportable run.

## R3 — Reproducibility, provenance and independent challenge generation

**Question:** Can another investigator reconstruct what was actually measured **without the concrete test becoming a predictable training target before the run**?

Work:

- Define a canonical experiment manifest.
- Record provider, requested model, returned model identifiers when available, endpoint, date/time, sampling settings, tool configuration, prompt/template version and dataset revision.
- Record all relevant software and protocol versions.
- Make routing/fallback ambiguity an explicit provenance field.
- Define raw-observation retention and evidence-bundle structure.
- Specify deterministic canonicalization before hashing/signing is considered.
- Freeze the measurement specification, standards profile, task-family universe, generator version, scoring implementation and requested runtime identity before challenge selection.
- Publish cryptographic commitments to the frozen material before challenge entropy is known.
- Obtain unpredictable entropy from an **independent external mechanism or authority** that cannot be unilaterally selected by KeilerHirsch-Labs, a model vendor or a single evaluator after observing model behavior.
- Deterministically map the frozen generator plus external entropy to the concrete challenge set.
- Keep the concrete reportable challenge set, hidden variants and answer-revealing instance material sealed until execution/disclosure policy permits release.
- Do **not** let an external reviewer manually choose questions. The external role is to provide/attest unpredictable entropy and execution integrity; the frozen BRONCO procedure performs selection.
- Retain the external entropy/seed proof, challenge-set hash, ordered challenge identifiers, exact raw model requests/responses, runtime/fallback metadata, retries/failures/timeouts, evaluator outputs, scorer/trusted-core version and timestamps.
- Track challenge exposure state explicitly: `development`, `sealed`, `used`, `disclosed/burned`, `retired`.
- Treat public/disclosed challenge instances as burned for future frontier-model evaluation; reproducibility is preserved, hidden-set status is not.
- Keep candidate entropy mechanisms (for example a public randomness beacon, multi-party commit/reveal or independent laboratory/custodian seed generation) as research choices until their trust and replay properties are evaluated.

**Exit criteria**

- Every result can be traced to one immutable manifest and raw evidence set.
- The schema distinguishes requested identity from observed identity.
- A third party can rerun a protocol without private analyst knowledge.
- A reportable run has a pre-run commitment package created **before** external entropy became known.
- Challenge selection is deterministic once the committed generator and disclosed entropy are fixed.
- Neither benchmark operator nor vendor can silently replace the challenge set after the run enters its frozen state.
- The challenge can be reproduced after disclosure without having been predictable before model/protocol freeze.

## R4 — Ada/SPARK trusted-core specification and proof

**Question:** Which deterministic operations are important enough to deserve formal assurance?

Work:

- Freeze the trusted/untrusted boundary before implementation grows.
- Formalize bounded numeric types, state machines and decision rules.
- Implement deterministic validation and calculation primitives in Ada/SPARK.
- Require flow analysis for all trusted-core code.
- Prove absence of run-time errors for release candidates.
- Prove functional contracts for measurement-critical transforms and decision rules.
- Specify deterministic entropy-to-challenge selection where that mapping enters the trusted boundary.
- Prove selected challenge identifiers belong to the committed universe.
- Prove requested sample-count, uniqueness and declared stratification invariants.
- Prove challenge identity/order cannot change after the run-state transition to `Frozen`, except through an explicitly defined abort/restart path that produces a new manifest/commitment.
- Prove score rows map only to committed challenge identifiers and that complete observations are counted exactly once.
- Prove missing/failed observations follow the predeclared state machine rather than ad-hoc deletion.
- Maintain deterministic manifest canonicalization for hashing/commitment operations inside the trusted boundary.
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
- Challenge-selection and run-state invariants included in the trusted boundary have explicit proof objectives and replay tests.

## R5 — Pilot measurement studies

**Question:** Do the proposed procedures behave as expected on small, controlled studies?

Work:

- Run limited pilots across multiple models and repeated runs.
- Measure sensitivity to prompt wording, order, decoding settings and time.
- Test evaluator agreement and adjudication rules.
- Estimate variance components and refine sample-size assumptions.
- Attempt to falsify each construct with adversarial counterexamples.
- Use public/development or explicitly non-reportable material for ordinary iterative pilot tuning.
- If a pilot is intended to produce a reportable hidden-set comparison, generate a fresh sealed challenge set under the R3 commitment/external-entropy procedure instead of reusing material exposed during development.

**Exit criteria**

- Pilot data support the chosen measurement procedure or trigger redesign.
- Major confounders have mitigation or explicit limitations.
- No metric advances solely because it produces visually compelling provider differences.
- Development exposure is recorded so tuned-on material cannot later be presented as unseen reportable evidence.

## R6 — Cross-environment replication and robustness

**Question:** Does the measurement procedure remain useful outside the original setup?

Work:

- Replicate across time windows, provider interfaces and independent execution environments.
- Where possible, organize independent replication by external contributors.
- Quantify reproducibility degradation and model/provider interaction effects.
- Test robustness to benign perturbations and adversarially selected nuisance variables.
- Compare alternative scoring and aggregation methods.
- Verify that independent operators can reconstruct the committed challenge selection from the same generator/entropy evidence.
- Where a replication requires a genuinely unseen frontier challenge, use a new sealed set rather than silently replaying disclosed/burned material and calling it hidden.
- Compare public-item performance against fresh semantically equivalent hidden variants where contamination/generalization is the research question.

**Exit criteria**

- Replication package is independently executable.
- Reproducibility limits/intervals are reported where applicable.
- Known environment dependence is quantified rather than hidden.
- Challenge commitment and replay are independently checkable.
- Public-versus-hidden exposure state is explicit in replication reports.

## R7 — Public benchmark release and evidence package

**Question:** Is the benchmark mature enough that public comparisons are less misleading than useful?

Release package:

- Versioned benchmark specification.
- Construct and validity documentation.
- Dataset/task-family provenance and licenses.
- Experiment-manifest schema.
- Reference implementation and trusted-core proof artifacts.
- Statistical-analysis specification.
- Reproducibility report.
- Limitations and prohibited interpretations.
- Machine-readable raw/derived result provenance.
- Pre-run commitment package and relevant hashes.
- External entropy/seed provenance after disclosure is safe.
- Challenge-set hash and ordered challenge identifiers.
- Exact raw model outputs plus provider/runtime/fallback evidence when available.
- Failure/retry/timeout and adjudication records.
- Challenge exposure/burn state and rotation policy.
- Documentation that vendors had symmetric access to public methodology and no privileged early access to the sealed reportable set.

**Exit criteria**

- Public score tables link back to evidence and uncertainty.
- Breaking methodology changes require a new benchmark version.
- Results from incompatible protocol versions are not silently ranked together.
- A disclosed challenge set is marked burned for future frontier-model evaluation and is not silently reused as an unseen test.
- A future reportable hidden-set release has a defined rotation path to freshly generated sealed instances.

## Cross-cutting rules

- **No feature-first work:** tooling exists to execute a defined measurement procedure, not to create activity before the procedure is defensible.
- **No hidden benchmark gardening:** failed hypotheses and negative pilot results are retained.
- **No fake precision:** report uncertainty and sample size alongside point estimates.
- **No undocumented reruns:** reruns are protocol events, not a way to obtain a preferred result.
- **No normative laundering:** drafts, technical reports, DIN SPEC documents and published International Standards retain their actual status in documentation.
- **No certification language without certification:** standards alignment is not accreditation or conformity assessment.
- **No static public reportable frontier test set:** public examples are development/burned material, not permanently unseen evidence.
- **No operator-picked hidden exam:** concrete reportable challenges are derived from a frozen procedure plus independently sourced unpredictable entropy, not hand-selected after model behavior is known.
- **No seed substitution after commitment:** any abort/reseed path must create a new manifest, commitment and audit trail.
- **No privileged vendor preview:** sealed reportable material is not disclosed early to one provider.
- **No silent reuse of burned items:** once disclosed, an item remains useful for reproducibility and historical comparison but is no longer treated as hidden for future frontier evaluation.
- **No contamination accusation from score alone:** an anomalous public-vs-hidden performance gap is a falsifiable research signal, not proof of deliberate vendor behavior.
