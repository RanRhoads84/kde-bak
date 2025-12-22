# AGENTS.md

This repository ships a single Bash CLI utility that backs up and restores KDE Plasma settings. The core logic lives in `kde-bak`, with supporting docs and packaging metadata in the repo root.

## Repository map
- `kde-bak`: main entrypoint (backup, restore, list, verify).
- `kde-bak.1`: man page, must stay in sync with CLI behavior and flags.
- `README.md`: user-facing documentation and examples.
- `install-kde-bak.sh`: local installer for `/usr/local`.
- `kde-bak.desktop`: desktop entry.
- Packaging: `debian/`, `kde-bak.spec`, `PKGBUILD`.
- Packaging notes: `BUILD-README.md`, `DEBIAN-BUILD.md`.

## Development notes
- Use the `run` helper in `kde-bak` for any external command so `--dry-run` and logging stay consistent.
- Avoid adding commands that write outside `$HOME` unless the feature requires it and docs are updated.
- This tool affects live KDE config; prefer `--dry-run` for testing.

## Workflow expectations
- Before starting work, switch to `development` with `git switch development` (or `git checkout development`).
- If the branch is missing or switching would disturb unknown changes, stop and ask the user.
- Keep `AGENT_LOG.md` up to date with a dated entry of work tried/completed, files touched, and tests run.
- Append-only: never rewrite or remove prior entries in `AGENT_LOG.md`; always add new entries under the latest date.
- Make git commits for completed, coherent changes; keep scopes tight and messages clear.
- If you identify follow-ups or out-of-scope work, create an issue in the repo's tracker; if no tracker is available, add a note to `ISSUES.md`.
- Use `ISSUES.md` as the default local tracker when no external issue system is available.
- Repos may have multiple git remotes; always pull from and push to all configured remotes.

## Runtime dependencies
- Required: `bash`, `rsync`, `tar`.
- Optional (used when available): `kquitapp6` or `kquitapp5`, `plasmashell`, `kde-config`.

## Validation
- `bash -n kde-bak`
- `bash -n install-kde-bak.sh`
- `./kde-bak --help`
- `./kde-bak backup --dry-run`

## Versioning and docs sync
- If `VERSION` changes in `kde-bak`, update `kde-bak.1`, `kde-bak.spec`, `PKGBUILD`, and `debian/changelog` if used.
- New or changed flags must be reflected in `print_help`, `README.md`, and `kde-bak.1`.
- New dependencies must be added to packaging files.

## Release checklist
- Bump `VERSION` in `kde-bak`.
- Update version references in `kde-bak.1`, `kde-bak.spec`, and `PKGBUILD`.
- Update `debian/changelog` if packaging for Debian/Ubuntu.
- Re-verify `--help` and `--dry-run` output still matches `README.md` and `kde-bak.1`.
