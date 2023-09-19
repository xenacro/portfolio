@react.component
let make = () =>
  <div
    className="lg:px-40 px-6 lg:pt-8 pt-4 bg-[#282C33] w-screen min-h-screen text-white flex flex-col gap-10 lg:gap-16 font-['Fira_Code']">
    <Header />
    <AbsoluteShapes />
    <Banner />
    <Quote />
    <Projects />
    <Skills />
  </div>
