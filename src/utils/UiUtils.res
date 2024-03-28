module RenderOptional = {
  @react.component
  let make = (~data: option<'a>, ~logic: 'a => React.element, ~default=React.null) =>
    switch data {
    | None => default
    | Some(a) => logic(a)
    }
}
