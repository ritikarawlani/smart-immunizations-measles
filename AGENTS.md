# AGENTS.md — smart-immunizations-measles

This file is agent-generic: Claude Code, Gemini CLI, Cursor, Copilot and others
read it natively. What binds everywhere is the harness's
[`AGENTS.md`](https://github.com/litlfred/cat-harness/blob/HEAD/AGENTS.md); what
this repository *is* is [`README.md`](README.md).

## Entry point

Any authoring or adaptation work here is smart-base's
[`smart-guideline-end-to-end`](https://github.com/litlfred/smart-base/blob/main/smart-base/skills/content/authoring-who-smart-guidelines/smart-guideline-end-to-end.md):
L1, then L2, then L3, each stage's review requested before the next stage
starts.

## The source rule

**Content comes only from the sources attached to issue #1** (owner,
2026-11-20): the files in `uploads/` (two of them referenced only, their licence forbidding a copy) and the page `who.int/data/immunization`.
folio-assistant supplies skills, processes and tools, never content. Do not
copy L1, L2 or L3 content from another guideline, including
smart-immunizations, even where it covers the same ground.

## What this instance is

A layer on smart-base. It has no harness of its own: `index.config.json`
mounts `smart-base` and the layers below it (`bun run cat <script>` mounts
them on first use from `index.lock.json`), and
`smart-immunizations-measles.json` declares what an index may mount from here.

## The one rule

**The declaration names only what an index mounting this instance has.** When
you add a directory (an `l1-extraction/`, an annex directory), declare it in
`smart-immunizations-measles.json` in the same change.
