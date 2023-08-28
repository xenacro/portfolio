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
