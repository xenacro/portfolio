@react.component
let make = (~data: Types.contactMe) =>
  <div className="flex flex-col lg:flex-row justify-between gap-16">
    <p className="max-w-lg text-secondary"> {React.string(data.pitch)} </p>
    <div className="border border-solid border-secondary max-w-[15rem] p-4 flex flex-col gap-4">
      <p> {React.string("Message me here")} </p>
      {data.contacts
      ->CustomUtils.maxNelems(2)
      ->Js.Array2.mapi((ele, idx) =>
        <div className="flex gap-1 text-secondary place-items-center" key={idx->Belt.Int.toString}>
          <UiUtils.RenderOptional data=ele.icon logic={src => <img src className="w-8 h-8" />} />
          <ExternalLink href=ele.url className="hover:text-white">
            {React.string(ele.display)}
          </ExternalLink>
        </div>
      )
      ->React.array}
    </div>
  </div>
