@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <Banner />
    <Quote />
    <Projects />
    <Skills />
    <About />
    <Contacts />
  </div>
