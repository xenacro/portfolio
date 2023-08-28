type textSize = Normal | ExtraLarge

@react.component
let make = (~onClick=?, ~textSize:textSize=Normal, ~className) => {
    let isTextLarge = textSize == ExtraLarge
    <div className>
    {
        Types.locations->Js.Array2.mapi((item, i)=><a key={Belt.Int.toString(i)} href={Types.pageToURL(item)} ?onClick className={isTextLarge?"text-4xl":""}><span className="text-primary">{React.string("# ")}</span>{React.string(item:>string)}</a>)->React.array
    }
    </div>
}