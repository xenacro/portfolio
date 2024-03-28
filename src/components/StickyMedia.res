@react.component
let make = (~data: array<Types.profileInfo>) => {
  <div className="hidden lg:flex fixed top-0 left-4 flex-col items-center gap-2">
    <div className="w-[0.125rem] h-48 bg-[#D9D9D9]" />
    <div className="flex flex-col justify-center gap-2">
      {data
      ->Js.Array2.mapi((item, i) => <SocialMediaItem profile=item key={Belt.Int.toString(i)} />)
      ->React.array}
    </div>
  </div>
}
