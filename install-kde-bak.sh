#!/usr/bin/env bash
set -euo pipefail

APP="kde-bak"
BIN_SRC="./kde-bak"
MAN_SRC="./kde-bak.1"

BIN_DST="/usr/local/bin/${APP}"
MAN_DST="/usr/local/share/man/man1/${APP}.1"

die() { echo "[x] $*" >&2; exit 1; }
info() { echo "[*] $*"; }
ok() { echo "[+] $*"; }

[[ -f "$BIN_SRC" ]] || die "Missing $BIN_SRC (run this from the directory containing kde-bak)"
[[ -f "$MAN_SRC" ]] || die "Missing $MAN_SRC (run this from the directory containing kde-bak.1)"

info "Installing binary to $BIN_DST"
sudo install -Dm755 "$BIN_SRC" "$BIN_DST"
ok "Installed: $BIN_DST"

info "Installing man page to $MAN_DST"
sudo install -Dm644 "$MAN_SRC" "$MAN_DST"
ok "Installed: $MAN_DST"

info "Updating man database (mandb)..."
if command -v mandb >/dev/null 2>&1; then
  sudo mandb >/dev/null 2>&1 || true
  ok "man database updated"
else
  info "mandb not found; skipping (man will still work on many systems)"
fi

ok "Done."
echo
echo "Try:"
echo "  $APP --help"
echo "  man $APP"

