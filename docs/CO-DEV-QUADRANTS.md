# Co‑Development Quadrants

A shared mental model used across this environment and in every project. It explains how we define, execute, validate, and evolve work.

- Normative: Standards and reusable forms — canonical libraries and specifications.
- Operative: Execution in context — mirrors, apps, and day‑to‑day development.
- Evaluative: Measurement and verification — tests, status tools, benchmarks.
- Deliberative: Reflection and improvement — devhistory, ADRs, templates, research.

These map to recurring pairs in this workspace:
- Orchestration, interaction, methodology, research
- Infrastructure, interaction, method, validation

Practical anchors in this repository:
- Normative: `projects/prompts`, `projects/scripts`, `projects/workflows` (canonical libraries)
- Operative: `projects/ai-env/*` mirrors; `chirality-ai`, `chirality-ai-app` (consumers)
- Evaluative: `tests/`, status helpers (e.g., `mirror-status.sh`), validation scripts
- Deliberative: `projects/ai-env/devhistory`, templates, research projects (`chirality_-_ReasonFlux`, `vibe-project`)

Apply in your project:
- Define: Reference canonical templates (normative) and scope the task.
- Execute: Work in your project/mirror with minimal assumptions (operative).
- Validate: Add smoke tests and status checks; verify acceptance (evaluative).
- Iterate: Capture decisions, refine templates, propose upstream changes (deliberative).
