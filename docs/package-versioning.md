# Package Versioning

Package management is split into two layers:

- `packages/revit-2027/<package-slug>/pkg.json` stores the package manifest copied from the package cache.
- `environments/revit-2027-dynamo-4.1/package-lock.json` records which package versions are approved for this Revit/Dynamo target.

## Recommended change flow

1. Install or update a package in a clean Dynamo 4.1 package cache.
2. Copy only the package `pkg.json` into the matching package folder.
3. Update `package-lock.json` with the package version, engine version, and compatibility notes.
4. Run `./scripts/validate-manifests.ps1`.
5. Open a pull request with package changes separate from graph changes whenever possible.

## Binary packages

Some Dynamo packages include binaries. This sample tracks `containsBinaries`, `dllCount`, and `fileCount` in the environment lock to show that a package is binary-backed without committing the full installed package payload.

In a production setup, package archives can live in GitHub Releases, an internal artifact feed, or a network package mirror while Git stores the metadata and lock records.
