$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$bootScript = Join-Path $repoRoot "tidal/BootTidal.hs"
$ambientScript = Join-Path $repoRoot "tidal/ambient.tidal"

if (-not (Get-Command ghci -ErrorAction SilentlyContinue)) {
    throw "ghci not found in PATH."
}

ghci -ignore-dot-ghci -ghci-script $bootScript -ghci-script $ambientScript
