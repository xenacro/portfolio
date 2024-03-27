type page = [#home | #works | #aboutMe | #contacts | #skills]
let locations: array<page> = [#home, #skills, #works, #aboutMe, #contacts]

external pageToStringU: page => string = "%identity"

let pageToURL = page =>
  switch page {
  | #home => "/"
  | x => `/#${pageToStringU(x)}`
  }

type profileInfo = {
  icon: string,
  url: string,
}
