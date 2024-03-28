@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <UiUtils.RenderOptional data={External.getBanner()} logic={data => <Banner data />} />
    <UiUtils.RenderOptional data={External.getFeeler()} logic={data => <Quote data />} />
    <UiUtils.RenderOptional data={External.getProject()} logic={data => <Projects data />} />
    <UiUtils.RenderOptional data={External.getSkills()} logic={data => <Skills data />} />
    <UiUtils.RenderOptional data={External.getAboutMe()} logic={data => <About data />} />
    <UiUtils.RenderOptional data={External.getContactMe()} logic={data => <Contacts data />} />
  </div>
