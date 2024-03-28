@react.component
let make = (~className, ~thumbnail=None, ~data: Types.minorProjectData) =>
  <div className>
    <UiUtils.RenderOptional data=thumbnail logic={src => <img src className="w-full border-b" />} />
    <p className="border-b p-1"> {React.string(data.technologies)} </p>
    <div className="flex flex-col gap-3 p-2">
      <UiUtils.RenderOptional
        data=data.app_link
        logic={href =>
          <ExternalLink href className="text-2xl hover:underline">
            {React.string(data.name)}
          </ExternalLink>}
        default={<p className="text-2xl"> {React.string(data.name)} </p>}
      />
      <p> {React.string(data.description)} </p>
      <ExternalLink
        href=data.code_link className="border border-solid border-secondary px-3 py-1 w-fit">
        {React.string("View Code \u21DD")}
      </ExternalLink>
    </div>
  </div>
