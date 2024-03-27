@react.component
let make = () =>
  <div className="grid grid-cols-1 lg:grid-cols-2 gap-5 items-center">
    <div className="flex flex-col gap-6">
      <p className="text-3xl leading-8 text-white font-semibold whitespace-pre-line">
        {React.string("XeNaCrO is a")}
        <span className="text-primary"> {React.string("\u00A0 Web Developer \u00A0")} </span>
        {React.string("and")}
        <span className="text-primary"> {React.string("\u00A0 System Architect")} </span>
      </p>
      <p className="text-base leading-5 text-secondary">
        {React.string("He crafts responsive websites where technologies meet creativity")}
      </p>
      <Link
        to="#contacts"
        className="border border-solid border-primary font-medium text-base leading-5 px-4 py-2 w-40 hover:border-[#af5ec6] text-center">
        {React.string("Contact me !!")}
      </Link>
    </div>
    <div className="flex-grow flex flex-col gap-0 items-center">
      <img src="/assets/icons/banner-img.png" className="w-full" />
      <p
        className="text-center text-secondary before:content-[''] before:bg-primary before:w-4 before:h-4 before:rounded-none before:inline-block before:leading-8 before:mr-2 before:align-middle flex items-center justify-start border border-solid border-secondary p-2 w-full lg:w-4/5">
        {React.string("Currently working on ")}
        <span className="text-white font-bold"> {React.string("\u00A0 Portfolio")} </span>
      </p>
    </div>
  </div>
