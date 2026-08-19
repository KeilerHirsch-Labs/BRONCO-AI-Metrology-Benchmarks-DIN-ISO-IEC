# BRONCO — AI Metrology & Benchmarks

**Research-first infrastructure for reproducible, uncertainty-aware and auditable measurement of AI-system behaviour.**

BRONCO is not a leaderboard-first benchmark collection. The project starts one layer earlier: **what exactly is being measured, under which conditions, with which uncertainty, and what evidence is required before a score is allowed to mean anything?**

The long-term goal is a benchmark and metrology framework whose claims are traceable to explicit measurement procedures, controlled experimental conditions, statistical evidence and a small formally verified trusted core.

> **Current phase:** foundation and research protocol. No performance claims, conformance claims or accreditation claims are made.

> [!NOTE]
> ### Why Anthropic first?
> [Anthropic describes itself](https://www.anthropic.com/company?type=company) as a **“safety-first company,”** says **“Safety Is a Science,”** and aims to **“set the industry bar for AI safety and security.”**
>
> BRONCO takes those claims seriously. A company seeking to set the industry's safety bar is an especially useful first field case for testing whether safety- and policy-relevant measurements are reproducible, uncertainty-aware and independently auditable.
>
> **No misconduct is presumed. If you aim to set the bar, the bar itself should be measurable.**
>
> [Read FC-001 — Policy-Driving AI Evaluation Provenance](docs/field-cases/FC-001-policy-evaluation-provenance.md) · [Browse BRONCO Field Cases](docs/field-cases/README.md)

## Design doctrine

1. **Research before implementation.** Literature, standards, constructs, hypotheses and nuisance variables come before benchmark features.
2. **Measurement before ranking.** A scalar score is only useful after the measurand, procedure, validity limits and uncertainty are defined.
3. **Reproducibility over screenshots.** Every result must be reconstructable from a frozen experiment manifest and retained evidence.
4. **Model identity is evidence, not a label.** Provider/model strings are recorded, but routing, fallback and version ambiguity are treated as measurement risks rather than assumed away.
5. **Uncertainty is part of the result.** Stochastic variation, sampling, evaluator disagreement and environment uncertainty must not be hidden behind false precision.
6. **Separate trusted calculation from untrusted orchestration.** Provider adapters, network I/O and rapidly changing APIs stay outside the trusted core.
7. **Formal verification where it changes trust.** Ada/SPARK is reserved for the compact deterministic metrology core, not used as ceremony around the whole system.
8. **No standards theatre.** BRONCO uses standards as engineering inputs and traceability anchors; it does not claim certification merely because a standard is cited.
9. **Controlled technical language is part of reproducibility.** Use the [KeilerHirsch Technical Communication Profile (KTCP)](https://github.com/KeilerHirsch-Labs/.github/blob/main/KTCP.md) for canonical terms, explicit evidence qualifiers and low-ambiguity prose. KTCP is a communication profile, not a claim of ASD-STE100 conformity.

## Standards and metrology foundation

BRONCO maintains a living [standards register](docs/standards-register.md). The initial foundation includes:

- **JCGM 200:2012 (VIM)** for metrology vocabulary and measurement concepts.
- **JCGM 100:2008 (GUM)** and the current GUM family for treatment of measurement uncertainty.
- **DIN EN ISO/IEC 17025:2018-03 / ISO/IEC 17025:2017** as a laboratory-quality and validity reference for competent, impartial and consistent testing.
- **ISO 5725** for accuracy, trueness, precision, repeatability and reproducibility concepts.
- **ISO/IEC 22989:2022** for AI concepts and terminology.
- **ISO/IEC 25059:2023** for the AI-system quality model within SQuaRE.
- **ISO/IEC 5259** for data quality in analytics and machine learning.
- **ISO/IEC 24029-1/-2** for neural-network robustness assessment, including formal methods.
- **ISO/IEC 23894:2023**, **ISO/IEC 42001:2023** and **ISO/IEC 5338:2023** for AI risk, governance and lifecycle context.
- **DIN SPEC 92001-1/-2** as German AI-quality/robustness context; these are PAS specifications, not DIN Norms.
- **ISO/IEC 8652:2023** as the Ada language baseline for the trusted core.

BRONCO records the status of draft and superseding standards explicitly. Draft documents are tracked as research inputs but are not silently treated as published normative requirements.

## Architecture

```text
┌──────────────────────────────────────────────────────────────┐
│ Research protocol                                            │
│ constructs · hypotheses · validity · nuisance variables      │
├──────────────────────────────────────────────────────────────┤
│ Evidence & experiment specification                          │
│ manifests · datasets · provenance · raw observations         │
├──────────────────────────────────────────────────────────────┤
│ Ada/SPARK trusted metrology core                             │
│ validation · deterministic transforms · decision rules       │
│ aggregation · bounded arithmetic · proof obligations         │
├──────────────────────────────────────────────────────────────┤
│ Untrusted experiment perimeter                               │
│ provider adapters · API/network I/O · model execution        │
├──────────────────────────────────────────────────────────────┤
│ Analysis & reporting                                         │
│ uncertainty · robustness · comparisons · evidence bundles    │
└──────────────────────────────────────────────────────────────┘
```

The trusted core has a deliberately narrow attack and assurance surface. It does **not** own provider APIs, secrets, network access or vendor-specific model routing.

See the [Measurement Model](docs/measurement-model.md), [Trusted Core](docs/trusted-core.md) and [Research Principles](docs/research-principles.md).

## Research-first roadmap

The roadmap advances through evidence gates rather than feature milestones:

- **R0 — Standards & terminology baseline**
- **R1 — Measurands, constructs & validity model**
- **R2 — Experimental design & uncertainty model**
- **R3 — Reproducibility/provenance specification**
- **R4 — Ada/SPARK trusted-core specification and proof**
- **R5 — Pilot measurement studies**
- **R6 — Cross-environment replication and robustness studies**
- **R7 — Public benchmark release with evidence package**

Each phase has explicit exit criteria in [ROADMAP.md](ROADMAP.md).

## Repository layout

```text
docs/                 research and standards foundation
trusted_core/         Ada/SPARK trusted metrology core
  src/                SPARK sources
  bronco_core.gpr      GNAT project
ROADMAP.md             evidence-gated development roadmap
LICENSE                MIT
```

Dataset, protocol and experiment-runner directories will only be added when the corresponding research gates are satisfied.

## Assurance target for the trusted core

SPARK supports progressively stronger assurance. BRONCO's initial policy is:

- **Bronze-equivalent flow properties as a floor** for all trusted-core code.
- **Silver / absence of run-time errors** as a release requirement for trusted-core code.
- **Gold-level contract proof** for measurement-critical transformations and decision rules.
- **Platinum/full functional correctness selectively**, only where requirements are sufficiently complete to justify it.

The target is proof-backed trust, not a large codebase written in a formally verifiable language without meaningful proofs.

## What BRONCO will not do

- Call a benchmark scientifically valid because it produces a number.
- Treat one model run as a stable model property.
- Conflate reproducibility, repeatability, robustness and accuracy.
- Hide failed runs, reroutes or evaluator disagreement.
- Claim DIN/ISO/IEC certification or ISO/IEC 17025 accreditation without an actual conformity-assessment process.
- Copy copyrighted standards text into this repository.

## Contributing

The project is intentionally conservative during the foundation phase. Research notes, standards corrections, measurement-model criticism and reproducibility challenges are more valuable right now than feature requests.

Please open an issue with the evidence or source behind a proposed change.

## License

MIT © 2026 KeilerHirsch-Labs. See [LICENSE](LICENSE).
