Here’s a file you can drop into the repo, aimed at agents (or humans pretending to be agents) to **run tests consistently** without “it works on my machine” performance art.

Save as: **`AGENTS-TESTING.md`**

````markdown
# Agent Instructions: Running Tests for `kde-bak`

This document tells agents how to run the test suite for this codebase in a repeatable way.

`kde-bak` is a shell-based CLI utility. “Tests” here means:
- static checks (lint/format)
- smoke tests (CLI runs, archive created, archive verifies)
- safe restore simulation (dry-run)

No GUI required. No KDE session required for most checks.

---

## 1) Preconditions

### Required tools
- `bash`
- `tar`
- `rsync`
- `git`

### Optional but recommended tools
- `shellcheck` (lint)
- `shfmt` (format)
- `man-db` (manpage indexing; optional)

### Verify repo state
Run these from the repo root:

```bash
pwd
ls -la
git status
````

Agents should not run tests on a dirty tree unless explicitly instructed. If the tree is dirty, record what changed and why.

---

## 2) Install Dependencies

### Debian/Ubuntu

```bash
sudo apt update
sudo apt install -y bash tar rsync shellcheck man-db
```

`shfmt` is typically installed via Go:

```bash
go install mvdan.cc/sh/v3/cmd/shfmt@latest
export PATH="$HOME/go/bin:$PATH"
```

### Fedora/RHEL

```bash
sudo dnf install -y bash tar rsync ShellCheck man-db
```

`shfmt`:

```bash
sudo dnf install -y golang
go install mvdan.cc/sh/v3/cmd/shfmt@latest
export PATH="$HOME/go/bin:$PATH"
```

### openSUSE

```bash
sudo zypper install -y bash tar rsync ShellCheck man-db
```

### Arch

```bash
sudo pacman -S --needed bash tar rsync shellcheck man-db
```

---

## 3) Ensure Executables are Executable

From repo root:

```bash
chmod +x kde-bak install-kde-bak.sh commit-all.sh || true
```

If `kde-bak` does not exist and you see `kde-bak.sh` instead, rename:

```bash
mv kde-bak.sh kde-bak
chmod +x kde-bak
```

Agents should note this rename as a required fix if encountered.

---

## 4) Run the Standard Test Suite

### Preferred: run the repo test script

If the repository contains `scripts/test.sh`, run:

```bash
bash -lc './scripts/test.sh'
```

Agents should capture and report:

* exit code
* full output (or attach as log artifact)
* environment (distro, shell, versions)

### If `scripts/test.sh` does not exist, run the “manual test plan”

Use this exact sequence.

#### A) Lint (optional but recommended)

```bash
command -v shellcheck >/dev/null 2>&1 && shellcheck -x kde-bak install-kde-bak.sh commit-all.sh || true
```

#### B) Formatting check (optional)

```bash
command -v shfmt >/dev/null 2>&1 && shfmt -d kde-bak install-kde-bak.sh commit-all.sh || true
```

#### C) CLI smoke tests

```bash
./kde-bak --help >/dev/null
./kde-bak --version
./kde-bak backup --dry-run >/dev/null
```

#### D) Functional test (backup + verify)

Create a temporary destination and run a real backup:

```bash
tmp="$(mktemp -d)"
./kde-bak backup --dest "$tmp"
ls -la "$tmp"
```

Verify the newest archive exists and passes `verify`:

```bash
latest="$(ls -1t "$tmp"/kde-bak-*.tar.gz | head -n 1)"
./kde-bak verify --archive "$latest"
```

#### E) Restore test (safe, dry-run)

```bash
./kde-bak restore --archive "$latest" --dry-run
```

Agents must NOT run a real restore on the host machine unless explicitly instructed,
because it can modify user KDE config.

---

## 5) Installer Test (Optional)

This tests whether packaging-style installation works.

**Note:** This uses `sudo` and writes to `/usr/local`. Only run if allowed.

```bash
./install-kde-bak.sh
kde-bak --help
man kde-bak || true
```

If `man` does not find the page, record:

* whether `man-db` / `mandb` exists
* whether the file is installed to `/usr/local/share/man/man1/kde-bak.1`

---

## 6) Expected Results

A successful test run should confirm:

* `kde-bak --help` exits 0
* a backup archive `kde-bak-*.tar.gz` is created in the destination
* `kde-bak verify --archive FILE` exits 0
* `kde-bak restore --dry-run` exits 0

Optional tools:

* `shellcheck` reports no critical errors
* `shfmt -d` reports no diffs

---

## 7) Failure Handling

If any step fails:

1. Record the exact command run.
2. Record stdout/stderr.
3. Record exit code:

   ```bash
   echo $?
   ```
4. Identify whether failure is:

   * dependency missing (install required tool)
   * permissions issue
   * path mismatch (wrong filename)
   * missing expected files

Agents should propose the smallest fix, then re-run only the necessary tests.

---

## 8) Reporting Template

Agents should report results using this template:

* OS/Distro:
* Shell:
* `kde-bak` version output:
* Tests executed:
* Pass/Fail summary:
* Logs/output:
* Fixes applied (if any):
* Remaining issues (if any):

```

This file should keep your agents from doing the usual “I ran something, somewhere, at some time” routine.
```

