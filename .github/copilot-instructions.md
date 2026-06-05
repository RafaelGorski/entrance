# Copilot Instructions

## Architecture

This is a TidalCycles live-coding workspace with multiple music projects. The workflow is:

1. **SuperDirt** must be running in SuperCollider on `127.0.0.1:57120` — start it with `./scripts/start-superdirt.ps1`
2. **GHCi** loads `tidal/BootTidal.hs` to initialize the TidalCycles stream (connections, helper functions like `d1`–`d4`, `hush`, `setcps`, `setbpm`)
3. A project's `.tidal` pattern file is evaluated in that GHCi session

## Running

```powershell
# Start SuperDirt audio engine (must run first, wait ~15s for samples)
./scripts/start-superdirt.ps1

# Start an interactive TidalCycles REPL
./scripts/start-tidal.ps1

# Run any project by name
./scripts/run-project.ps1 <project-name>

# Shortcut scripts for specific projects
./scripts/run-ambient.ps1
./scripts/run-minimal-techno.ps1
```

All scripts require `ghci` in PATH with the TidalCycles package installed. SuperCollider 3.12.1 with SuperDirt must be installed for audio output.

## Conventions

- **Boot script** (`tidal/BootTidal.hs`): Defines the TidalCycles runtime — stream targets, orbit helpers (`d1`–`d4`), and utility aliases. Uses `tidal <- startTidal ...` (monadic bind) for TidalCycles 1.10.x. Changes here affect every session.
- **SuperDirt script** (`supercollider/start-superdirt.scd`): Boots the SuperCollider audio engine with SuperDirt on port 57120. Configures server memory, buffers, and loads all sample banks.
- **Projects** (`projects/<name>/<name>.tidal`): Each project lives in its own folder under `projects/`. The main pattern file must match the folder name (e.g., `projects/ambient/ambient.tidal`). Multiline expressions must be wrapped in `:{` / `:}` blocks for GHCi compatibility.
- **Scripts** (`scripts/*.ps1`): PowerShell launchers. `start-superdirt.ps1` launches the audio engine. `run-project.ps1` is the generic project launcher; per-project shortcuts (e.g., `run-ambient.ps1`) are optional conveniences. Scripts use `$PSScriptRoot` to resolve paths relative to the repo root.
- **Play helper** (`tidal/play-and-wait.hs`): GHCi script that keeps the session alive for 30 seconds then calls `hush`. Useful for non-interactive/automated playback.
