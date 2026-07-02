# FETCH Sample Dynamo Deployment

This repository shows the folder structure a firm can zip and give to FETCH for Revit 2027 package and graph syncing.

The important folder is `fetch-zip-source`. Zip the contents of that folder, or use the included build script, and point FETCH at the resulting `.zip` file, GitHub release asset, or local folder.

## Zip Root

```text
fetch-zip-source/
`-- 2027/
    |-- Packages/
    |   |-- Clockwork for Dynamo 3.x/
    |   |   `-- pkg.json
    |   |-- Dynamo Text/
    |   |   `-- pkg.json
    |   |-- Monocle/
    |   |   `-- pkg.json
    |   |-- Rhythm/
    |   |   `-- pkg.json
    |   `-- spring nodes/
    |       `-- pkg.json
    `-- Dynamo Graphs/
        |-- Model Health Audit/
        |   `-- Model Health Audit.dyn
        |-- Sheet Setup/
        |   `-- Sheet Setup.dyn
        `-- Package Smoke Test/
            `-- Package Smoke Test.dyn
```

FETCH also supports sibling version folders such as `2025`, `2026`, `Revit 2027`, or `R27`. This sample focuses on `2027` because the package examples represent a Revit 2027/Dynamo 4.1 setup.

## What FETCH Does

- Copies `2027/Packages` into the active Dynamo package folder for Revit 2027.
- Copies `2027/Dynamo Graphs` into `Documents\FETCH Dynamo Graphs\2027`, unless FETCH is configured with a custom graph root.
- Accepts folder aliases: `Packages` or `Package`, and `Dynamo Graphs`, `DynamoGraphs`, or `Graphs`.


## GitHub Release URL For FETCH

FETCH can use either the release page URL or the direct zip asset URL.

Use the latest release page when you want FETCH to select the first `.zip` asset attached to the release:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/latest
```

Use a pinned release URL when you want every workstation to stay on a specific deployment bundle:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/tag/v2027.0.0
```

Use the direct asset URL when you want to point FETCH straight at the zip:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/download/v2027.0.0/fetch-revit-2027-sample.zip
```

Create a new release by pushing a `v*` tag, for example:

```powershell
git tag v2027.0.1
git push origin v2027.0.1
```

## Build The Zip

Run this from the repository root:

```powershell
./scripts/build-fetch-zip.ps1
```

The script writes `dist/fetch-revit-2027-sample.zip`.

## Real Package Payloads

This sample keeps each package folder small by including only `pkg.json` and a note. For a real firm package source, copy the entire installed package folder from Dynamo, including required `bin`, `dyf`, `doc`, and `extra` folders.


