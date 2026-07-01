# Startr.ca TODOs

This document tracks only active, incomplete work for the Startr.ca (`WEB-startr`) Eleventy site.

> **Convention** — Sections below map to kanban columns. Inline source-code
> tags use the same vocabulary so items stay cross-referenced between this
> file and the codebase via [TodoScope](https://github.com/Startr/WEB-TodoScope).
>
> | Column      | Markdown section          | Inline tag  |
> |-------------|---------------------------|-------------|
> | Backlog     | `## Backlog`              |             |
> | TODO        | `## TODO`                 | `# TODO:`   |
> | In Progress | `## In Progress`          | `# FIXME:`  |
> | Bugs        | `## Bugs`                 | `# BUG:`    |
> | Done        | `- [x]` items / `## Done` | —           |
>
> `# DEPRECATED:` tags should be tracked as TODO items for removal at the
> stated version.

## In Progress

_No active work in flight. Move a card here (or use a `# FIXME:` inline tag) when you start it._

## TODO

### Housekeeping

- [ ] **Remove editor-backup artifact**: `src/style.css~` (126KB) is a stray editor `~` backup committed to the repo. Confirm it's dead, delete it, and add `*.css~` / `*~` to `.gitignore` so backups don't recur.
- [ ] **Resolve `page_notes.md` templating placeholders**: the file is a draft with unresolved `{ ourSite }`, `{ partnerSite }`, `{ contry }` (typo) tokens. Decide whether it becomes a real page/data-driven include or gets removed; fix the `contry` → `country` typo if kept.
- [ ] **Add a real `test` script or drop the failing one**: `package.json` `test` currently `echo "Error: no test specified" && exit 1`. Either wire a smoke build/link check or remove it so `npm test` isn't a guaranteed failure.

### Content

- [ ] **Expand the two `STARTR_BLOCKS.md` content TODOs** (`src/STARTR_BLOCKS.md`): the AGPL-licensing importance section and the "40% would be sad" source citation are marked incomplete in the prose. Flesh out the copy and add the source.

## Backlog

_Move lower-priority items here. No queued backlog work captured yet._

## Bugs

_No known bugs. Use `# BUG:` inline tags to flag defects in source._

## TodoScope Alignment

Bootstrap pass on 2026-07-01: created this `TODO.md` and `.todoscope-exclude.csv` from scratch (repo had neither). Structure conforms to the convention above — canonical section headers, convention header, exclude CSV scoped to build output and binary assets.

- [ ] **Migrate inline source-code tags to `TODO:` / `FIXME:` / `BUG:`** so the scanner picks them up. Sweep `src/` (`.njk`, `.js`, `.md`, `.html`) for ad-hoc tags (`@todo`, `// todo`). Note: the `TODO` markers in `src/STARTR_BLOCKS.md` are content-editing notes, tracked under Content above — not code tags.
- [ ] **Review `.todoscope-exclude.csv` paths** after the first scan — add any generated or binary-asset dirs missing from the initial list (`src/SVGs`, `src/imgs` were left in; exclude them if the scan surfaces noise).
- [ ] **Run the TodoScope scanner and verify the kanban board matches expectations** — adjust the convention header / column aliases here if anything is mis-categorized.

## Done

Completed items live under `## Done` (or `- [x]` anywhere). Bulk-move to a `docs/todo-archives/` file once this section grows.
