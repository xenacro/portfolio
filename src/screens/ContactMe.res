@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12">
    <ScreenHeader title="contacts" subTitle="Where am I?" />
    <ContactMeBanner />
    <SectionHeader title="all-media" lineWidth="0" />
    <div className="flex justify-between">
      <div className="flex gap-4 items-start">
        <div className="flex gap-1 justify-center items-center">
          <img src="assets/icons/github.svg" className="w-8 h-8" />
          <a href="/somelink" className="text-secondary"> {React.string("@xenacro")} </a>
        </div>
        <div className="flex gap-1 justify-center items-center">
          <img src="assets/icons/github.svg" className="w-8 h-8" />
          <a href="/somelink" className="text-secondary"> {React.string("@xenacro")} </a>
        </div>
      </div>
      <div className="border border-solid border-secondary max-w-[15rem] p-4 flex flex-col gap-4">
        <p> {React.string("Support me here")} </p>
        <div className="flex gap-1 text-secondary place-items-center">
          <img src="/assets/icons/github.svg" className="w-8 h-8" />
          <a href="/redirect" target="_blank" className="hover:text-white">
            {React.string("xenacro")}
          </a>
        </div>
      </div>
    </div>
  </div>
