type size = Normal | Large

@react.component
let make = (~profile:Types.profileInfo, ~size:size=Normal) => {
    let imageClassName = size == Large ? "w-16 h-16" : "w-8 h-8"
    <a href={profile.url} target="_blank">
        <img src={profile.icon} className=imageClassName />
    </a>
}