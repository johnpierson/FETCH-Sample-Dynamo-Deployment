$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$zipRoot = Join-Path $root "fetch-zip-source"
$versionRoot = Join-Path $zipRoot "2027"
$packagesRoot = Join-Path $versionRoot "Packages"
$graphsRoot = Join-Path $versionRoot "Dynamo Graphs"

foreach ($requiredPath in @($versionRoot, $packagesRoot, $graphsRoot)) {
    if (-not (Test-Path -LiteralPath $requiredPath)) {
        throw "Missing required FETCH sample folder: $requiredPath"
    }
}

$packageFolders = Get-ChildItem -LiteralPath $packagesRoot -Directory
if ($packageFolders.Count -eq 0) {
    throw "No package folders found under fetch-zip-source/2027/Packages"
}

foreach ($packageFolder in $packageFolders) {
    $manifestPath = Join-Path $packageFolder.FullName "pkg.json"
    if (-not (Test-Path -LiteralPath $manifestPath)) {
        throw "Package folder is missing pkg.json: $($packageFolder.Name)"
    }

    $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    if ([string]::IsNullOrWhiteSpace($manifest.name) -or [string]::IsNullOrWhiteSpace($manifest.version)) {
        throw "Package manifest must include name and version: $manifestPath"
    }
}

$graphFiles = Get-ChildItem -LiteralPath $graphsRoot -Filter *.dyn -Recurse -File
if ($graphFiles.Count -eq 0) {
    throw "No Dynamo graphs found under fetch-zip-source/2027/Dynamo Graphs"
}

Write-Host "FETCH zip structure validation passed: $($packageFolders.Count) packages, $($graphFiles.Count) graphs."
