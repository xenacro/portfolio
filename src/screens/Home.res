@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    // <Banner />
    <UiUtils.RenderOptional data={External.getBanner()} logic={data => <Banner data />} />
    <Quote />
    <Projects />
    <Skills />
    <About />
    <Contacts />
  </div>
