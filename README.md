# AI Co‑Development Environment

This folder is your AI co‑development environment: a self‑referential learning system co‑developed by humans and AI. It’s more than a project directory—it's a workspace where processes, prompts, workflows, and code evolve together and document themselves.

## What This Is

- **Self‑Referential System**: Extensive documentation exists by design. The environment applies its own methods to improve itself (meta‑learning), capturing decisions and workflows as first‑class artifacts.
- **Split Into Child Repos**: Everything under `projects/` is a self‑contained Git repository with its own history and remote.
- **Mirrored Knowledge Areas**: Some concepts appear both as standalone projects and as subfolders within the `ai-env` project (e.g., `prompts/`, `scripts/`, `workflows/`). This mirror supports knowledge transfer between the environment and applications.

### Environment vs Project "ai-env"

- The root folder (`ai-env/`) is the co‑development environment itself: a home for many projects.
- The project `projects/ai-env/` is a meta‑project inside that environment. It:
  - Hosts environment‑local mirrors of prompts, scripts, and workflows used across projects.
  - Provides canonical templates and formats (self‑referential, iterative, interlinked) that all projects can adopt.
  - Serves as the reference implementation of the documentation system (guides, templates, dev history).
- Result: Each project developed here follows the same templates and patterns, while the `ai-env` project acts as the place to iterate on and improve those shared patterns.

## Layout

- `docs/`: Reference docs, decisions, notes for the environment
- `projects/`: Multiple self‑contained Git repositories (apps, frameworks, utilities)

Local environment artifacts like `bin/`, `lib/`, and `.venv/` may exist; they’re not core to the conceptual layout.

## Key Projects

- `chirality-semantic-framework`: Core meta‑learning framework (CF14). Start here to understand the theory and implementation of the semantic pipeline (matrices, resolvers, graph integration).
- `chirality-ai`: Production orchestrator that shows how framework components run together for a complete system (services, desktop packaging).
- `chirality-ai-app`: Next.js application that implements two‑pass document generation and RAG‑enhanced chat using the framework.
- `ai-env`: Meta‑project containing environment‑specific utilities, templates, and mirrors of prompts/scripts/workflows to enable self‑improvement cycles.
- `prompts`, `scripts`, `workflows`: Standalone repos that hold reusable libraries; mirrored patterns also exist within `projects/ai-env` for environment‑local evolution.
- `chirality_-_ReasonFlux`: Research suite for reasoning/post‑training (context for advanced model work).
- `vibe-project`: Case study on AI‑human collaboration and performance methodology.

Tip: To grasp the meta‑learning architecture, explore `projects/chirality-semantic-framework` first, then the orchestrator (`chirality-ai`) and app (`chirality-ai-app`). Review `projects/ai-env/devhistory/DIRECTORY_STRUCTURE.md` for how mirrors support knowledge transfer.

## Correspondence Map

Lead consumer ↔ canonical library pairs that create tight feedback loops:
- `chirality-ai` ↔ `scripts`: Orchestration and automation. The orchestrator consumes operational scripts (bootstrap, validation, packaging) and contributes improvements back; scripts stay battle‑tested under real deploy pressure.
- `chirality-ai-app` ↔ `prompts`: Interaction and prompting. The Next.js app proves prompt ergonomics in chat/RAG/document generation and upstreams composable templates; prompts shape runtime UX and flows.
- `chirality-semantic-framework` ↔ `workflows`: Methodology and SOPs. CF14 encodes the semantic method; workflows capture the human/AI operating procedure that mirrors those semantics (stations, matrices, validation).
- `chirality_-_ReasonFlux` ↔ `vibe-project`: Research and applied validation. ReasonFlux advances reasoning/post‑training; the vibe project validates AI‑human co‑dev through competitive performance and elegant solutions.

Mirror locations (rapid iteration → upstream):
- Scripts mirror: `projects/ai-env/scripts/` → canonical `projects/scripts/`
- Prompts mirror: `projects/ai-env/prompts/` → canonical `projects/prompts/`
- Workflows mirror: `projects/ai-env/workflows/` → canonical `projects/workflows/`

Rationale: Each library has a primary runtime that continuously validates it, creating self‑referential learning loops (mirror → canonical → consumer) while keeping libraries reusable and non‑stale.

## Quick Start (New Project)

```bash
mkdir -p projects/app1
cd projects/app1
git init
echo "# app1" > README.md
git add .
git commit -m "feat: initial project skeleton"
# git remote add origin <git@github.com:USER/REPO.git>
# git push -u origin main
```

## Working Model

- **Per‑Project Git**: Each folder in `projects/` is its own repo. Do normal branching and PRs per project.
- **Documentation‑First**: Capture decisions in `docs/` and project READMEs. Prefer small, composable guides and templates (see `projects/ai-env/templates/`).
- **Mirrors for Transfer**: Keep `prompts/`, `scripts/`, and `workflows/` both as reusable libraries and as environment mirrors inside `projects/ai-env` to support iteration and feedback loops.
 - **Agents**: See `AGENTS.md` for CLI agent expectations, safety, and the mirror → canonical → consumer workflow.

## Shortcuts

- Mirror status: `make status/mirrors` (optionally `SINCE=origin/main`) — quick summary of pending changes across `projects/ai-env/{prompts,workflows,scripts}`.

## Co‑Dev Quadrants

This environment operates through four complementary modes present in every project:
- Normative: canonical standards and reusable libraries
- Operative: local execution in mirrors and apps
- Evaluative: tests, status tools, and validation
- Deliberative: devhistory, ADRs, and templates

See `docs/CO-DEV-QUADRANTS.md` for mappings and practical anchors.

## Safety

No automation is enabled by default. Use standard Git practices (branches, PRs, code review) within each child repo.
