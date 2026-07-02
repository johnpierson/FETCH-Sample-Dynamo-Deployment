# FETCH Folder Rules

FETCH resolves a source folder or extracted zip in this order:

1. Look for a version folder matching the current Revit version: `2027`, `Revit 2027`, or `R27`.
2. Inside that version folder, look for `Packages` or `Package`.
3. Optionally look for `Dynamo Graphs`, `DynamoGraphs`, or `Graphs`.
4. Copy packages to the active Dynamo package directory.
5. Replace the matching Revit graph folder in the configured FETCH graph root.

If no version folder is found, FETCH treats the selected folder as a direct package source and still checks for a graph folder beside it. The versioned layout is better for firm-managed zips because one zip can contain multiple Revit versions.
