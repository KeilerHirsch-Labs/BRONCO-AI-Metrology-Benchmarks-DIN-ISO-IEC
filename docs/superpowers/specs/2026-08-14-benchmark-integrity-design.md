# BRONCO Benchmark Integrity / Hidden Challenge Design

Date: 2026-08-14

## Decision

BRONCO remains standards- and metrology-first. DIN/ISO/IEC/JCGM sources define the measurement vocabulary, constructs, validity constraints and reporting requirements. Concrete reportable test instances must not become a static public question bank.

The design principle is:

> Standards are public. Test instances are not.

A reportable run must be reproducible after disclosure while remaining unpredictable before the evaluated model/version and protocol are frozen.

## Threat model

Public static benchmarks can become exposed to later training, post-training, prompt tuning, evaluation-aware optimization or accidental corpus contamination. This design treats exposure as a measurement-integrity threat. It does not assert that any vendor deliberately trains on any specific benchmark.

Additional threats include operator cherry-picking, post-hoc item removal, hidden scorer changes, privileged vendor access, seed manipulation and reuse of already disclosed items as if they were still unseen.

## Selected architecture

1. Freeze the measurement specification, standards profile, task-family universe, generator version, scoring implementation and runtime request identity.
2. Publish cryptographic commitments to the frozen material before challenge entropy is known.
3. Obtain unpredictable entropy from an independent external mechanism or authority.
4. Deterministically map that entropy through the frozen BRONCO generator to the concrete challenge set.
5. Seal the concrete instances until execution.
6. Execute the measurement and retain exact raw requests/responses, runtime metadata, failures/retries and hashes.
7. Publish the evidence package, including entropy/seed proof when safe, challenge-set hash, ordered challenge identifiers, scoring provenance and uncertainty.
8. Mark disclosed challenge instances as burned for future frontier-model evaluation and rotate to a new hidden set.

No external reviewer should manually choose the questions. The external role is to provide or attest unpredictable entropy and execution integrity; the deterministic BRONCO procedure performs the selection.

## Public versus sealed material

Public and versioned:
- standards register and standards-status handling;
- measurand and construct definitions;
- validity and uncertainty model;
- task-family specification;
- generator specification/source where safe;
- scoring and decision rules;
- manifest/canonicalization schema;
- development examples explicitly marked as public/burned.

Sealed before a reportable run:
- concrete held-out instances;
- instance-specific gold material where disclosure would leak answers;
- adversarial combinations;
- seeds/selection entropy before model freeze;
- hidden variants and challenge order.

## External entropy requirements

The final mechanism is not frozen yet, but it must satisfy these properties:
- not unilaterally selectable by KeilerHirsch-Labs;
- not unilaterally selectable by a model vendor;
- not selectable by a single evaluator after observing model behavior;
- timestamped and independently auditable;
- deterministic replay after disclosure.

Candidate mechanisms include a public randomness beacon, multi-party commit/reveal, or independent laboratory/custodian seed generation. The roadmap must treat the mechanism choice as a research/assurance decision, not an implementation convenience.

## Ada/SPARK trusted-core impact

Candidate formally assured responsibilities:
- deterministic entropy-to-selection mapping;
- challenge IDs constrained to the committed universe;
- requested sample-count and stratification invariants;
- no duplicate/omitted sample outside declared policy;
- immutable challenge identity after a run enters Frozen state;
- score rows map only to committed challenge IDs;
- every complete observation counted exactly once;
- missing/failed observations follow the declared state machine;
- deterministic manifest canonicalization.

Formal proof protects implementation integrity. It cannot prove construct validity, representativeness or absence of bias in the task-family universe.

## Alternatives considered

### Static public benchmark
Rejected for reportable frontier evaluation. Maximum transparency, but the concrete target is predictable and increasingly unsuitable as an unseen generalization test.

### Independent human panel selects questions
Rejected as the primary selection mechanism. It moves the manipulation/cherry-picking trust problem to the panel and is difficult to reproduce exactly.

### External entropy plus deterministic BRONCO generator
Selected. It preserves a public methodology while separating pre-run unpredictability from post-run reproducibility and minimizes discretionary item selection.

## Success criteria

A BRONCO reportable run must be able to demonstrate:
- what measurement procedure was frozen;
- what model/runtime identity was requested and observed;
- what was committed before entropy became known;
- where the entropy came from;
- how the challenge set was deterministically derived;
- that the set was not changed after freeze;
- how failures and missing observations were handled;
- how raw observations map to the published score;
- which items are now burned and cannot be treated as hidden in future frontier runs.
