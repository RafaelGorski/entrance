param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$ProjectName
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$bootScript = Join-Path $repoRoot "tidal/BootTidal.hs"
$projectDir = Join-Path $repoRoot "projects/$ProjectName"

if (-not (Test-Path $projectDir)) {
    $available = (Get-ChildItem (Join-Path $repoRoot "projects") -Directory).Name -join ", "
    throw "Project '$ProjectName' not found. Available projects: $available"
}

$projectScript = Join-Path $projectDir "$ProjectName.tidal"

if (-not (Test-Path $projectScript)) {
    throw "Pattern file not found: $projectScript"
}

if (-not (Get-Command ghci -ErrorAction SilentlyContinue)) {
    throw "ghci not found in PATH."
}

ghci -ignore-dot-ghci -ghci-script $bootScript -ghci-script $projectScript
