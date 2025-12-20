Alright. New README, clean slate, **GPL v2**, no ambiguity, no leftovers from the previous one.
And noted for the future: **GPL v2 is now the default license unless you explicitly say otherwise**. I won’t “helpfully” swap it out later.

Below is a **complete replacement `README.md`**. Drop it in as-is.

---

````markdown
# kde-bak

`kde-bak` is a command-line utility for backing up and restoring **KDE Plasma desktop settings and layouts**.

It exists because KDE Plasma is powerful, configurable, and occasionally decides to rearrange carefully tuned panels, widgets, shortcuts, and monitor layouts without asking.

This tool provides a documented, repeatable way to save and reapply your KDE environment.

---

## What it does

`kde-bak` backs up and restores:

- Plasma panel, widget, and desktop layouts
- KDE configuration files
- KDE local state
- Global shortcuts, activities, and window manager settings
- Optional monitor layout configuration (KScreen)

It restores these safely, with verification, logging, and rollback protection.

---

## Features

- Backup and restore KDE Plasma layouts
- Optional exclusion of monitor layouts (`--no-kscreen`)
- Safety snapshot before restore (enabled by default)
- Dry-run mode for backups and restores
- Archive integrity verification
- Automatic logging
- Proper `--help` output
- Full manual page (`man kde-bak`)
- Sensible exit codes
- Packaged for major Linux distributions

This behaves like a real Unix utility, not an undocumented script.

---

## Project files

| File | Purpose |
|-----|--------|
| `kde-bak` | Main application |
| `kde-bak.1` | Manual page |
| `kde-bak.desktop` | KDE desktop launcher |
| `install-kde-bak.sh` | Installer script |
| `README.md` | Project documentation |
| `LICENSE` | GPL v2 license |

---

## Installation

### Using the installer script

From the project directory:

```bash
chmod +x kde-bak install-kde-bak.sh
./install-kde-bak.sh
````

This installs:

* Binary → `/usr/local/bin/kde-bak`
* Man page → `/usr/local/share/man/man1/kde-bak.1`
* Desktop entry → `/usr/share/applications/kde-bak.desktop`

Verify:

```bash
kde-bak --help
man kde-bak
```

---

## Usage

### Create a backup

```bash
kde-bak backup
```

Backups are stored by default in:

```
~/.local/state/kde-bak/
```

Each run creates:

* a timestamped directory
* a compressed `.tar.gz` archive

---

### Backup to a custom destination

```bash
kde-bak backup --dest /mnt/backup/kde
```

---

### Backup without monitor layouts

If you do not want KScreen monitor configuration included:

```bash
kde-bak backup --no-kscreen
```

---

### List available backups

```bash
kde-bak list
```

Or with a custom destination:

```bash
kde-bak list --dest /mnt/backup/kde
```

---

### Verify a backup archive

```bash
kde-bak verify --archive kde-bak-2025-12-20_14-03-11.tar.gz
```

This checks archive integrity without restoring anything.

---

### Restore from a backup

```bash
kde-bak restore --archive kde-bak-2025-12-20_14-03-11.tar.gz
```

Restore process:

1. Archive integrity is verified
2. A safety snapshot is created automatically
3. Files are merged back into your home directory
4. `plasmashell` is restarted

If Plasma does not fully recover, log out and back in.

---

### Restore options

Disable the pre-restore safety snapshot:

```bash
kde-bak restore --archive FILE.tar.gz --no-snapshot
```

Skip restarting Plasma:

```bash
kde-bak restore --archive FILE.tar.gz --no-restart
```

---

### Dry run

Show what would happen without making changes:

```bash
kde-bak backup --dry-run
kde-bak restore --archive FILE.tar.gz --dry-run
```

---

## Logging

Logs are written automatically to:

```
~/.local/state/kde-bak/logs/
```

Specify a custom log file if desired:

```bash
kde-bak backup --log /tmp/kde-bak.log
```

---

## Exit codes

| Code | Meaning            |
| ---- | ------------------ |
| `0`  | Success            |
| `2`  | Usage error        |
| `3`  | I/O error          |
| `4`  | Missing dependency |
| `5`  | Archive error      |
| `6`  | Restore error      |

---

## Authors

This project was co-authored by:

* **ChatGPT (OpenAI)** — design, implementation, documentation, and packaging
* **Allen Welden** — project direction, requirements, review, and integration

---

## License

This project is licensed under the **GNU General Public License v2**.

You are free to use, modify, and distribute this software under the terms of
GPL v2. Any derivative works must remain open source and distributed under
the same license.

See the `LICENSE` file for full details.

---

## Why this exists

Because:

* Desktop environments take time to configure
* KDE Plasma configuration is powerful but fragile
* Backups matter most after something breaks
* Tools should explain themselves
* Reading source code is not documentation

```

---

### One last thing (important)

You should also replace your `LICENSE` file with the **full GPL v2 text**.  
If you want, I can generate the **exact `LICENSE` file** next so you don’t accidentally ship a stub or the wrong variant.

And yes, I will default to **GPL v2** from now on unless you tell me otherwise.
```

