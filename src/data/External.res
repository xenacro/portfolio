@module external data: Js.Dict.t<Js.Json.t> = "./data.json"
open CustomUtils.Dict

//------------
let getLogo = () => getOptionalString(data, "hero_img")

//------------
let getBannerData = () => getOptionalObject(data, "banner")

let getStringFromBanner = getOptionalStringFromOptionalDict(getBannerData())

let getBannerImg = () => getStringFromBanner("banner_img")

let getBannerHeading = () => getStringFromBanner("banner_heading")

let getBannerText = () => getStringFromBanner("banner_text")

let getCurrentProject = () => getOptionalObjectFromOptionalDict(getBannerData(), "current_project")

let getProjectName = () => getOptionalStringFromOptionalDict(getCurrentProject(), "name")

let getProjectLink = () => getOptionalStringFromOptionalDict(getCurrentProject(), "link")

let getBanner = (): option<Types.bannerData> =>
  switch (getBannerImg(), getBannerHeading(), getBannerText(), getProjectName(), getProjectLink()) {
  | (Some(img), Some(heading), Some(text), Some(name), Some(link)) =>
    Some({
      banner_img: img,
      banner_heading: heading,
      banner_text: text,
      current_project: {
        display: name,
        url: link,
      },
    })
  | _ => None
  }

//------------
