# MCP_Instructions.md

This project is self-contained and does not require MCP servers to build or run. If MCP tools are available, use them sparingly and only for local inspection or verification.

## Preferred MCP usage
- Filesystem: read and update repo files, especially `kde-bak`, `README.md`, and `kde-bak.1`.
- Shell: run local checks such as `bash -n kde-bak` and `./kde-bak --help`.
- Git (if available): inspect status/diffs to confirm changes.

## Safe examples
- `bash -n kde-bak` (lint the script)
- `./kde-bak --help` (verify help text)
- `./kde-bak backup --dry-run` (exercise the flow without touching user config)
- `rg --no-ignore-vcs -n "kde-bak"` (search within repo)

## Avoid
- Networked MCP servers unless the user explicitly asks for external lookups.
- Running real backups or restores; use `--dry-run` for safety.
- Accessing user home configuration outside the repo unless asked.
