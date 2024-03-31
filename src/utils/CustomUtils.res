@send
external scrollIntoView: (Dom.element, option<{"behavior": string, "block": string}>) => unit =
  "scrollIntoView"

let maxNelems = (arr, n) => Js.Array2.slice(arr, ~start=0, ~end_=n)

let scrollToId = (~timeOut, ~id) => Js.Global.setTimeout(() => {
    open Webapi
    let element = Dom.document->Dom.Document.getElementById(id)
    switch element {
    | None => Js.Console.error("Div not found")
    | Some(element) => scrollIntoView(element, Some({"behavior": "smooth", "block": "start"}))
    }
  }, timeOut)->ignore

let getNormalText = (str): Types.textType => {
  str,
  style: #normal,
}

let getBoldText = (str): Types.textType => {
  str,
  style: #bold,
}

let parseText = str =>
  str
  ->Js.String2.split("#BOLD_START#")
  ->Js.Array2.map(Js.String2.split(_, "#BOLD_END#"))
  ->Js.Array2.map(i => {
    switch i {
    | [a] => [getNormalText(a)]
    | [a, b] => [getBoldText(a), getNormalText(b)]
    | _ => []
    }
  })
  ->Js.Array.concatMany([])

let rec getTupleArr = (acc, strings) =>
  switch strings {
  | list{} => acc
  | list{str} => acc->Js.Array2.concat([(str, None)])
  | list{str1, str2, ...rest} => getTupleArr(acc->Js.Array2.concat([(str1, Some(str2))]), rest)
  }

module Option = {
  let getOptionalWithDecoder = (dict, key, decoder) =>
    Js.Dict.get(dict, key)->Belt.Option.flatMap(decoder)

  let getOptionalString = (dict, key) => getOptionalWithDecoder(dict, key, Js.Json.decodeString)

  let getOptionalObject = (dict, key) => getOptionalWithDecoder(dict, key, Js.Json.decodeObject)

  let getOptionalArray = (dict, key) => getOptionalWithDecoder(dict, key, Js.Json.decodeArray)

  let getFromOptionalObjectWithDecoder = (optDict, key, decoder) =>
    Belt.Option.flatMap(optDict, getOptionalWithDecoder(_, key, decoder))

  let getOptionalStringFromOptionalDict = (optDict, key) =>
    getFromOptionalObjectWithDecoder(optDict, key, Js.Json.decodeString)

  let getOptionalObjectFromOptionalDict = (optDict, key) =>
    getFromOptionalObjectWithDecoder(optDict, key, Js.Json.decodeObject)

  let getOptionalArrayFromOptionalDict = (optDict, key) =>
    getFromOptionalObjectWithDecoder(optDict, key, Js.Json.decodeArray)

  let arrayOfOptionToOptionalArray = arr => arr->Js.Array2.reduce((acc, ele) => {
      switch (ele, acc) {
      | (Some(el), Some(ac)) => ac->Js.Array2.concat([el])->Some
      | _ => None
      }
    }, Some([]))

  let parseJsonArrayToObjectArray = arr =>
    arr->Js.Array2.map(Js.Json.decodeObject)->arrayOfOptionToOptionalArray

  let parseJsonArrayToStringArray = arr =>
    arr->Js.Array2.map(Js.Json.decodeString)->arrayOfOptionToOptionalArray
}

let searchParamToDict = search =>
  search
  ->Js.String2.split("&")
  ->Js.Array2.map(Js.String.split("="))
  ->Js.Array2.map(ele =>
    switch (ele->Belt.Array.get(0), ele->Belt.Array.get(1)) {
    | (Some(key), Some(val)) => (key, val)
    | _ => ("__key__", "__val__")
    }
  )
  ->Js.Array2.filter(((key, _)) => key != "__key__")
  ->Js.Dict.fromArray

let getFromSearchParam = search => search->searchParamToDict->Js.Dict.get
