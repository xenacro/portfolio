@react.component
let make = (~className="", ~to, ~children, ~onClick=?) => {
  let clickAction = () => {
    onClick->Belt.Option.mapWithDefault((), fn => fn())
    RescriptReactRouter.push(to)
  }
  <div onClick={_ => clickAction()} className={`hover:cursor-pointer ${className}`}> children </div>
}
