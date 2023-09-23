@react.component
let make = (~className, ~thumbnail=None, ~tags, ~title, ~description, ~link) =>
  <div className>
    {thumbnail->Belt.Option.mapWithDefault(React.null, src =>
      <img src className="w-full border-b" />
    )}
    <p className="border-b p-1"> {React.string(tags)} </p>
    <div className="flex flex-col gap-3 p-2">
      <p className="text-2xl"> {React.string(title)} </p>
      <p> {React.string(description)} </p>
      <a href=link className="border border-solid border-secondary px-3 py-1 w-fit" target="_blank">
        {React.string("View Code \u21DD")}
      </a>
    </div>
  </div>
