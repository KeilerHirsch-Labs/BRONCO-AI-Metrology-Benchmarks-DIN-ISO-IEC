# Contributing to BRONCO

BRONCO is currently in a **research-foundation phase**. Contributions are welcome, but the acceptance bar is intentionally different from a feature-driven application.

## Highest-value contributions right now

- corrections to the standards register with official sources;
- critiques of construct validity or measurement assumptions;
- reproducibility and uncertainty-model proposals;
- counterexamples that falsify a proposed metric;
- formal specifications, contracts and proof improvements for the trusted core;
- independent replication designs;
- evidence about benchmark contamination, evaluator bias or hidden confounders.

## Please do not lead with features

A new runner, dashboard, provider adapter or score is premature unless it executes a measurement procedure whose construct, evidence requirements and analysis rules are already defined.

A useful proposal answers:

1. What is the measurand/construct?
2. Why is the proposed observable a valid indicator?
3. What are the important nuisance variables?
4. What repeated-measure design is required?
5. How will uncertainty be represented?
6. What evidence must be retained?
7. Which standards or primary research support the method?
8. What result would falsify the proposal?

## Sources

Prefer primary and authoritative sources:

- ISO/IEC/DIN/DKE/BIPM/JCGM publications and official catalogues;
- peer-reviewed research papers;
- official provider documentation for provider-specific behaviour;
- reproducible raw evidence for empirical claims.

Secondary commentary may motivate a question but should not be the sole foundation for a measurement rule.

## Standards copyright

Do not paste copyrighted standards into issues or commits. Paraphrase the relevant requirement/concept and provide the official reference. Free-to-distribute documents remain subject to their own licenses and terms.

## Trusted-core changes

Changes under `trusted_core/` should:

- remain inside the documented trust boundary;
- use bounded/domain-specific types rather than unconstrained convenience types where feasible;
- include contracts for externally visible behaviour;
- avoid `SPARK_Mode => Off` unless the deviation is documented and justified;
- preserve or strengthen the intended proof level;
- update the assumptions ledger/documentation when a proof depends on a new external assumption.

Once CI proof tooling is pinned, unproved checks will be treated as failures unless an explicit reviewed justification exists.

## Experimental evidence

When proposing a benchmark or changing a measurement procedure, include enough information to reconstruct the experiment:

- protocol/manifest version;
- dataset revision;
- requested and observed model identity where available;
- provider/interface;
- sampling settings;
- date/time window;
- number of independent observations;
- failure/retry accounting;
- evaluator and rubric version;
- raw or minimally transformed evidence when licensing/privacy permits.

## Pull-request principle

Small, reviewable changes are preferred. A standards correction should not arrive bundled with a new provider adapter and scoring model.

BRONCO optimizes for **auditability and evidence quality**, not commit volume.
