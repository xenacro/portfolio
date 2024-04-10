@react.component
let make = (~className, ~thumbnail=None, ~data: Types.minorProjectData) =>
  <div className>
    <UiUtils.RenderOptional
      data=thumbnail logic={src => <img src className="w-full border-b h-60 object-cover" />}
    />
    <p className="border-b px-3 py-2 text-sm text-primary">
      <UiUtils.Text text=data.technologies limit=48 />
    </p>
    <div className="flex flex-col justify-around flex-grow gap-3 p-3">
      <UiUtils.RenderOptional
        data=data.app_link
        logic={href =>
          <ExternalLink href className="text-2xl hover:underline">
            {React.string(data.name)}
          </ExternalLink>}
        default={<p className="text-2xl"> {React.string(data.name)} </p>}
      />
      <p>
        <UiUtils.Text text=data.description limit=94 />
      </p>
      <UiUtils.RenderOptional
        data=data.code_link
        logic={href =>
          <ExternalLink href className="border border-solid border-secondary px-3 py-1 w-fit">
            {React.string("View Code \u21DD")}
          </ExternalLink>}
        default={<p
          className="border border-solid border-secondary px-3 py-1 w-fit cursor-not-allowed">
          {React.string("Private Repo")}
        </p>}
      />
    </div>
  </div>
