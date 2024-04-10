module RenderOptional = {
  @react.component
  let make = (~data: option<'a>, ~logic: 'a => React.element, ~default=React.null) =>
    switch data {
    | None => default
    | Some(a) => logic(a)
    }
}

module RenderIf = {
  @react.component
  let make = (~condition, ~children, ~default=React.null) => condition ? children : default
}

module Text = {
  @react.component
  let make = (~text, ~limit=text->Js.String2.length) =>
    (
      text->Js.String2.length > limit ? text->Js.String2.slice(~from=0, ~to_=limit) ++ "..." : text
    )->React.string
}
