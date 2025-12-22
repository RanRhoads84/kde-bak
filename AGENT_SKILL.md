# AGENT_SKILL.md

Skill: kde-bak maintainer

Purpose: safely extend or fix the Bash CLI while keeping user-facing docs, man page, and packaging metadata aligned.

## Start here
- Switch to `development` before making changes: `git switch development` (or `git checkout development`).
- If the branch is missing or switching risks unknown changes, stop and ask the user.
- If multiple git remotes are configured, pull from and push to all of them.

## Core workflow
1. Read `kde-bak` and confirm existing behavior.
2. Update CLI entrypoints (`print_help`, `parse_args`, and related functions) for any new flags or behavior.
3. Keep `--dry-run` safe by routing external commands through `run`.
4. Update docs (`README.md`, `kde-bak.1`) to match behavior changes.
5. If you add a dependency, update `debian/control`, `kde-bak.spec`, and `PKGBUILD`.
6. Append a brief entry to `AGENT_LOG.md` (date, task, files, tests). Do not rewrite or delete prior entries.
7. Commit completed work with a clear message; open an issue for follow-ups if needed.

## Validation
- `bash -n kde-bak`
- `./kde-bak --help`
- Prefer `./kde-bak backup --dry-run` for runtime checks.

## Avoid
- Running real restores in automation.
- Adding `sudo` or root-only behavior to `kde-bak`.
- Changing default paths without updating docs and man page.

## Done check
- Code, docs, and packaging metadata are consistent.
- Version fields are aligned if a release bump was required.
