@react.component
let make = (~className="", ~to, ~children, ~onClick=?) => {
  let clickAction = () => {
    onClick->Belt.Option.mapWithDefault((), fn => fn())
    if to->Js.String2.startsWith("/#") {
      CustomUtils.scrollToId(~id=to->Js.String2.replace("/#", ""), ~timeOut=100)
    }
    RescriptReactRouter.push(to)
  }
  <div onClick={_ => clickAction()} className={`hover:cursor-pointer ${className}`}> children </div>
}
