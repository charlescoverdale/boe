# boe improvement plan

Roadmap for the next minor releases of the **boe** R package, plus a separate Python port.

## Status (as of 2026-05-07)

v0.2.0 live on CRAN (2026-04-27). 19 exports, R CMD check 0 / 0 / 0. Phases 1 to 4 of the v2 plan shipped (provenance S3 class, search and browse, cache info, Anderson-Sleath curves at the latest month, MPC decisions / votes / MPR forecasts).

## Why

User feedback received 2026-05-07:
1. **Liked**: ingestion is easy and the data is accurate; wide variety of series.
2. **Wanted**: full Anderson-Sleath fitted curves (nominal / real / inflation / OIS, spot or forward) at all maturities going further back in time. Currently only the latest month is exposed by `boe_curve()`.
3. **Suggested**: a Python equivalent for teams that pivot between R and Python.

The first item is the most actionable and is exactly the gap flagged as "the next step here" inside the existing v2 plan (Phase 3 yield-curve depth). The Python port is a parallel track.

## Audit gaps (relative to the feedback)

| Feature | Status | Target version |
|---|---|---|
| `boe_curve()` historical archive | latest month only | v0.3.0 |
| Multi-decade splicing across archive zips | absent | v0.3.0 |
| Pre-2007 Excel layout fallback | untested | v0.3.0 |
| Pillar-maturity panel helper | absent | v0.3.0 |
| Yield-curve vignette | absent | v0.3.0 |
| Python equivalent | absent | boe-py v0.1.0 |

## Phase 4b: Historical yield curves (v0.3.0)

**Target**: end June 2026.

### What the BoE actually publishes

Beyond the rolling `latest-yield-curve-data.zip` already used, the BoE statistics page exposes archive zips by curve type, typically split into multi-year periods. Coverage by curve (subject to verification in task 1):

- Nominal spot and forward: from ~1979 (gilt-only).
- Real spot and forward: from ~1985 (index-linked).
- Implied inflation: derived from the difference between nominal and real, same coverage as real.
- OIS spot and forward: from ~2009.

### Sub-tasks

1. **Enumerate archive URLs.** Scrape the yield curves landing page once during development, then hardcode a registry of archive URLs and date ranges in `R/sysdata.rda` keyed on (curve, period_start, period_end). Add a `data-raw/build_archive_registry.R` script that regenerates this registry. CI nightly job hits `HEAD` on each registered URL to detect 404s when BoE reorganises the page.
2. **Extend `boe_curve()`** with two new arguments:
   - `from`, `to` (Date or character "YYYY-MM-DD"). Default `from = NULL` keeps current behaviour (latest month only).
   - When `from` reaches beyond the latest archive, internally fetch the appropriate historical zip(s), parse each, splice, dedupe on (date, maturity_years), order by date.
3. **Parser robustness.** Older workbooks (pre-2007 in some curves) use slightly different sheet naming and column layouts. Replace the fixed row-4 maturity assumption with content-based header detection (find the row whose first non-empty cell is "years to maturity" or whose values monotonically increase from ~0.5 to ~25). Keep the fast path for modern files.
4. **Caching strategy.** Historical zips are stable artefacts. Set TTL to 30 days (720 hours) for archive zips versus 24 hours for the latest zip. New helper `download_yield_archive(curve, period, cache_ttl_h = 720)`.
5. **Provenance.** Extend the `boe_tbl` query slot to record `archive_periods` (vector of period strings) and `archive_urls` (vector of source URLs), so the data carries its own audit trail.
6. **Convenience wrapper** `boe_curve_panel(curve, measure, from, to, maturities = c(0.5, 1, 2, 5, 10, 20))`. Returns a wide panel at chosen pillar maturities for quick plotting and time-series modelling. This is the form most users actually want for analysis.
7. **Vignette** `vignettes/yield-curves.Rmd` (~6 pages). Three worked examples:
   - Reconstruct the 10-year nominal spot rate 2000 to present, overlay Bank Rate.
   - 5y5y forward implied inflation 2010 to present, with QE event-window shading.
   - OIS curve evolution across the 2022 to 2024 hiking and easing cycle, joined to `boe_mpc_decisions()`.
8. **Tests:** +25. Use `httptest2` fixtures for one archive period from each curve type. Include one fixture from a pre-2007 file to lock in the fallback parser.

### Function signatures (proposed)

```r
boe_curve(
  curve       = c("nominal", "real", "inflation", "ois"),
  measure     = c("spot", "forward"),
  from        = NULL,    # NULL means latest month only
  to          = NULL,    # NULL means today
  cache       = TRUE,
  cache_ttl_h = NULL     # NULL means 24 for latest, 720 for archive zips
)

boe_curve_panel(
  curve      = c("nominal", "real", "inflation", "ois"),
  measure    = c("spot", "forward"),
  maturities = c(0.5, 1, 2, 5, 10, 20),
  from       = NULL,
  to         = NULL,
  cache      = TRUE
)
```

### Risks and mitigations

- **Archive URL drift.** BoE may reorganise the yield-curve page. Mitigation: registry stored in `data-raw/`, regeneration script, CI nightly URL check.
- **Encoding and layout drift in older Excel files.** Mitigation: content-based header detection, one fixture per decade in tests.
- **File sizes.** A multi-decade nominal zip is large (~100 MB unpacked). Mitigation: cache aggressively, document `boe_cache_info()` and `clear_cache()` in the vignette.
- **API surface bloat.** Two new functions plus two new arguments. Mitigation: keep `boe_curve()` defaults unchanged so existing user code continues to return the latest month exactly as before.

## Phase 5: Vintage and real-time (v0.4.0)

Unchanged from the v2 plan. Targets `boe_as_of()`, `boe_vintage()`, `boe_real_time_panel()`. Reverse-engineer the BoE revision calendar from IADB.

