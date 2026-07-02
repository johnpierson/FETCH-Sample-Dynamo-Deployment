$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $root "fetch-zip-source"
$distRoot = Join-Path $root "dist"
$zipPath = Join-Path $distRoot "fetch-revit-2027-sample.zip"

if (-not (Test-Path -LiteralPath (Join-Path $sourceRoot "2027/Packages"))) {
    throw "Missing required folder: fetch-zip-source/2027/Packages"
}

New-Item -ItemType Directory -Force -Path $distRoot | Out-Null
if (Test-Path -LiteralPath $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}

Compress-Archive -Path (Join-Path $sourceRoot "*") -DestinationPath $zipPath -Force
Write-Host "Created $zipPath"
