@react.component
let make = () => {
  let (isNavOpen, setIsNavOpen) = React.useState(_ => false)
  <>
    <div className="flex justify-between h-6">
      <Link to="/" className="text-3xl">
        <UiUtils.RenderOptional data={External.getLogo()} logic={src => <img src />} />
      </Link>
      <div className="flex-grow flex justify-end lg:hidden">
        <div className="relative w-6 h-6" onClick={_ => setIsNavOpen(val => !val)}>
          <div
            className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 w-6 top-1 ${isNavOpen
                ? "rotate-45"
                : ""}`}
          />
          <div
            className={`absolute h-[0.125rem] right-0 bg-[#D9D9D9] transition ease-in-out delay-150 ${isNavOpen
                ? "w-6 top-1 -rotate-45"
                : "w-4 top-3"}`}
          />
        </div>
      </div>
      <NavMenu className="hidden lg:flex flex-grow justify-end gap-8" />
    </div>
    {isNavOpen
      ? <div
          className="flex flex-col justify-between h-[calc(100vh-2.5rem)] pt-12 pb-9 animate-slide-in-left">
          <NavMenu
            onClick={_ => setIsNavOpen(_ => false)}
            className="flex flex-col gap-8"
            textSize=ExtraLarge
          />
          <div className="flex justify-center gap-2">
            {CustomUtils.maxNelems(Data.profiles, 3)
            ->Js.Array2.mapi((item, i) =>
              <SocialMediaItem profile=item size=Large key={Belt.Int.toString(i)} />
            )
            ->React.array}
          </div>
        </div>
      : React.null}
    <UiUtils.RenderOptional data={External.getMedia()} logic={data => <StickyMedia data />} />
  </>
}
