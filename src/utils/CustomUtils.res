@send
external scrollIntoView: (Dom.element, option<{"behavior": string, "block": string}>) => unit =
  "scrollIntoView"

let maxNelems = (arr, n) => Js.Array2.filteri(arr, (_, i) => i < n)

let scrollToId = (~timeOut, ~id) => Js.Global.setTimeout(() => {
    open Webapi
    let element = Dom.document->Dom.Document.getElementById(id)
    switch element {
    | None => Js.Console.error("Div not found")
    | Some(element) => scrollIntoView(element, Some({"behavior": "smooth", "block": "start"}))
    }
  }, timeOut)->ignore

let parseText = str =>
  str
  ->Js.String2.split("#BOLD_START#")
  ->Js.Array2.map(Js.String2.split(_, "#BOLD_END#"))
  ->Js.Array2.map(i => {
    switch i {
    | [a] => [
        (
          {
            str: a,
            style: #normal,
          }: Types.textType
        ),
      ]
    | [a, b] => [
        {
          str: a,
          style: #bold,
        },
        {
          str: b,
          style: #normal,
        },
      ]
    | _ => []
    }
  })
  ->Js.Array.concatMany([])

module Dict = {
  let getOptionalWithDecoder = (dict, key, decoder) =>
    Js.Dict.get(dict, key)->Belt.Option.flatMap(decoder)

  let getOptionalString = (dict, key) => getOptionalWithDecoder(dict, key, Js.Json.decodeString)

  let getOptionalObject = (dict, key) => getOptionalWithDecoder(dict, key, Js.Json.decodeObject)

  let getFromOptionalObjectWithDecoder = (optDict, key, decoder) =>
    Belt.Option.flatMap(optDict, getOptionalWithDecoder(_, key, decoder))

  let getOptionalStringFromOptionalDict = (optDict, key) =>
    getFromOptionalObjectWithDecoder(optDict, key, Js.Json.decodeString)

  let getOptionalObjectFromOptionalDict = (optDict, key) =>
    getFromOptionalObjectWithDecoder(optDict, key, Js.Json.decodeObject)
}
