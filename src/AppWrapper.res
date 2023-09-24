@react.component
let make = () => {
  <div
    className="bg-[#282C33] text-white font-['Fira_Code'] flex flex-col min-h-screen animate-simmer">
    <div
      className="lg:px-40 px-6 lg:pt-8 pt-4 lg:pb-36 pb-16 flex flex-col gap-10 lg:gap-16 border-b border-solid border-secondary flex-grow">
      <Header />
      <AbsoluteShapes count=1 />
      // <Home />
      // <Works />
      // <AboutMe />
      // <ContactMe />
      <NotFound />
    </div>
    <Footer />
  </div>
}
