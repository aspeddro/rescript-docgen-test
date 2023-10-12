@module("fs") external readFileSync: string => string = "readFileSync"
@variadic @module("path") external pathJoin: array<string> => string = "join"

module URL = {
  @module("url") external fileURLToPath: string => string = "fileURLToPath"

  type t = {href: string}
  @new external make: (string, string) => t = "URL"
}

type meta = {url: string}
type import = {meta: meta}
@val external import: import = "import"

let __filename = URL.fileURLToPath(import.meta.url)
let url = URL.make(".", import.meta.url)
let __dirname = URL.fileURLToPath(url.href)

let docPath = pathJoin([__dirname, "..", "doc", "doc.json"])

let json = docPath->readFileSync->Js.Json.parseExn

RescriptTools.Docgen.decodeFromJson(json)->Js.log
