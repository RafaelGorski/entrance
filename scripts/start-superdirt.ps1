$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$scdScript = Join-Path $repoRoot "supercollider/start-superdirt.scd"
$sclang = "C:\Program Files\SuperCollider-3.12.1\sclang.exe"

if (-not (Test-Path $sclang)) {
    throw "sclang not found at $sclang. Please update the path to your SuperCollider installation."
}

# Check if sclang is already running
$existing = Get-Process -Name "sclang" -ErrorAction SilentlyContinue
if ($existing) {
    Write-Host "SuperCollider (sclang) is already running (PID: $($existing.Id))."
    exit 0
}

Write-Host "Starting SuperDirt via sclang..."
Write-Host "Audio will be ready in ~15 seconds while samples load."
Start-Process -FilePath $sclang -ArgumentList $scdScript -NoNewWindow
Start-Sleep -Seconds 2

$proc = Get-Process -Name "sclang" -ErrorAction SilentlyContinue
if ($proc) {
    Write-Host "sclang started (PID: $($proc.Id)). Wait for 'SuperDirt started' before running a project."
} else {
    throw "Failed to start sclang."
}
