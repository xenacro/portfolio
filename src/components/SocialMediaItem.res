type size = Normal | Large

@react.component
let make = (~profile: Types.profileInfo, ~size: size=Normal) => {
  let imageClassName = size == Large ? "w-16 h-16" : "w-8 h-8"
  <ExternalLink href={profile.url}>
    <img src={profile.icon} className=imageClassName />
  </ExternalLink>
}
