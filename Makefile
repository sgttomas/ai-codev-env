.PHONY: status/mirrors

# Quick summary of mirror changes (prompts/workflows/scripts)
# Usage: make status/mirrors [SINCE=origin/main]
status/mirrors:
	@bash projects/ai-env/scripts/mirror-status.sh $(if $(SINCE),--since $(SINCE),)

.PHONY: status/drift

# Compare mirror vs canonical drift for prompts/workflows/scripts
# Usage: make status/drift MIRROR=projects/ai-env CANONICAL=projects
status/drift:
	@bash projects/ai-env/scripts/mirror-status.sh $(if $(MIRROR),--mirror-root $(MIRROR),) $(if $(CANONICAL),--drift-root $(CANONICAL),)

.PHONY: doc/health

# Run documentation health check for a project
# Usage: make doc/health PROJECT=projects/vibe-project [DOC_HEALTH_MAX_AGE_DAYS=60]
doc/health:
	@[ -n "$(PROJECT)" ] || (echo "Set PROJECT=<path> e.g. projects/vibe-project" && exit 2)
	@DOC_HEALTH_MAX_AGE_DAYS=$(DOC_HEALTH_MAX_AGE_DAYS) bash projects/ai-env/scripts/doc-health.sh $(PROJECT)

.PHONY: repos/cmd

# Run a command across child repos
# Usage: make repos/cmd CMD='git status -s' [INCLUDE='*'] [EXCLUDE='']
repos/cmd:
	@bash projects/ai-env/scripts/all-repos.sh $(if $(INCLUDE),--include '$(INCLUDE)',) $(if $(EXCLUDE),--exclude '$(EXCLUDE)',) -- bash -lc "$(CMD)"
