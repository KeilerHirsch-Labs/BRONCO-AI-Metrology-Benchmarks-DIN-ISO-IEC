# BRONCO Benchmark Integrity Roadmap Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Integrate anti-contamination, independent challenge generation, external entropy, burn/rotation policy, and trusted-core integrity obligations into BRONCO's existing research-first roadmap without weakening the DIN/ISO/IEC/JCGM metrology foundation.

**Architecture:** Preserve the existing R0–R7 numbering and fold benchmark-integrity requirements into the phases where they belong. R3 becomes the principal reproducibility/provenance/independent-challenge gate, while R2, R4, R5–R7 and cross-cutting rules receive narrowly scoped integrity requirements.

**Tech Stack:** Markdown, GitHub contents API, BRONCO Ada/SPARK trusted-core design.

## Global Constraints

- DIN/ISO/IEC/JCGM standards remain the public measurement foundation.
- Concrete reportable test instances are sealed before execution.
- External entropy must not be unilaterally selectable by KeilerHirsch-Labs, a vendor, or a single evaluator after observing behavior.
- Selection is deterministic after the frozen generator and external entropy are fixed.
- Public/disclosed challenge instances are burned for future frontier-model evaluation.
- The design treats contamination/eval-aware optimization as a threat model, not an accusation against a specific vendor.
- Preserve R0–R7 numbering to avoid breaking existing references.

---

### Task 1: Update ROADMAP.md benchmark-integrity gates

**Files:**
- Modify: `ROADMAP.md`

**Interfaces:**
- Consumes: `docs/superpowers/specs/2026-08-14-benchmark-integrity-design.md`
- Produces: a roadmap whose R0–R7 phases encode hidden challenge generation, provenance, external entropy, SPARK integrity obligations, pilot/public-data separation, replication, and burn policy.

- [ ] **Step 1:** Expand R1 validity threats to include public-item exposure and eval contamination.
- [ ] **Step 2:** Expand R2 so experimental design predefines task-family universes, hidden/reportable versus public-development data, and challenge-sampling constraints.
- [ ] **Step 3:** Rename/expand R3 to `Reproducibility, provenance and independent challenge generation`; add freeze/commit/external-entropy/deterministic-selection/sealed-execution/evidence-package requirements and exit criteria.
- [ ] **Step 4:** Expand R4 trusted-core duties with entropy-to-selection mapping, committed-universe membership, uniqueness/sample-count/stratification invariants, Frozen-state challenge immutability, score-row identity and deterministic canonicalization.
- [ ] **Step 5:** Constrain R5 pilots to public/development or explicitly non-reportable challenge material unless a fresh sealed set is generated under R3.
- [ ] **Step 6:** Expand R6 independent replication to verify challenge commitments and distinguish repeatability/reproducibility from hidden-set leakage.
- [ ] **Step 7:** Expand R7 release package with pre-run commitments, external entropy proof, challenge-set hash/order, runtime evidence, raw outputs, burn/rotation state and vendor-symmetric access.
- [ ] **Step 8:** Add cross-cutting rules forbidding static public reportable frontier sets, operator-selected hidden sets, uncommitted seed substitution, privileged vendor access and silent reuse of burned items.
- [ ] **Step 9:** Commit with message `docs: add hidden challenge integrity gates to roadmap`.

### Task 2: Verify the published roadmap

**Files:**
- Verify: `ROADMAP.md`

**Interfaces:**
- Consumes: updated default-branch ROADMAP.md.
- Produces: evidence that the pushed file contains all required integrity concepts and retained R0–R7 numbering.

- [ ] **Step 1:** Fetch `ROADMAP.md` from `main` after the write.
- [ ] **Step 2:** Verify exact presence of: `external` entropy/randomness, deterministic challenge selection, sealed challenge set, commitment/hash provenance, burn/rotation policy, vendor-symmetric access, and Ada/SPARK selection invariants.
- [ ] **Step 3:** Verify R0–R7 headings remain present and no phase was accidentally deleted.
- [ ] **Step 4:** Fetch the resulting commit and inspect the diff for ROADMAP-only intended changes plus the already-approved design/plan documentation commits.
