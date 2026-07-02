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

## Build The Zip

Run this from the repository root:

```powershell
./scripts/build-fetch-zip.ps1
```

The script writes `dist/fetch-revit-2027-sample.zip`.

## Real Package Payloads

This sample keeps each package folder small by including only `pkg.json` and a note. For a real firm package source, copy the entire installed package folder from Dynamo, including required `bin`, `dyf`, `doc`, and `extra` folders.

