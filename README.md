# FETCH Sample Dynamo Deployment

This repository is a sample FETCH deployment source. The repository root is shaped like the folder or zip that FETCH expects.

## Folder Structure

```text
.
|-- 2025/
|   |-- Packages/
|   `-- Dynamo Graphs/
|-- 2026/
|   |-- Packages/
|   `-- Dynamo Graphs/
`-- 2027/
    |-- Packages/
    `-- Dynamo Graphs/
```

FETCH supports version folder names such as `2025`, `2026`, `2027`, `Revit 2027`, or `R27`. This sample duplicates the same package and graph layout into `2025`, `2026`, and `2027` to show a multi-version deployment zip.

## What FETCH Syncs

- The folder matching the active Revit version is selected.
- `<version>/Packages` copies to the active Dynamo package folder for that Revit version.
- `<version>/Dynamo Graphs` copies to `Documents\FETCH Dynamo Graphs\<version>`, unless FETCH is configured with a custom graph root.
- Package folders should match the installed Dynamo package folder names.

## GitHub Release URL For FETCH

FETCH can use a GitHub release page URL or a direct zip asset URL.

Latest release page:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/latest
```

Pinned release page:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/tag/v2027.0.2
```

Direct zip asset:

```text
https://github.com/johnpierson/FETCH-Sample-Dynamo-Deployment/releases/download/v2027.0.2/fetch-sample-dynamo-deployment.zip
```

## Creating Releases

Push a `v*` tag and GitHub Actions will validate the folder structure, zip the version folders, and attach the zip to the release.

```powershell
git tag v2027.0.2
git push origin v2027.0.2
```

The zip asset starts with `2025/`, `2026/`, and `2027/` at the archive root, which is the structure FETCH consumes.

## Real Package Payloads

This sample keeps each package folder small by including only `pkg.json` and a note. For a real firm deployment source, copy the entire installed package folder from Dynamo, including required `bin`, `dyf`, `doc`, and `extra` folders.
