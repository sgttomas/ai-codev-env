# AGENTS: Working in the AI Co‑Development Environment

This document defines how a CLI agent (you) operates inside this workspace. The goal is reliable, auditable, and self‑improving collaboration between humans and AI across multiple child repositories.

See also: `README.md` (environment overview), `START-HERE.md` (onboarding), and SYNC guides in `projects/*/SYNC.md` plus `projects/ai-env/SYNC-NOTES.md`.

## Purpose

- Deliver precise, minimal, and well‑scoped changes that improve code, docs, prompts, workflows, and scripts.
- Encode learning directly into the repo via templates, mirrors, and cross‑links so future agents/humans benefit.

## Responsibilities

- Understand context quickly (read key READMEs and referenced docs before changes).
- Propose and execute a small plan for multi‑step work; keep users informed with brief preambles.
- Edit files using patch‑style changes; verify locally where possible; avoid destructive actions.
- Maintain self‑referential documentation: explain what changed, why, and where to look next.

## Operating Principles

- Clarity over cleverness: prefer simple, auditable implementations.
- Small, reversible steps: land narrow changes; avoid broad refactors unless requested.
- Documentation‑first: update READMEs/templates alongside code; add cross‑links instead of duplicating content.
- Mirror → canonical → consumer loop: iterate quickly in mirrors, upstream stable improvements, validate via lead consumers.

## Workspace Structure You Must Know

- Environment root: this folder (`ai-env/`) is the co‑development environment hosting many projects.
- Meta‑project: `projects/ai-env/` contains environment‑local mirrors (`prompts/`, `scripts/`, `workflows/`), templates, and dev history.
- Canonical libraries:
  - `projects/prompts/` (paired consumer: `projects/chirality-ai-app/`)
  - `projects/scripts/` (paired consumer: `projects/chirality-ai/`)
  - `projects/workflows/` (paired consumer: `projects/chirality-semantic-framework/`)
- Research ↔ applied validation: `projects/chirality_-_ReasonFlux/` ↔ `projects/vibe-project/`.

## Mirrors and Sync

- Iterate fast in mirrors:
  - `projects/ai-env/prompts/` → upstream to `projects/prompts/`
  - `projects/ai-env/scripts/` → upstream to `projects/scripts/`
  - `projects/ai-env/workflows/` → upstream to `projects/workflows/`
- Follow canonical SYNC guides: `projects/*/SYNC.md`.
- Mirror‑side checklist: `projects/ai-env/SYNC-NOTES.md`.

## Safety and Approvals

- Never run destructive actions (e.g., `rm -rf`, `git reset --hard`) without explicit user instruction.
- Assume limited sandboxing and no network unless approved. Ask before installing or fetching.
- Handle secrets carefully: do not print or commit credentials; prefer `.env` patterns documented by each project.

## Tooling and Conventions

- Use ripgrep for discovery: `rg -n "pattern"` and `rg --files`.
- Read files in chunks (≤250 lines) to avoid truncation.
- Apply changes via patch operations (atomic, reviewable).
- Keep diffs minimal; avoid unrelated formatting churn.

## Standard Workflow (Agent)

1) Orient
- Read `START-HERE.md`, root `README.md`, and the target project’s `README.md`.
- If touching prompts/scripts/workflows, also read the relevant SYNC guide.

2) Plan
- Outline 2–6 concise steps; state assumptions. Use the smallest plan that fits.

3) Execute
- Make patch changes; keep commits/scopes small (no mass renames unless requested).
- Update documentation and cross‑links (mirrors ↔ canonical ↔ consumer) as part of the change.

4) Validate
- Run local checks when available (formatters, tests, linters) within sandbox limits.
- Sanity‑check links and paths; avoid absolute machine‑specific paths.

5) Summarize
- Provide a short, scannable summary: outcome, files changed, next options.

## Quality Gates (Before You Say “Done”)

- Purpose: Is the task solved at the root cause, not just patched over?
- Scope: Are only relevant files touched? Any unrelated edits avoided?
- Docs: Are README/notes/templates updated and cross‑linked?
- Mirrors: If you iterated in mirrors, did you point to the canonical SYNC path?
- Safety: No destructive defaults; commands documented; dependencies noted.

## Prompts, Workflows, and Scripts: Authoring Standards

- Prompts (`projects/prompts/`):
  - Use parameter placeholders `{{var}}` (e.g., `{{project_name}}`).
  - Keep templates small and composable; add brief purpose/usage at top.
  - Prove changes in `chirality-ai-app`; upstream with examples.

- Workflows (`projects/workflows/`):
  - Start with “Intent” and short “Steps”; define outputs/acceptance.
  - Keep general; move domain‑specific variants to the mirror.
  - Align with CF14 semantics when relevant; prove alignment in the framework repo.

- Scripts (`projects/scripts/`):
  - Implement `--help`; prefer `--dry-run` for write operations.
  - Document dependencies; keep portability in mind (paths, tools).
  - Validate via `chirality-ai` orchestration.

## Using the Correspondence Map

- `chirality-ai` ↔ `scripts`: operational glue (compose, validation, packaging).
- `chirality-ai-app` ↔ `prompts`: live proving ground for prompt ergonomics and RAG.
- `chirality-semantic-framework` ↔ `workflows`: semantics ↔ operating procedures.
- `chirality_-_ReasonFlux` ↔ `vibe-project`: research ↔ applied, evidence‑driven validation.

Treat each consumer as a living testbed for its paired library. Improvements flow from mirror → canonical → consumer; evidence flows back.

## Communication

- Be concise. Use one‑sentence preambles before grouped actions.
- Ask when the task could imply destructive or network actions.
- Offer next steps: tests to run, docs to read, or follow‑up improvements.

## Common Tasks (Examples)

- Update a prompt and upstream it:
  - Iterate in `projects/ai-env/prompts/` → validate in `chirality-ai-app` → follow `projects/prompts/SYNC.md` → add cross‑links.

- Add a helper script:
  - Prototype in `projects/ai-env/scripts/` → prove in `chirality-ai` → upstream via `projects/scripts/SYNC.md`.

- Refine a workflow:
  - Draft in `projects/ai-env/workflows/` → align with CF14 in `chirality-semantic-framework` → upstream via `projects/workflows/SYNC.md`.

## Anti‑Patterns (Avoid)

- Massive multi‑file edits without a plan or rationale.
- Copy‑pasting whole directories across mirrors/canonicals; prefer targeted ports.
- Leaving changed prompts/scripts/workflows without updating corresponding docs.
- Embedding machine‑specific absolute paths in docs or code.

---

By following this guide, an agent contributes reliable improvements, reinforces the environment’s self‑referential learning loops, and keeps the system coherent for both humans and future agents.
