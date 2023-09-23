@react.component
let make = () =>
  <div className="bg-[#282C33] text-white font-['Fira_Code']">
    <div
      className="lg:px-40 px-6 lg:pt-8 pt-4 lg:pb-36 pb-16 flex flex-col gap-10 lg:gap-16 border-b border-solid border-secondary">
      <Header />
      <AbsoluteShapes />
      <Banner />
      <Quote />
      <Projects />
      <Skills />
      <About />
      <Contacts />
    </div>
    <Footer />
  </div>
