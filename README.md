# FETCH Sample Dynamo Deployment

This repository is a sample FETCH deployment source. The repository root is shaped like the folder or zip that FETCH expects.

## Folder Structure

```text
.
`-- 2027/
    |-- Packages/
    |   |-- Clockwork for Dynamo 3.x/
    |   |-- Dynamo Text/
    |   |-- Monocle/
    |   |-- Rhythm/
    |   `-- spring nodes/
    `-- Dynamo Graphs/
        |-- Model Health Audit/
        |-- Sheet Setup/
        `-- Package Smoke Test/
```

FETCH supports version folder names such as `2027`, `Revit 2027`, or `R27`. This sample uses `2027` for a Revit 2027/Dynamo 4.1 deployment.

## What FETCH Syncs

- `2027/Packages` copies to the active Dynamo package folder for Revit 2027.
- `2027/Dynamo Graphs` copies to `Documents\FETCH Dynamo Graphs\2027`, unless FETCH is configured with a custom graph root.
- Package folders should match the installed Dynamo package folder names.

## GitHub Release URL For FETCH

FETCH can use a GitHub release page URL or a direct zip asset URL.

Latest release page:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/latest
```

Pinned release page:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/tag/v2027.0.1
```

Direct zip asset:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/download/v2027.0.1/fetch-sample-dynamo-deployment.zip
```

## Creating Releases

Push a `v*` tag and GitHub Actions will validate the folder structure, zip the `2027` folder, and attach the zip to the release.

```powershell
git tag v2027.0.1
git push origin v2027.0.1
```

The zip asset starts with `2027/...` at the archive root, which is the structure FETCH consumes.

## Real Package Payloads

This sample keeps each package folder small by including only `pkg.json` and a note. For a real firm deployment source, copy the entire installed package folder from Dynamo, including required `bin`, `dyf`, `doc`, and `extra` folders.
