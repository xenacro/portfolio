@react.component
let make = (~title, ~lineWidth, ~expandPath=None) =>
  <div className="flex justify-between items-center w-full">
    <div className="flex items-center gap-4 lg:max-w-[50%]">
      <div className="text-white text-3xl">
        <span className="text-primary"> {React.string("#\u00A0")} </span>
        {React.string(title)}
      </div>
      <div
        className="h-[0.06275rem] bg-primary max-w-[60%]"
        style={ReactDOMStyle.make(~width=lineWidth, ())}
      />
    </div>
    {expandPath->Belt.Option.mapWithDefault(React.null, path =>
      <Link to=path className="text-base"> {React.string("View all \u21DD")} </Link>
    )}
  </div>
