@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12" id="aboutMe">
    <SectionHeader title="about-me" lineWidth="24rem" />
    <AboutMeBanner completeLink=Some("/about") />
  </div>
