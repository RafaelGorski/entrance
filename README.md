# entrance
Entering to a music experience

## TidalCycles live-coding workspace

A multi-project TidalCycles workspace for ambient and electronic music explorations.

### Projects

| Project | Description |
|---------|-------------|
| `ambient` | Slow, reverb-heavy ambient texture |
| `minimal-techno` | Ambient minimal techno with four-on-the-floor kick and evolving pads |

### Requirements

- [SuperCollider](https://supercollider.github.io/) installed (tested with 3.12.1)
- [SuperDirt](https://github.com/musikinformatik/SuperDirt) quark installed in SuperCollider
- `ghci` installed and available in `PATH`
- [TidalCycles](https://tidalcycles.org/) Haskell package available to GHCi (tested with 1.10.1)

### Quick Start

```powershell
# 1. Start SuperDirt (audio engine) — wait ~15 seconds for samples to load
./scripts/start-superdirt.ps1

# 2. Run a project
./scripts/run-project.ps1 minimal-techno
./scripts/run-project.ps1 ambient

# Or use shortcut scripts
./scripts/run-minimal-techno.ps1
./scripts/run-ambient.ps1
```

### Starting a TidalCycles REPL

```powershell
# Start a bare TidalCycles REPL (interactive GHCi session with boot script loaded)
./scripts/start-tidal.ps1
```

### How It Works

1. **SuperDirt** runs inside SuperCollider as the audio engine, listening on `127.0.0.1:57120`
2. **GHCi** loads `tidal/BootTidal.hs` which initializes the TidalCycles stream, orbit helpers (`d1`–`d4`), and utility aliases (`hush`, `setcps`, `setbpm`)
3. A project's `.tidal` pattern file is evaluated in that GHCi session, sending patterns to SuperDirt for playback

### File Structure

```
tidal/
  BootTidal.hs          # TidalCycles boot script (stream setup, helpers)
  play-and-wait.hs      # Helper for non-interactive playback (30s duration)
supercollider/
  start-superdirt.scd    # SuperDirt boot script for SuperCollider
projects/
  ambient/ambient.tidal
  minimal-techno/minimal-techno.tidal
scripts/
  start-superdirt.ps1    # Launch SuperDirt audio engine
  start-tidal.ps1        # Start interactive TidalCycles REPL
  run-project.ps1        # Generic project launcher
  run-ambient.ps1        # Shortcut for ambient project
  run-minimal-techno.ps1 # Shortcut for minimal-techno project
```

### Troubleshooting

- **No sound?** Make sure SuperDirt is running first (`./scripts/start-superdirt.ps1`). Check that `scsynth` and `sclang` processes are active.
- **`Network.Socket.recvBuf` warning?** This means SuperDirt is not running or not reachable on port 57120.
- **Type errors in BootTidal.hs?** TidalCycles 1.10.x requires `tidal <- startTidal ...` (monadic bind), not `let tidal = startTidal ...`.
- **Parse errors on `$` or `#` in `.tidal` files?** GHCi requires multiline expressions to be wrapped in `:{` / `:}` blocks.
