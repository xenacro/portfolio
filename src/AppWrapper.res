@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let (isLoading, setIsLoading) = React.useState(_ => true)
  let (screen, setScreen) = React.useState(_ => <NotFound isLoading=true />)

  let updateScreen = () => {
    setScreen(_ =>
      switch url.path {
      | list{} => <Home />
      | list{"projects"} =>
        <UiUtils.RenderOptional data={External.getProject()} logic={data => <Works data />} />
      | list{"about"} =>
        <UiUtils.RenderOptional
          data={External.getAboutMe()}
          logic={data => <AboutMe data skills={External.getSkills()} />}
        />
      | list{"contacts"} =>
        <UiUtils.RenderOptional data={External.getContactMe()} logic={data => <ContactMe data />} />
      | _ => <NotFound isLoading=false />
      }
    )
    Webapi.Dom.window->Webapi.Dom.Window.scrollTo(0.0, 0.0)
  }
  React.useEffect1(() => {
    if isLoading {
      Js.Global.setTimeout(updateScreen, 1000)->ignore
      setIsLoading(_ => false)
    } else {
      updateScreen()
    }
    None
  }, [url.path])
  React.useEffect0(() => {
    CustomUtils.scrollToId(~id=url.hash, ~timeOut=1200)
    None
  })
  <div
    className={`bg-[#282C33] text-white font-['Fira_Code'] flex flex-col min-h-screen ${isLoading
        ? "animate-simmer"
        : ""}`}>
    <div
      className="lg:px-40 px-6 lg:pt-8 pt-4 lg:pb-36 pb-16 flex flex-col gap-10 lg:gap-16 border-b border-solid border-secondary flex-grow">
      <Header />
      <AbsoluteShapes count=1 />
      screen
    </div>
    <Footer />
  </div>
}