## Phase 6: JOSS submission (v1.0.0)

**Target**: October 2026.

- `inst/paper.md` (3,500 words). Statement of need versus `bbk` (SDMX-generic) and `pdfetch` (cross-source).
- Differentiator framing: provenance spine + Anderson-Sleath archive depth + vintage support. The historical-curve work in v0.3.0 is now a load-bearing argument for the paper.
- One additional vignette "Reproducible UK macro research with boe" covering manifest, citation, and vintage panel.
- Nightly live-API CI job.

## Phase 7: Python port (boe-py, separate repo, parallel track)

**Target**: MVP by end July 2026.

### Repo and naming

- GitHub: `charlescoverdale/boe-py`.
- PyPI name: check availability for `boe`, `boe-data`, `bankofengland`. Probably `boe-data` (descriptive, hyphenated, follows Python community convention).
- Import name: `import boe_data as boe`. Keeps call sites identical between languages: `boe.curve(...)`, `boe.bank_rate(...)`.

### MVP scope (v0.1.0)

Four highest-value endpoints. Do not try to mirror the entire R surface on day one.

- `boe.curve(curve, measure, from_, to)`: historical Anderson-Sleath. Primary feedback ask.
- `boe.bank_rate(from_, to)`.
- `boe.sonia(from_, to)`.
- `boe.search(query)` and `boe.catalogue()`.

### Stack

- Python 3.10+.
- Runtime: `httpx[http2]`, `pandas`, `openpyxl`, `pyarrow` (for parquet caching), `pydantic` (config and validation only).
- Dev: `pytest`, `pytest-vcr` (cassette-based recordings, equivalent to R's `httptest2`), `ruff`, `mypy`, `mkdocs-material`.
- Provenance: a `BoEFrame` class subclassing `pandas.DataFrame` with `.attrs["query"]` populated, plus a `_repr_html_` override for Jupyter that mirrors `print.boe_tbl`.

### Cross-language consistency

- Identical function names (already snake_case in R) and identical argument order.
- Same cache directory convention: `~/.cache/boe/` on Linux and macOS, `%LOCALAPPDATA%/boe/cache/` on Windows.
- Cache files are interchangeable between R and Python: parquet for cached data tables, raw zip for source files. R reads what Python wrote and vice versa.
- Single source of truth for the catalogue: a CSV in the R repo's `data-raw/`. Both packages ship it (R as `boe_series.rda`, Python as `boe_series.parquet`). Release scripts in both repos pull from the same upstream.

### v0.2.0 and beyond (Python)

Mortgage rates, mortgage approvals, money supply, exchange rates, MPC decisions / votes / MPR forecasts. Brings boe-py to roughly the current R surface.

### Documentation and CI

- `docs/` via mkdocs-material at `boe-py.readthedocs.io`. One quickstart, one yield-curve worked example, API reference autogenerated from docstrings.
- GitHub Actions: lint, type-check, tests on Python 3.10 / 3.11 / 3.12 across Linux, macOS, Windows.
- PyPI publishing via Trusted Publishing (no API tokens).
- Cassettes for offline tests; nightly live job against BoE endpoints.

### Risks and mitigations

- **Maintenance doubles.** Mitigation: lock Python one minor version behind R; only port endpoints once stable; share a single catalogue source.
- **Subclassing `pandas.DataFrame` has known quirks** (operations that strip subclass type). Mitigation: if `BoEFrame` proves brittle, fall back to attaching provenance to `.attrs` on plain DataFrames.
- **Two-language testing surface.** Mitigation: cassettes and parquet fixtures shared via a small `boe-fixtures` GitHub repo, vendored into both packages.

## Targets at end of plan

- **R**: 22 to 25 exports, 200+ tests, 3 vignettes, JOSS paper drafted, v1.0.0.
- **Python**: ~10 functions in MVP, ~80 tests, mkdocs site live, v0.1.0 on PyPI.
- **Cross-language**: shared catalogue, shared cache convention, identical API signatures.

## Versioning

- R: 0.2.0 to 0.3.0 (Phase 4b) to 0.4.0 (Phase 5) to 1.0.0 (JOSS acceptance).
- Python: 0.1.0 (MVP) to 0.2.0 (full surface) to 1.0.0 once R has cleared 1.0.0.

## Concrete first commit (R, Phase 4b)

1. `data-raw/build_archive_registry.R`: scrape the yield-curve page, write a tibble of (curve, period_start, period_end, url) to `R/sysdata.rda` via `usethis::use_data(internal = TRUE)`.
2. `R/yield_archives.R`: `download_yield_archive(curve, period)` mirroring the existing `download_yield_zip()` but parameterised by period and with a 30-day TTL.
3. Refactor `boe_curve()` to dispatch to the latest-zip path when `from = NULL`, otherwise resolve `from` and `to` against the registry, fetch the relevant archive zips, and splice.

## Cross-package vignette backlog

1. boe x inflateR: real gilt yields and the breakeven term structure 2000 to present.
2. boe x inflationkit: 5y5y inflation expectations versus realised CPI.
3. boe x yieldcurves: refit Nelson-Siegel on BoE-published spot pillars and compare to BoE's Anderson-Sleath fit.
4. boe x mpshock: UK monetary policy shock identification using OIS surprises around MPC decisions.

## Function backlog (beyond Phase 4b to 7)

- `boe_curve_par_yields()`: par-equivalent yields from spot curve (pure computation).
- `boe_curve_zero_rates()`: zero-coupon rates extracted from spot.
- `boe_yield_carry(maturity_held, maturity_funded)`: carry and rolldown helper.
- `boe_term_premium()`: optional ACM-style or Adrian-Crump-Moench term-premium decomposition (requires factor model; defer).
