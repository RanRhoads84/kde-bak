#!/usr/bin/env bash
set -euo pipefail

die() {
  echo "[x] $*" >&2
  exit 1
}

git rev-parse --git-dir >/dev/null 2>&1 || die "Not a git repository"

echo "[*] Staging initial files..."
git add .

echo "[*] Creating structured commit history..."

git commit -m "init: create kde-bak project scaffold"

git add kde-bak
git commit -m "feat: add core KDE Plasma backup and restore functionality"

git add kde-bak
git commit -m "feat: add safety snapshot, dry-run mode, and archive verification"

git add kde-bak
git commit -m "feat: add full CLI argument parsing and help output"

git add kde-bak
git commit -m "feat: add automatic logging with configurable log output"

git add kde-bak
git commit -m "feat: allow excluding KScreen monitor configuration from backups"

git add kde-bak.1
git commit -m "docs: add man page for kde-bak"

git add kde-bak.desktop
git commit -m "feat: add KDE desktop entry for kde-bak"

git add install-kde-bak.sh
git commit -m "feat: add installer script for kde-bak"

git add debian/
git commit -m "packaging: add Debian and Ubuntu packaging files"

git add kde-bak.spec
git commit -m "packaging: add RPM spec for Fedora, RHEL, and openSUSE"

git add PKGBUILD
git commit -m "packaging: add Arch Linux PKGBUILD"

git add README.md BUILD-README.md DEBIAN-BUILD.md
git commit -m "docs: add project documentation"

git add LICENSE
git commit -m "license: add GPL v2 license"

git add -A
git commit -m "release: prepare kde-bak 1.0.0 for distribution"

echo
echo "[+] Commit history created successfully."
echo "    Tag it with:"
echo "    git tag -a v1.0.0 -m \"kde-bak 1.0.0 initial release\""

