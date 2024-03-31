@react.component
let make = (~data: Types.aboutMe) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="aboutMe">
    <SectionHeader title="about-me" lineWidth="24rem" />
    <AboutMeBanner
      completeLink=Some(External.getPageLink("about")) intro=data.intro aboutImg=data.about_img
    />
  </div>
