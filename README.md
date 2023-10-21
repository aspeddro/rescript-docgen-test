Install rescript-tools

```sh
npm install $(npm pack ./path/to/rescript-vscode/tools | tail -1)
```

Generate JSON:

```sh
npm run docgen
```

Decode JSON:

```sh
node scripts/test.bs.mjs > doc/doc_decoded.json
```
