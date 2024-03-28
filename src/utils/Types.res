type page = [#home | #works | #aboutMe | #contacts | #skills]
let locations: array<page> = [#home, #skills, #works, #aboutMe, #contacts]

external pageToStringU: page => string = "%identity"

let pageToURL = page =>
  switch page {
  | #home => "/"
  | x => `/#${pageToStringU(x)}`
  }

type profileInfo = {
  icon: option<string>,
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

type feeler = {
  quote: string,
  author: string,
}

type minorProjectData = {
  technologies: string,
  name: string,
  description: string,
  code_link: option<string>,
  app_link: option<string>,
}

type majorProjectData = {
  projectData: minorProjectData,
  thumbnail: string,
}

type projects = {
  major: array<majorProjectData>,
  minor: array<minorProjectData>,
}

type skills = {
  language: string,
  databases: string,
  tools: string,
  frameworks: string,
  others: string,
  skills_img: string,
}

type aboutMe = {intro: array<string>, about_img: string, fun_facts: array<string>}

type contactMe = {
  pitch: string,
  contacts: array<profileInfo>,
  fundRaisers: array<profileInfo>,
}
