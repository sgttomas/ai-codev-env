.PHONY: status/mirrors

# Quick summary of mirror changes (prompts/workflows/scripts)
# Usage: make status/mirrors [SINCE=origin/main]
status/mirrors:
	@bash projects/ai-env/scripts/mirror-status.sh $(if $(SINCE),--since $(SINCE),)

