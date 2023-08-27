type page = [#home | #works | #aboutMe | #contacts]
let locations: array<page> = [#home, #works, #aboutMe, #contacts]

external pageToStringU: page => string = "%identity"

let pageToURL = page => switch page {
| #home => "/"
| x => `/#${pageToStringU(x)}`
}

@react.component
let make = () => {
    let (cross, setCross) = React.useState(_ => false)

    <div className="flex justify-around">
        <div><a href="/">{React.string("XeNaCrO")}</a></div>
        <div className="hidden lg:flex flex-grow justify-end gap-8">
        {
            locations->Js.Array2.mapi((item, i)=><a key={Belt.Int.toString(i)} href={pageToURL(item)}><span className="text-primary">{React.string("#")}</span>{React.string(item:>string)}</a>)->React.array
        }
        </div>
        <div className="flex-grow flex justify-end lg:hidden">
            <div className="relative w-6 h-6" onClick={_=>setCross(val=>!val)}>
                <div className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 w-6 top-1 ${cross?"rotate-45":""}`}/>
                <div className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 ${cross?"w-6 top-1 -rotate-45":"w-4 top-3"}`}/>
            </div>
        </div>
    </div>
}