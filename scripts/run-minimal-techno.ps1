$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$bootScript = Join-Path $repoRoot "tidal/BootTidal.hs"
$projectScript = Join-Path $repoRoot "projects/minimal-techno/minimal-techno.tidal"

if (-not (Get-Command ghci -ErrorAction SilentlyContinue)) {
    throw "ghci not found in PATH."
}

ghci -ignore-dot-ghci -ghci-script $bootScript -ghci-script $projectScript
