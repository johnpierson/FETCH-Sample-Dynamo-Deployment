# Revit 2027 / Dynamo 4.1 Environment

This folder represents one install target: Revit 2027 running Dynamo Core 4.1.

`package-lock.json` is the source of truth for packages that graphs in this environment are allowed to reference. It is intentionally committed as plain JSON so package updates become ordinary Git diffs.

## Versioning convention

- Environment folder: `revit-2027-dynamo-4.1`
- Package manifests: `packages/revit-2027/<package-slug>/pkg.json`
- Graph manifests: `graphs/<stage>/<graph-name>/graph.json`

When Dynamo or Revit changes, create a new environment folder rather than rewriting this one in place.
