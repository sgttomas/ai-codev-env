# Start Here: AI Co‑Development Environment

Welcome to your AI co‑development environment. This workspace is a self‑referential learning system co‑developed by humans and AI. It includes a meta‑project (`projects/ai-env`), canonical libraries (prompts, scripts, workflows), and the Chirality meta‑learning framework and apps.

## What This Is

- Self‑referential system: The environment documents and evolves itself; documentation is a first‑class artifact.
- Split into child repos: Everything under `projects/` is its own Git repository with separate history/remotes.
- Mirrored knowledge areas: Prompts, scripts, and workflows exist both as standalone repos and as environment‑local mirrors in `projects/ai-env` for rapid iteration and knowledge transfer.

### Environment vs Project "ai-env"

- Root folder (`ai-env/`): The co‑development environment that hosts multiple projects.
- Project (`projects/ai-env/`): The environment’s own meta‑project where we:
  - Maintain mirrors of prompts, workflows, and scripts used across projects.
  - Define and evolve the shared documentation formats (templates) and conventions.
  - Capture dev history and structure that other projects can follow.
This makes `projects/ai-env/` both a consumer and producer of the environment’s methods.

## Core Components

- Chirality Semantic Framework (CF14) — theory + implementation
  - projects/chirality-semantic-framework/README.md
- Chirality AI (Orchestrator) — production composition, services, desktop
  - projects/chirality-ai/README.md
- Chirality AI App — Next.js app with two‑pass documents + RAG chat
  - projects/chirality-ai-app/README.md

## Correspondence Map

Lead consumer ↔ Canonical library pairs used for tight feedback loops:
- `projects/chirality-ai` ↔ `projects/scripts` — orchestration consumes and contributes scripts
- `projects/chirality-ai-app` ↔ `projects/prompts` — app consumes and contributes prompts
- `projects/chirality-semantic-framework` ↔ `projects/workflows` — framework informs and is informed by workflows
- `projects/chirality_-_ReasonFlux` ↔ `projects/vibe-project` — research ↔ applied validation loop

Mirror pointers for rapid iteration:
- Scripts mirror: `projects/ai-env/scripts/`
- Prompts mirror: `projects/ai-env/prompts/`
- Workflows mirror: `projects/ai-env/workflows/`

## Mirrors and Canonical Libraries

- Canonical libraries (reusable across projects)
  - projects/prompts/ — Prompt templates and patterns
  - projects/scripts/ — Helper scripts and utilities
  - projects/workflows/ — Playbooks and SOPs
- Environment‑local mirrors (iterate fast, then upstream)
  - projects/ai-env/prompts/
  - projects/ai-env/scripts/
  - projects/ai-env/workflows/

Recommended practice: Experiment and refine in the mirrors under `projects/ai-env/*`. Once stable, upstream improvements to the canonical repos in `projects/*`.

## Onboarding Flow

1) Orientation
- Read the root README.md for the high‑level model of the environment and its mirrors.
- Open projects/ai-env/devhistory/DIRECTORY_STRUCTURE.md for context on knowledge transfer and structure.

2) Understand the Framework
- Skim projects/chirality-semantic-framework/README.md
  - Focus on Overview, Quick Start, Project Structure, and Development sections.
  - Note optional Neo4j/GraphQL integration points if you plan on graph features.

3) Choose Your Path
- App path: projects/chirality-ai-app/README.md → Getting Started to run the Next.js app (two‑pass document generation + RAG chat).
- Orchestrator path: projects/chirality-ai/README.md → Quick Production Setup for service composition and desktop packaging.

4) Work With Mirrors
- Prompts: Draft or refine templates in projects/ai-env/prompts/, then propose stable versions to projects/prompts/.
- Workflows: Iterate environment‑specific SOPs in projects/ai-env/workflows/, then upstream to projects/workflows/.
- Scripts: Prototype task‑specific helpers in projects/ai-env/scripts/, then upstream to projects/scripts/ when reusable.

5) Capture Decisions
- Place ADRs, design notes, and guides in docs/ and in the respective project READMEs.
- Keep artifacts small and composable; link rather than duplicate when possible.

6) Quadrants Model
- Use the co‑development quadrants to frame work:
  - Normative (standards), Operative (execution), Evaluative (validation), Deliberative (improvement)
- Read: `docs/CO-DEV-QUADRANTS.md` for concrete mappings and examples.

## Navigation Shortcuts

- Framework overview: projects/chirality-semantic-framework/README.md
- Orchestrator: projects/chirality-ai/README.md
- App (Next.js): projects/chirality-ai-app/README.md
 - Environment structure: projects/ai-env/devhistory/DIRECTORY_STRUCTURE.md
 - Templates index: projects/ai-env/templates/README.md
 - README quadrants snippet: projects/ai-env/templates/README_QUADRANTS_SNIPPET.md
 - Example workflow: projects/workflows/example-workflow.md
 - Example prompt: projects/prompts/example-prompt.md
 - Agent guide: AGENTS.md
 - Mirror status helper: `make status/mirrors` (optionally `SINCE=origin/main`)

## Contribution Norms

- Per‑project Git: Branch, commit, and open PRs within each child repo.
- Documentation‑first: Update guides and READMEs alongside code changes.
- Safety: Avoid destructive automation by default; require explicit flags for write operations in scripts.

---
This document orients new contributors to the meta‑learning architecture and how to move between framework, apps, and mirrored libraries.
