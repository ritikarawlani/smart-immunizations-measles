# AGENTS.md — WHO SMART Guidelines — Measles Immunization

This is a **folio**: the content repository. The authoring platform —
skills, schemas, MCP tools, the publication pipeline — is
[folio-assistant](https://github.com/litlfred/folio-assistant.git), checked out at `../folio-assistant/`.

This file is the **agent-generic** source of truth, read natively by Claude
Code, Gemini CLI, Antigravity, Cursor and Copilot. `CLAUDE.md` and
`GEMINI.md` are thin stubs pointing here.

> **Content lives here; formalism lives in the platform.** If you are about to
> add a schema, a validator, a QA criterion or a skill, it belongs in
> folio-assistant, not in this repo. If you are about to add a chapter, a
> recommendation or a table, it belongs here.

## Content type: `document`

A **document** folio: structured prose — policy guidance, a standard, a
report, a handbook. No Lean formalization, and no TeX installation required to
publish.

**Block kinds you may use:** `prose`, `example`, `remark`, `algorithm`,
`simulator`, `equation`, `diagram`, `table`.

**Kinds you may NOT use:** `definition`, `theorem`, `lemma`,
`proposition`, `corollary`, `conjecture`, `proof`. Those are the paper
profile — their assertion is a formal mathematical claim backed by a `.lean`
sibling, and this folio has no toolchain to check one. `content_validate`
enforces this on every run.

Reaching for `theorem` to carry a recommendation is the common mistake. Load
the `normative-statements` skill instead.

## Layout

```
folio/measles/          the document
  measles.ts             its manifest — chapters, in reading order
  <chapter>/<chapter>.ts   a chapter manifest — sections, in reading order
  <chapter>/<root>.ts      a block manifest
  <chapter>/<root>.md      that block's prose
folio/schema/            re-export shim for the platform's builders
test/results/block-qa/     QA verdicts, one per block, mirroring folio/ (machine-written — never hand-edit)
library/                   ingested source documents (read-only reference)
uploads/                   source PDFs, for offline citation verification
../folio-assistant/              the platform
beans/                    the work plan
```

## Commands

```sh
bun run ../folio-assistant/cat-harness/src/index.ts --stdio --repo .   # the MCP server
bun run ../folio-assistant/cat-harness/src/index.ts --check-deps       # what's installed
bun run ../folio-assistant/cat-harness/content/pipeline/qa-sweep.ts folio  # QA every block
```

## QA — every block is checked from the first commit

`qa-sweep` runs every criterion a script can check against each block, and
writes one verdict file per block under `test/results/block-qa/`. **Commit
those files with the edit they are about**: a verdict is keyed on the block's
content hash, so one that is older than its block reads as stale, never as
passing.

The staging preview sweeps each pull request as well (`.github/workflows/staging.yml`),
so the review page's QA column reports that build. `.github/workflows/qa-sweep.yml`
runs the full sweep in CI, and `qa-sweep-nightly.yml` refreshes stale verdicts;
both are dispatch-only until you enable their triggers. Criteria that need an
agent's judgement (voice, exposition, adversarial review) are not run by the
sweep; they stay unaudited until an agent records them.

## Work plan — use `beans`

`beans/` is committed, so the plan survives a fresh container and a sibling
session sees it. Claim before you work; never resolve a sibling's bean.

```sh
../folio-assistant/cat-harness/scripts/install-beans.sh
beans list
beans create "<title>"
beans <id> --status in-progress
```

**Check before you create** — `beans create` is not idempotent and dedupes on
nothing, so re-entering a step duplicates the plan rather than no-op'ing.

## The skills are in the platform, not here

Ask for them by name and the agent loads them over MCP (`skill_fetch`):

| Package | What |
|---|---|
| `folio-core` | content-agnostic: bean coordination, editorial review, QA |
| `folio-document-adapter` | `document-authoring`, `document-structure`, `normative-statements`, `document-publishing` |

Do not copy a skill body into this repo. It will drift, and the platform's copy
is the one every other folio is reading.
