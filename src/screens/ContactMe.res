@react.component
let make = (~data: Types.contactMe) =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <ScreenHeader title="contacts" subTitle="Where am I?" />
    <ContactMeBanner data />
    <SectionHeader title="all-media" lineWidthClass="w-0" />
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-4 justify-between">
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 items-start">
        {data.contacts
        ->Js.Array2.slice(~start=2, ~end_=data.contacts->Js.Array2.length)
        ->Js.Array2.mapi((ele, idx) =>
          <div className="flex gap-1 justify-start items-center" key={idx->Belt.Int.toString}>
            <UiUtils.RenderOptional data=ele.icon logic={src => <img src className="w-8 h-8" />} />
            <ExternalLink href=ele.url className="text-secondary">
              {React.string(ele.display)}
            </ExternalLink>
          </div>
        )
        ->React.array}
      </div>
      <UiUtils.RenderIf condition={data.fundRaisers->Js.Array2.length > 0}>
        <div className="border border-solid border-secondary max-w-[15rem] p-4 flex flex-col gap-4">
          <p> {React.string("Support me here")} </p>
          {data.fundRaisers
          ->Js.Array2.mapi((ele, idx) =>
            <div
              className="flex gap-1 text-secondary place-items-center" key={idx->Belt.Int.toString}>
              <UiUtils.RenderOptional
                data=ele.icon logic={src => <img src className="w-8 h-8" />}
              />
              <ExternalLink href=ele.url className="text-secondary">
                {React.string(ele.display)}
              </ExternalLink>
            </div>
          )
          ->React.array}
        </div>
      </UiUtils.RenderIf>
    </div>
  </div>
