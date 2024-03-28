type page = [#home | #works | #aboutMe | #contacts | #skills]
let locations: array<page> = [#home, #skills, #works, #aboutMe, #contacts]

external pageToStringU: page => string = "%identity"

let pageToURL = page =>
  switch page {
  | #home => "/"
  | x => `/#${pageToStringU(x)}`
  }

type profileInfo = {
  display: string,
  url: string,
}

type styles = [#bold | #normal]

type textType = {
  str: string,
  style: styles,
}

type bannerData = {
  banner_img: string,
  banner_heading: string,
  banner_text: string,
  current_project: profileInfo,
}
