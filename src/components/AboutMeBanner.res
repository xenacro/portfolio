@react.component
let make = (~completeLink=None, ~intro) =>
  <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
    <div className="text-secondary flex flex-col gap-4">
      {intro
      ->Js.Array2.mapi((ele, idx) => <p key={idx->Belt.Int.toString}> {React.string(ele)} </p>)
      ->React.array}
      {completeLink->Belt.Option.mapWithDefault(React.null, href =>
        <Link to=href className="border border-solid border-primary px-4 py-2 w-fit">
          {React.string("Read more \u21DD")}
        </Link>
      )}
    </div>
    <img className="hidden lg:block" src="/assets/icons/banner-img.png" />
  </div>
