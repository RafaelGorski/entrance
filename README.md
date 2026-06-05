# entrance
Entering to a music experience

## TidalCycles ambient boilerplate

This repository now includes a minimal TidalCycles setup for starting an ambient pattern locally.

### Project files

- `/tmp/workspace/RafaelGorski/entrance/tidal/BootTidal.hs` - GHCi boot script for TidalCycles and SuperDirt
- `/tmp/workspace/RafaelGorski/entrance/tidal/ambient.tidal` - starter ambient pattern
- `/tmp/workspace/RafaelGorski/entrance/scripts/start-tidal.ps1` - starts a local TidalCycles session
- `/tmp/workspace/RafaelGorski/entrance/scripts/run-ambient.ps1` - starts TidalCycles and loads the ambient pattern

### Requirements

- `ghci` installed and available in `PATH`
- TidalCycles package available to GHCi
- SuperDirt listening on `127.0.0.1:57120`

### Run from PowerShell

```powershell
# Start TidalCycles session
./scripts/start-tidal.ps1

# Start and auto-load the ambient pattern
./scripts/run-ambient.ps1
```
