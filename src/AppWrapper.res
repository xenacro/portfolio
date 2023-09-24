@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let (isLoading, setIsLoading) = React.useState(_ => true)
  let (screen, setScreen) = React.useState(_ => <NotFound isLoading=true />)
  let scrollToId = () => {
    Webapi.Dom.document
    ->Webapi.Dom.Document.getElementById(url.hash)
    ->Belt.Option.mapWithDefault((), Webapi.Dom.Element.scrollIntoView)
  }
  let updateScreen = () => {
    setScreen(_ =>
      switch url.path {
      | list{} => <Home />
      | list{"projects"} => <Works />
      | list{"about-me"} => <AboutMe />
      | list{"contacts"} => <ContactMe />
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
  React.useEffect1(() => {
    scrollToId()
    None
  }, [url.hash])
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
