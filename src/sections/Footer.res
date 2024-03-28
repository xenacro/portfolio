@react.component
let make = () =>
  <div className="lg:px-40 px-6 py-4 lg:py-8 flex flex-col justify-between gap-12">
    <div className="flex justify-between items-start">
      <div>
        <p>
          {React.string("XeNaCrO\u00A0")}
          <UiUtils.RenderOptional
            data={External.getEmail()}
            logic={mail =>
              <ExternalLink href={`mailto:${mail}`} className="text-secondary">
                {React.string(mail)}
              </ExternalLink>}
          />
        </p>
        <UiUtils.RenderOptional
          data={External.getRole()} logic={role => <p> {React.string(role)} </p>}
        />
      </div>
      <div>
        <p className="font-bold text-right"> {React.string("Media")} </p>
        <div className="flex gap-2">
          <UiUtils.RenderOptional
            data={External.getMedia()}
            logic={medias =>
              medias
              ->Js.Array2.mapi((profile, idx) =>
                <SocialMediaItem profile key={idx->Belt.Int.toString} />
              )
              ->React.array}
          />
        </div>
      </div>
    </div>
    <div className="flex justify-center">
      {React.string("© Copyright 2023. Made by XeNaCrO")}
    </div>
  </div>
