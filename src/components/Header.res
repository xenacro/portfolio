type page = [#home | #works | #aboutMe | #contacts]
let locations: array<page> = [#home, #works, #aboutMe, #contacts]

external pageToStringU: page => string = "%identity"

let pageToURL = page => switch page {
| #home => "/"
| x => `/#${pageToStringU(x)}`
}

type profileInfo = {
    icon: string,
    url: string
}

let profiles: array<profileInfo> = [
    {
        icon: "/assets/icons/github.svg",
        url: "https://github.com/xenacro"
    },
    {
        icon: "/assets/icons/leetcode.svg",
        url: "https://leetcode.com/xenacro/"
    },
    {
        icon: "/assets/icons/linkedin.svg",
        url: "https://www.linkedin.com/in/xenacro/"
    }
]

let max3elems = arr => Js.Array2.filteri(arr,(_,i)=>i<3)

@react.component
let make = () => {
    let (isNavOpen, setIsNavOpen) = React.useState(_ => false)
    <>
        <div className="flex justify-between h-6">
            <div><a href="/">{React.string("XeNaCrO")}</a></div>
            <div className="flex-grow flex justify-end lg:hidden">
                <div className="relative w-6 h-6" onClick={_=>setIsNavOpen(val=>!val)}>
                    <div className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 w-6 top-1 ${isNavOpen?"rotate-45":""}`}/>
                    <div className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 ${isNavOpen?"w-6 top-1 -rotate-45":"w-4 top-3"}`}/>
                </div>
            </div>
            <div className="hidden lg:flex flex-grow justify-end gap-8">
            {
                locations->Js.Array2.mapi((item, i)=><a key={Belt.Int.toString(i)} href={pageToURL(item)}><span className="text-primary">{React.string("# ")}</span>{React.string(item:>string)}</a>)->React.array
            }
            </div>
        </div>
        {isNavOpen?
            <div className="flex flex-col justify-between h-[calc(100vh-2.5rem)] pt-12 pb-9 animate-slide-in-left">
                <div className="flex flex-col gap-8">
                {
                locations->Js.Array2.mapi((item, i)=><a key={Belt.Int.toString(i)} href={pageToURL(item)} onClick={_=>setIsNavOpen(_=>false)} className="text-4xl"><span className="text-primary">{React.string("# ")}</span>{React.string(item:>string)}</a>)->React.array
                }
                </div>
                <div className="flex justify-center gap-2">
                {
                    max3elems(profiles)->Js.Array2.mapi((item,i)=><a key={Belt.Int.toString(i)} href={item.url} target="_blank">
                    <img src={item.icon} className="w-16 h-16" />
                    </a>)->React.array
                }
                </div>
            </div>
        :React.null}
    </>
}