# AGENT_LOG.md

Log of agent work in this repo. Append new entries; do not rewrite history.

## 2025-12-22
- Task: add workflow expectations for branch switching, logging, and commits; expand skill guidance.
- Files: `AGENTS.md`, `AGENT_SKILL.md`, `AGENT_LOG.md`.
- Tests: not run (docs-only change).
- Task: add local issue tracker template.
- Files: `ISSUES.md`, `AGENT_LOG.md`.
- Tests: not run (docs-only change).
- Task: point workflow expectations at `ISSUES.md`.
- Files: `AGENTS.md`, `AGENT_LOG.md`.
- Tests: not run (docs-only change).
- Task: add multi-remote pull/push guidance.
- Files: `AGENTS.md`, `AGENT_SKILL.md`, `AGENT_LOG.md`.
- Tests: not run (docs-only change).
- Task: run validation checks after doc updates.
- Files: `AGENT_LOG.md`.
- Tests: `bash -n kde-bak`, `bash -n install-kde-bak.sh`, `./kde-bak --help`, `XDG_STATE_HOME=$PWD/.state ./kde-bak backup --dry-run`.
- Task: normalize `.gitignore` and add `*.log` ignores.
- Files: `.gitignore`, `AGENT_LOG.md`.
- Tests: not run (gitignore-only change).
- Task: ignore local `.state/` artifacts.
- Files: `.gitignore`, `AGENT_LOG.md`.
- Tests: not run (gitignore-only change).
- Task: add issue for missing asset backups (wallpapers/icons/themes).
- Files: `ISSUES.md`, `AGENT_LOG.md`.
- Tests: not run (issue-only change).

- Task: implement asset backups for wallpapers/icons/themes so restores include user assets.
- Files: `kde-bak`, `ISSUES.md`, `AGENT_LOG.md`.
- Tests: run `XDG_STATE_HOME=$PWD/.state ./kde-bak backup --dry-run` to validate behavior.

- Result: dry-run executed; rsync was invoked for the following asset dirs: `.local/share/wallpapers`, `.local/share/icons`, `.local/share/plasma`.
- Archive (dry-run): `.state/kde-bak/kde-bak-$(timestamp).tar.gz` would be created under the destination.

- Time: 18:33:28 -0500
- Task: change default backup/log destination to `$HOME/bak` when `XDG_STATE_HOME` is unset.
- Files: `kde-bak`, `AGENT_LOG.md`.
- Tests: not run (user-directed change).

- Time: 21:19:25 -0500
- Task: locate backup destination defaults in `kde-bak`.
- Files: `kde-bak`, `AGENT_LOG.md`.
- Tests: not run (info-only request).
