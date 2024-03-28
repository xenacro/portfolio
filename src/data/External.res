@module external data: Js.Dict.t<Js.Json.t> = "./data.json"

let getBanner = () => data->Js.Dict.get("hero_img")->Belt.Option.flatMap(Js.Json.decodeString)
