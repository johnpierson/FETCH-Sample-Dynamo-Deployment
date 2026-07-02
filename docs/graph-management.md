# Graph Management

Each graph lives in its own folder so the graph file, ownership metadata, test notes, and supporting files move together.

## Graph folder contract

```text
graphs/<stage>/<graph-name>/
|-- graph.json
|-- README.md
`-- <graph-name>.dyn
```

`graph.json` should answer the questions reviewers need before opening Dynamo:

- What Revit/Dynamo environment owns this graph?
- Which package versions does it rely on?
- Who owns the graph?
- What model state or sample model is required?
- What manual smoke test proves the graph still works?

## Stages

- `graphs/sandbox` is for experiments, migration tests, and package smoke tests.
- `graphs/production` is for reviewed graphs used by project teams.

Promoting a graph is a folder move plus a manifest update. That keeps history readable and makes review scope obvious.
