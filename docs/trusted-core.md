# Ada/SPARK Trusted Core

BRONCO uses Ada/SPARK for a **small deterministic assurance boundary**. The goal is not to write the whole benchmark platform in SPARK. The goal is to make the calculations and decision logic that turn evidence into reported measurement results small enough to specify, review and prove.

## Why Ada/SPARK

- Ada is standardized as **ISO/IEC 8652:2023**.
- SPARK restricts/extends Ada for high-assurance static analysis and formal verification.
- GNATprove can establish data/flow properties, absence of run-time errors and contract correctness at increasing assurance levels.
- The language/tooling encourages explicit ranges, contracts and state boundaries that fit measurement-critical deterministic logic.

This is complementary to ISO/IEC 24029-2:2023, which specifically addresses methodology for using formal methods in neural-network robustness assessment. BRONCO does not claim that writing SPARK code automatically satisfies that standard; the shared principle is that formal methods should be selected and managed against explicit properties.

## Trust boundary

```text
UNTRUSTED / RAPIDLY CHANGING

provider APIs
network + TLS stack
secrets/authentication
vendor SDKs
raw JSON/event streams
prompt orchestration
model execution
human/model judges
filesystem/database implementation
        │
        ▼
validated typed evidence
        │
        ▼
┌────────────────────────────────────────────┐
│           BRONCO TRUSTED CORE              │
│                                            │
│ bounded domain types                       │
│ manifest/result-state validation           │
│ deterministic score transforms             │
│ aggregation primitives                     │
│ decision rules                             │
│ uncertainty arithmetic (when specified)    │
│ invariant/state-machine enforcement        │
│ canonical internal representations         │
└────────────────────────────────────────────┘
        │
        ▼
verified derived results
        │
        ▼
UNTRUSTED REPORTING / VISUALIZATION
```

The perimeter may eventually use another language better suited to APIs and data engineering. That choice is deliberately deferred until the measurement protocol is stable.

## Initial proof policy

BRONCO follows the SPARK assurance-level idea pragmatically:

### Floor — flow properties

All trusted-core code should satisfy the equivalent of the SPARK Bronze-level objectives relevant to the codebase, including preventing reads of uninitialized data and unintended data-flow interference.

### Release requirement — absence of run-time errors

Release trusted-core code must target Silver-level **AoRTE**: proof that expected executions cannot trigger language-defined run-time errors within the documented assumptions.

### Measurement-critical logic — contract proof

Critical transforms and decision rules target Gold-level contract proof. Examples include:

- range-preserving conversions;
- classification/decision boundaries;
- aggregation invariants;
- state transitions;
- consistency rules between counts and totals;
- bounded fixed-point/rational calculations used in published metrics.

### Selective full functional correctness

Platinum-level/full functional correctness is reserved for small algorithms whose requirements are complete enough to make such proof meaningful. A weak or wrong formal specification does not become scientifically correct because it is fully proved.

## Assumptions ledger

Formal proofs are conditional. BRONCO therefore maintains an assumptions ledger for every trusted-core release.

Typical assumptions may include:

- bytes/data presented to the core have already passed transport integrity checks;
- external cryptographic primitives behave according to their documented contract;
- provider metadata is accurately transmitted by the provider, even if it is not sufficient to prove actual model identity;
- memory/compiler/hardware properties outside the verified toolchain are not silently elevated into theorem-level claims.

An assumption must be reviewable and traceable to the property that depends on it.

## Numeric policy

Floating-point arithmetic will not be introduced into the trusted core merely for convenience.

For each metric BRONCO will select and document one of:

- bounded integer arithmetic;
- scaled integer/fixed-point arithmetic;
- rational representation;
- floating-point with an explicit numerical-error model.

The representation is chosen after the measurement equation and required uncertainty/precision are specified.

## What stays outside initially

The following are intentionally not trusted-core responsibilities:

- HTTP/API access;
- API-key management;
- model/provider discovery;
- retries and backoff;
- prompt templating;
- vendor-specific token counting;
- arbitrary JSON parsing;
- database engines;
- charts and report formatting;
- unverified cryptographic implementations.

Keeping these outside avoids turning the trusted computing base into the whole application.

## Source layout

```text
trusted_core/
  bronco_core.gpr
  src/
    bronco.ads
    bronco-types.ads
    bronco-decision_rules.ads
    bronco-decision_rules.adb
```

The initial source is intentionally tiny: bounded domain types plus one contract-driven decision primitive. It is an assurance scaffold, not a benchmark feature.

## Toolchain policy

Before the first tagged release:

1. Pin GNAT/SPARK/Why3/prover versions used for proof.
2. Store machine-readable proof reports as CI artifacts.
3. Treat unproved checks as failures unless explicitly justified in the assumptions/deviation ledger.
4. Make proof command lines reproducible from repository configuration.
5. Record compiler switches and target platform.
6. Review every use of `SPARK_Mode => Off`, imported code and external axioms.

## Formal verification does not replace experimental validity

SPARK can prove that deterministic code obeys its specification. It cannot by itself prove that:

- the benchmark measures the intended human/AI construct;
- the dataset is representative;
- a provider actually ran the model it claims;
- a judge rubric is unbiased;
- a statistical model is appropriate;
- a standards interpretation is correct.

BRONCO therefore uses two independent trust disciplines:

- **empirical metrology** for the validity of the measurement procedure;
- **formal verification** for the correctness of selected deterministic implementation steps.
