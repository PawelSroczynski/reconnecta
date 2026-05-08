# Attachments — Source Documents

External documents commissioned for or produced about the Reconnecta parcel. Each file is kept in its original form (e.g. the original German PDF), with English translations or extracts beside it where useful.

---

## 2026-05-07 — Landschaftsplanerische Bewertung (BioPiscinas study)

**Original (German PDF):** [`2026-05-07-Landschaftsplanerische-Bewertung.pdf`](./2026-05-07-Landschaftsplanerische-Bewertung.pdf) · 2.7 MB · 25 pages — authoritative source
**English translation (markdown):** [`2026-05-07-Landschaft-Assessment-EN.md`](./2026-05-07-Landschaft-Assessment-EN.md) · 47 KB
**English translation (PDF):** [`2026-05-07-Landschaft-Assessment-EN.pdf`](./2026-05-07-Landschaft-Assessment-EN.pdf) · 119 KB · 16 pages — built from the markdown via pandoc + xelatex

**Title (DE):** *Landschaftsplanerische Bewertung und Entwicklungsvorschläge inclusive Wasserkonzept — Vorläufige Arbeitsversion der Vorstudie*
**Title (EN):** Landscape-Planning Assessment and Development Proposals, Including Water Concept — Preliminary Working Version of the Preliminary Study
**Authors:** Claudia Schwarzer (Arquitecta paisagista, APAP N.º 399); Udo Schwarzer (Biólogo)
**Imprint:** Rewilding by BioPiscinas Lda. (Aljezur, Portugal · [www.biopiscinas.pt](https://www.biopiscinas.pt))
**Auftraggeber (commissioning client):** Moveart, GmbH (German company; relationship to HOME 4 LIFE LDA pending clarification)
**Date:** April 2026

### What it covers

A preliminary landscape-planning study commissioned for the Reconnecta parcel at Nadadouro, Caldas da Rainha. Two parts:

1. **Survey (Erhebung)** — geography, geology, climate, landscape history, flora and habitats, disturbance factors, preliminary water-resource recommendations.
2. **Mapping (Kartierung)** — vegetation units, potential natural vegetation, disturbance elements, schematic of proposed water solutions.

### Why it matters for the whitepaper

This is the first source that quantifies climate (Köppen Csb, 694 mm/yr, recorded extremes), Natura-2000-keys the vegetation (habitats 9240, 6410pt4, 6430pt2, 4030/4030pt3), reframes the on-site "stream" as an anthropogenic drainage ditch dewatering a former lake/swamp depression, and proposes a concrete intervention (weir on the ditch). The whitepaper sections §5 (Land History), §7 (Climate), §8 (Water) and §9 (Soil & Ecosystems) all draw on it.

### Status

The document is explicitly a *Vorläufige Arbeitsversion der Vorstudie* — a preliminary working version of the preliminary study. Citations carry that caveat.

### Translation notes

The English markdown is a working translation produced 2026-05-08 for the Reconnecta whitepaper pipeline. Latin scientific names are preserved; figure references are kept as bracketed placeholders since pdftotext doesn't extract images. Where meaning is at stake, the German original is quoted alongside the translation. The German PDF remains the authoritative source.

The PDF version was rendered from the markdown via:

```bash
pandoc 2026-05-07-Landschaft-Assessment-EN.md \
  -o 2026-05-07-Landschaft-Assessment-EN.pdf \
  --pdf-engine=xelatex \
  -V geometry:margin=2cm \
  --toc
```

Re-render any time the markdown changes.

---

## 2026-01 — PIP submission package (Pedido de Informação Prévia)

The pre-permit information request submitted by HOME 4 LIFE LDA to the Caldas da Rainha municipality in January 2026. Six files — five thematic volumes plus a single combined PDF.

| File | Pages | Size | What's inside |
|------|-------|------|---------------|
| [`2026-01-PIP-all-documents.pdf`](./2026-01-PIP-all-documents.pdf) | combined | 20 MB | All five volumes merged into a single document — convenience copy |
| [`2026-01-PIP-V1-cadastral.pdf`](./2026-01-PIP-V1-cadastral.pdf) | 22 | 8.5 MB | Cadastral certificates and land-ownership documentation |
| [`2026-01-PIP-V2-project-visuals-biodiversity.pdf`](./2026-01-PIP-V2-project-visuals-biodiversity.pdf) | 18 | 18 MB | Project narrative, environmental description (Portuguese), biodiversity context, *zonas húmidas* mapping |
| [`2026-01-PIP-V3-topographic-site-plans.pdf`](./2026-01-PIP-V3-topographic-site-plans.pdf) | 16 | 15 MB | Topographic survey by TPG Lda (1:500), site plans, contour data |
| [`2026-01-PIP-V4-cross-sections-infra.pdf`](./2026-01-PIP-V4-cross-sections-infra.pdf) | 9 | 6.2 MB | N–S and W–E cross-sections (1:500), infrastructure plan (water, electricity, sewage from Travessa da Avé Maria), photovoltaic siting |
| [`2026-01-PIP-V5-renderings-site-overview.pdf`](./2026-01-PIP-V5-renderings-site-overview.pdf) | 2 | 18 MB | Architectural renderings labelled *RECONECTA \| ENTRADA* and *RECONECTA \| VISTA* (entrance + view); plus aerial site overview |

**Architect:** Arq.º João Carlos Fonseca Jorge (OA #18423, Serra d'El-Rei) — professional indemnity Ageas Portugal #008410215055.

**Submission date:** January 2026 to Caldas da Rainha Câmara Municipal.

**Status:** awaiting municipal response (PIP cycles in rural Portugal typically run 6–18 months).

**Note on naming.** The architect's renderings in V5 carry the project name *"RECONECTA"* (single ‘n’). The whitepaper uses *"Reconnecta"* (double ‘n’) — the project's adopted brand. The PIP filings can be re-titled at a later stage to match if needed.

---

## How to add a new attachment

1. Drop the source file into this directory, prefixed with `YYYY-MM-DD-` so chronology is obvious.
2. If translating: keep both the original *and* the translation in the directory.
3. Add a section to this README describing what it is, who wrote it, why it matters.
4. If it informs the whitepaper, update `whitepaper.md` and `landing/index.html` — the parity rule (see top-level [`README.md`](../README.md)) applies.
