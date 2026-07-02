# Dynamo Revit 2027 Package and Graph Management Sample

This sample repository demonstrates a Git-friendly folder structure for managing Dynamo packages and Dynamo graphs for a Revit 2027 / Dynamo Core 4.1 environment.

The package examples are based on a local Dynamo package cache from:

`%APPDATA%\Dynamo\Dynamo Core\4.1\packages`

This repository intentionally stores package manifests and dependency records instead of vendoring every package binary. The goal is to make package versioning, graph ownership, review, and environment promotion easy to understand in Git.

## Repository layout

```text
.
|-- environments/
|   `-- revit-2027-dynamo-4.1/
|       |-- package-lock.json
|       `-- README.md
|-- packages/
|   `-- revit-2027/
|       |-- clockwork-for-dynamo-3x/pkg.json
|       |-- dynamo-text/pkg.json
|       |-- monocle/pkg.json
|       |-- rhythm/pkg.json
|       `-- spring-nodes/pkg.json
|-- graphs/
|   |-- production/
|   |   |-- model-health/
|   |   `-- sheet-setup/
|   `-- sandbox/
|       `-- package-smoke-test/
|-- docs/
|   |-- package-versioning.md
|   `-- graph-management.md
`-- scripts/
    `-- validate-manifests.ps1
```

## Intended workflow

1. Pin package versions in `environments/revit-2027-dynamo-4.1/package-lock.json`.
2. Store one package manifest per package under `packages/revit-2027/<package-slug>/pkg.json`.
3. Store each graph in its own folder with a `graph.json` ownership manifest and the `.dyn` file.
4. Review graph changes and package changes separately in pull requests.
5. Promote graph folders from `graphs/sandbox` to `graphs/production` only after package dependencies are pinned.

## Why this shape works

- Package metadata has stable paths and small diffs.
- Graph folders can own documentation, screenshots, test fixtures, and the `.dyn` file together.
- Environment locks make Revit/Dynamo upgrades explicit instead of implicit workstation state.
- CI can validate manifests before anyone opens Dynamo.

## Quick validation

Run this from the repository root:

```powershell
./scripts/validate-manifests.ps1
```
