$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$environmentPath = Join-Path $root "environments/revit-2027-dynamo-4.1/package-lock.json"
$packageLock = Get-Content -LiteralPath $environmentPath -Raw | ConvertFrom-Json
$packageSlugs = @($packageLock | ForEach-Object { $_.slug })

foreach ($package in $packageLock) {
    $manifestPath = Join-Path $root $package.packagePath
    if (-not (Test-Path -LiteralPath $manifestPath)) {
        throw "Missing package manifest: $($package.packagePath)"
    }

    $manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
    if ($manifest.version -ne $package.version) {
        throw "Version mismatch for $($package.slug): lock has $($package.version), pkg.json has $($manifest.version)"
    }
}

$graphManifests = Get-ChildItem -LiteralPath (Join-Path $root "graphs") -Filter graph.json -Recurse -File
foreach ($graphManifest in $graphManifests) {
    $graph = Get-Content -LiteralPath $graphManifest.FullName -Raw | ConvertFrom-Json
    $graphPath = Join-Path $graphManifest.DirectoryName $graph.dynamoFile
    if (-not (Test-Path -LiteralPath $graphPath)) {
        throw "Missing Dynamo graph for manifest: $($graphManifest.FullName)"
    }

    foreach ($packageSlug in @($graph.packages)) {
        if ($packageSlugs -notcontains $packageSlug) {
            throw "Graph $($graph.name) references unpinned package slug: $packageSlug"
        }
    }
}

Write-Host "Manifest validation passed: $($packageLock.Count) packages, $($graphManifests.Count) graphs."
