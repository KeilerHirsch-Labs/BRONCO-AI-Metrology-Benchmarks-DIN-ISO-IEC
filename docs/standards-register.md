# Standards & Metrology Register

**Status check:** 2026-08-13

This register tracks the external standards and metrology references that shape BRONCO. It is a **traceability index**, not a substitute for the standards themselves. Copyrighted standards text is not reproduced here.

Status labels:

- **Published** — published standard/reference used as an engineering input.
- **Current DIN adoption** — current German adoption shown by DIN Media.
- **Technical report / guidance** — informative or guidance-oriented publication, not silently treated as a requirements standard.
- **DIN SPEC / PAS** — publicly available specification; not described as a DIN Norm.
- **Draft / under development** — tracked for change awareness; not used as a stable normative dependency.

## A. Metrology and laboratory validity

| Reference | Status | BRONCO use | Official source |
|---|---|---|---|
| JCGM 200:2012, VIM 3rd ed. | Published | Canonical metrology vocabulary: measurement, measurand, result, uncertainty, traceability, etc. | https://www.bipm.org/en/doi/10.59161/jcgm200-2012 |
| JCGM 100:2008, GUM | Published | Measurement-uncertainty framework; used carefully where concepts transfer to AI evaluation. | https://www.bipm.org/en/publications/guides |
| JCGM 100:2008/Amd.1:2026 | Published amendment | Tracks current GUM treatment of nonlinearity in measurement models. | https://www.bipm.org/en/publications/guides |
| JCGM GUM-1:2023 | Published | Modern introductory part of the GUM family. | https://www.bipm.org/en/publications/guides |
| JCGM GUM-5:2026 | Published | Current examples in uncertainty evaluation. | https://www.bipm.org/en/publications/guides |
| ISO/IEC 17025:2017 | Published; confirmed 2023 | Reference for competence, impartiality, consistent laboratory operation, validity of results and metrological traceability. BRONCO does **not** claim accreditation. | https://www.iso.org/standard/66912.html |
| DIN EN ISO/IEC 17025:2018-03 | Current DIN adoption | German/European adoption used for DIN-aligned terminology and laboratory-quality context. | https://www.dinmedia.de/de/norm/din-en-iso-iec-17025/278030106 |
| ISO 5725-1:2023 | Published | Accuracy, trueness and precision concepts; general statistical principles. | https://www.iso.org/standard/69418.html |
| ISO 5725-2:2019 | Published | Repeatability/reproducibility study design and precision estimation. | https://www.iso.org/standard/69419.html |
| ISO 5725-4:2020 | Published | Bias/trueness estimation concepts. | https://www.iso.org/standard/69421.html |
| ISO 5725-5:2025 | Published | Robust approaches for precision experiments and outlier-sensitive analysis. | https://www.iso.org/standard/79066.html |
| ISO/PRF 5725-6 | Draft / under development | Monitored because it will revise practical use of accuracy values; no stable dependency until publication. | https://www.iso.org/standard/85600.html |

### Interpretation rule

Classical metrology standards were not written specifically for stochastic hosted AI services. BRONCO therefore distinguishes:

1. **directly reusable concepts** (for example repeatability, reproducibility, traceability of a procedure);
2. **adapted concepts that require a documented mapping**; and
3. **analogies that must not be represented as normative equivalence**.

## B. AI concepts, quality, risk and lifecycle

| Reference | Status | BRONCO use | Official source |
|---|---|---|---|
| ISO/IEC 22989:2022 | Published | AI concepts and terminology baseline. | https://www.iso.org/standard/74296.html |
| ISO/IEC 23053:2022 | Published | Framework for AI systems using ML; system/component vocabulary. | https://www.iso.org/committee/6794475/x/catalogue/ |
| ISO/IEC 23894:2023 | Published | AI-specific risk-management guidance and risk integration. | https://www.iso.org/standard/77304.html |
| ISO/IEC TR 24027:2021 | Technical report | Bias in AI systems and AI-aided decision-making; bias taxonomy context. | https://www.iso.org/committee/6794475/x/catalogue/ |
| ISO/IEC TR 24028:2020 | Technical report | Trustworthiness overview and terminology context. | https://www.iso.org/ics/35.020/x/ |
| ISO/IEC TR 24029-1:2021 | Technical report | Robustness-assessment overview for neural networks. | https://www.iso.org/standard/77609.html |
| ISO/IEC 24029-2:2023 | Published | Methodology for using **formal methods** to assess neural-network robustness; important methodological bridge to BRONCO's assurance philosophy. | https://www.iso.org/standard/79804.html |
| ISO/IEC DIS 24029-3 | Draft / under development | Statistical methods for robustness assessment; tracked, not treated as published. | https://www.iso.org/standard/86901.html |
| ISO/IEC 25059:2023 | Published; revision underway | SQuaRE quality model for AI systems; quality characteristics and sub-characteristics. | https://www.iso.org/standard/80655.html |
| ISO/IEC DIS 25059, Edition 2 | Draft / under development | Monitored revision of the AI quality model; does not silently replace the 2023 edition until published. | https://www.iso.org/standard/88234.html |
| ISO/IEC 42001:2023 | Published | AI management-system governance context. Not a benchmark-scoring specification. | https://www.iso.org/standard/42001 |
| ISO/IEC 5338:2023 | Published | AI-system lifecycle processes; ties AI lifecycle work to 12207/15288 concepts. | https://www.iso.org/standard/81118.html |

