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
