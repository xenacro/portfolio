@module external data: Js.Dict.t<Js.Json.t> = "./data.json"
open CustomUtils.Option

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
        icon: None,
        display: name,
        url: link,
      },
    })
  | _ => None
  }

//------------

let getFeelerQuote = () => getOptionalObject(data, "feeler_quote")

let getQuote = () => getOptionalStringFromOptionalDict(getFeelerQuote(), "quote")

let getAuthor = () => getOptionalStringFromOptionalDict(getFeelerQuote(), "author")

let getFeeler = (): option<Types.feeler> =>
  switch (getQuote(), getAuthor()) {
  | (Some(quote), Some(author)) =>
    Some({
      quote,
      author,
    })
  | _ => None
  }

//------------

let getProjectsData = () => getOptionalObject(data, "projects")

let getMajorProject = () => getOptionalArrayFromOptionalDict(getProjectsData(), "major")

let getMajorProjectObjectArray = () =>
  getMajorProject()->Belt.Option.flatMap(parseJsonArrayToObjectArray)

let getParsedMajorProjectArray = () =>
  getMajorProjectObjectArray()->Belt.Option.flatMap(arr =>
    arr
    ->Js.Array2.map(ele => {
      switch (
        getOptionalString(ele, "thumbnail"),
        getOptionalString(ele, "technologies"),
        getOptionalString(ele, "name"),
        getOptionalString(ele, "description"),
      ) {
      | (Some(thumbnail), Some(technologies), Some(name), Some(description)) =>
        Some(
          (
            {
              projectData: {
                technologies,
                name,
                description,
                code_link: getOptionalString(ele, "code_link"),
                app_link: getOptionalString(ele, "app_link"),
              },
              thumbnail,
            }: Types.majorProjectData
          ),
        )
      | _ => None
      }
    })
    ->arrayOfOptionToOptionalArray
  )

let getMinorProject = () => getOptionalArrayFromOptionalDict(getProjectsData(), "minor")

let getMinorProjectObjectArray = () =>
  getMinorProject()->Belt.Option.flatMap(parseJsonArrayToObjectArray)

let getParsedMinorProjectArray = () =>
  getMinorProjectObjectArray()->Belt.Option.flatMap(arr =>
    arr
    ->Js.Array2.map(ele => {
      switch (
        getOptionalString(ele, "technologies"),
        getOptionalString(ele, "name"),
        getOptionalString(ele, "description"),
      ) {
      | (Some(technologies), Some(name), Some(description)) =>
        Some(
          (
            {
              technologies,
              name,
              description,
              code_link: getOptionalString(ele, "code_link"),
              app_link: getOptionalString(ele, "app_link"),
            }: Types.minorProjectData
          ),
        )
      | _ => None
      }
    })
    ->arrayOfOptionToOptionalArray
  )

let getProject = (): option<Types.projects> =>
  switch (getParsedMajorProjectArray(), getParsedMinorProjectArray()) {
  | (Some(major), Some(minor)) =>
    Some({
      major,
      minor,
    })
  | _ => None
  }

//------------

let getSkillsData = () => getOptionalObject(data, "skills")

let getLanguage = () => getOptionalStringFromOptionalDict(getSkillsData(), "language")

let getDatabases = () => getOptionalStringFromOptionalDict(getSkillsData(), "databases")

let getTools = () => getOptionalStringFromOptionalDict(getSkillsData(), "tools")

let getFrameworks = () => getOptionalStringFromOptionalDict(getSkillsData(), "frameworks")

let getOthers = () => getOptionalStringFromOptionalDict(getSkillsData(), "others")

let getSkillsImg = () => getOptionalStringFromOptionalDict(getSkillsData(), "skills_img")

let getSkills = (): option<Types.skills> =>
  switch (getLanguage(), getDatabases(), getTools(), getFrameworks(), getOthers(), getSkillsImg()) {
  | (
      Some(language),
      Some(databases),
      Some(tools),
      Some(frameworks),
      Some(others),
      Some(skills_img),
    ) =>
    Some({
      language,
      databases,
      tools,
      frameworks,
      others,
      skills_img,
    })
  | _ => None
  }

//------------

let getAboutMeData = () => getOptionalObject(data, "about_me")

let getIntro = () =>
  getOptionalArrayFromOptionalDict(getAboutMeData(), "intro")->Belt.Option.flatMap(
    parseJsonArrayToStringArray,
  )

let getAboutImg = () => getOptionalStringFromOptionalDict(getAboutMeData(), "about_img")

let getFunFacts = () =>
  getOptionalArrayFromOptionalDict(getAboutMeData(), "fun_facts")->Belt.Option.flatMap(
    parseJsonArrayToStringArray,
  )

let getAboutMe = (): option<Types.aboutMe> =>
  switch (getIntro(), getAboutImg(), getFunFacts()) {
  | (Some(intro), Some(about_img), Some(fun_facts)) =>
    Some({
      intro,
      about_img,
      fun_facts,
    })
  | _ => None
  }

//------------

let getContactMeData = () => getOptionalObject(data, "contact_me")

let getPitch = () => getOptionalStringFromOptionalDict(getContactMeData(), "pitch")

let getContacts = () =>
  getOptionalArrayFromOptionalDict(getContactMeData(), "contacts")
  ->Belt.Option.flatMap(parseJsonArrayToObjectArray)
  ->Belt.Option.flatMap(arr =>
    arr
    ->Js.Array2.map(ele => {
      switch (getOptionalString(ele, "text"), getOptionalString(ele, "link")) {
      | (Some(display), Some(url)) =>
        Some(
          (
            {
              icon: getOptionalString(ele, "icon"),
              display,
              url,
            }: Types.profileInfo
          ),
        )
      | _ => None
      }
    })
    ->arrayOfOptionToOptionalArray
  )

let getFundRaisers = () =>
  getOptionalArrayFromOptionalDict(getContactMeData(), "fund_raisers")
  ->Belt.Option.flatMap(parseJsonArrayToObjectArray)
  ->Belt.Option.flatMap(arr =>
    arr
    ->Js.Array2.map(ele => {
      switch (getOptionalString(ele, "text"), getOptionalString(ele, "link")) {
      | (Some(display), Some(url)) =>
        Some(
          (
            {
              icon: getOptionalString(ele, "icon"),
              display,
              url,
            }: Types.profileInfo
          ),
        )
      | _ => None
      }
    })
    ->arrayOfOptionToOptionalArray
  )

let getContactMe = (): option<Types.contactMe> =>
  switch (getPitch(), getContacts(), getFundRaisers()) {
  | (Some(pitch), Some(contacts), Some(fundRaisers)) =>
    Some({
      pitch,
      contacts,
      fundRaisers,
    })
  | _ => None
  }

//------------

let getEmail = () => getOptionalString(data, "email")

let getRole = () => getOptionalString(data, "role")

let getMedia = () =>
  getOptionalArray(data, "media")
  ->Belt.Option.flatMap(parseJsonArrayToObjectArray)
  ->Belt.Option.flatMap(arr =>
    arr
    ->Js.Array2.map(ele => {
      switch (getOptionalString(ele, "text"), getOptionalString(ele, "link")) {
      | (Some(display), Some(url)) =>
        Some(
          (
            {
              icon: getOptionalString(ele, "icon"),
              display,
              url,
            }: Types.profileInfo
          ),
        )
      | _ => None
      }
    })
    ->arrayOfOptionToOptionalArray
  )
