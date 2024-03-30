type textSize = Normal | ExtraLarge

@react.component
let make = (~onClick=?, ~textSize: textSize=Normal, ~className) => {
  let isTextLarge = textSize == ExtraLarge
  <div className>
    {Types.locations
    ->Js.Array2.mapi((item, i) =>
      <Link
        key={Belt.Int.toString(i)}
        to={Types.pageToURL(item)}
        ?onClick
        className={isTextLarge ? "text-4xl" : ""}>
        <span className="text-primary"> {React.string("# ")} </span>
        {React.string((item :> string))}
      </Link>
    )
    ->React.array}
    <UiUtils.RenderOptional
      data={External.getResume()}
      logic={href =>
        <ExternalLink href className={isTextLarge ? "text-4xl" : ""}>
          <span className="text-primary"> {React.string("👀 ")} </span>
          {React.string("My Resume")}
        </ExternalLink>}
    />
  </div>
}