## C. AI data quality

The ISO/IEC 5259 family is treated as a first-class dependency for dataset and evaluation-data quality.

| Reference | Status | BRONCO use | Official source |
|---|---|---|---|
| ISO/IEC 5259-1:2024 | Published | Overview, terminology and examples. | https://www.iso.org/standard/81088.html |
| ISO/IEC 5259-2:2024 | Published | Data-quality model and measures. | https://www.iso.org/publication/PUB200525.html |
| ISO/IEC 5259-3:2024 | Published | Data-quality management requirements/guidelines. | https://www.iso.org/publication/PUB200525.html |
| ISO/IEC 5259-4:2024 | Published | Data-quality process framework, including labelling/evaluation lifecycle. | https://www.iso.org/standard/81093.html |
| ISO/IEC 5259-5:2025 | Published | Data-quality governance framework. | https://www.iso.org/standard/84150.html |
| ISO/IEC TR 5259-6:2026 | Technical report | Visualization framework for data-quality measures. | https://www.iso.org/standard/86532.html |

## D. DIN-specific AI quality context

| Reference | Status | BRONCO use | Official source |
|---|---|---|---|
| DIN SPEC 92001-1:2019-04 | **DIN SPEC / PAS — current** | AI quality meta-model; performance/functionality, robustness and comprehensibility context. | https://www.dinmedia.de/de/technische-regel/din-spec-92001-1/303650673 |
| DIN SPEC 92001-2:2020-12 | **DIN SPEC / PAS — current** | AI-specific robustness requirements, including adversarial and corruption robustness. | https://www.dinmedia.de/de/technische-regel/din-spec-92001-2/330011015 |
| Deutsche Normungsroadmap KI, Ausgabe 2 (DIN/DKE, 2022) | Strategic roadmap | German standardization landscape and identified AI standardization needs. | https://www.din.de/de/forschung-und-innovation/themen/kuenstliche-intelligenz/fahrplan-festlegen/zweite-ausgabe-der-deutschen-normungsroadmap-ki-845704 |

DIN SPEC documents are retained with their real status. BRONCO must never relabel a PAS specification as a DIN Norm.

## E. Ada/SPARK trusted-core foundation

| Reference | Status | BRONCO use | Official source |
|---|---|---|---|
| ISO/IEC 8652:2023 | Published; revision project active | Ada language baseline for the trusted core. | https://www.iso.org/standard/83621.html |
| ISO/IEC AWI 8652, Edition 5 | Draft / under development | Tracked for future Ada-language changes; current code targets the published 2023 edition. | https://www.iso.org/standard/87737.html |
| SPARK Reference Manual | Current toolchain documentation | Defines the SPARK language subset/extensions and formal-verification model. | https://docs.adacore.com/spark2014-docs/html/lrm/introduction.html |
| SPARK User's Guide | Current toolchain documentation | Proof workflow and assurance levels, including AoRTE and contract proof. | https://docs.adacore.com/spark2014-docs/html/ug/en/usage_scenarios.html |

## Standards change-control policy

1. This file is date-stamped whenever lifecycle status is re-checked.
2. A draft may inform research but cannot silently alter a released BRONCO measurement procedure.
3. When a referenced standard is revised, BRONCO performs an impact review before changing protocol semantics.
4. Released benchmark versions pin the standards register revision they were developed against.
5. Standards-aligned means **traceable design influence**, not certification or accreditation.
6. Any direct quotation from a standard must respect licensing/copyright; BRONCO defaults to paraphrase plus official reference.
