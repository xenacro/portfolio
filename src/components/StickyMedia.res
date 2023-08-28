@react.component
let make = () => {
    <div className="hidden lg:flex absolute top-0 left-4 flex-col items-center gap-2">
        <div className="w-[0.125rem] h-48 bg-[#D9D9D9]" />
        <div className="flex flex-col justify-center gap-2">
        {
            Data.profiles->Js.Array2.mapi((item,i)=><SocialMediaItem profile=item key=Belt.Int.toString(i) />)->React.array
        }
        </div>
    </div>
}