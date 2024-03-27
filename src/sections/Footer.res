@react.component
let make = () =>
  <div className="lg:px-40 px-6 py-4 lg:py-8 flex flex-col justify-between gap-12">
    <div className="flex justify-between items-start">
      <div>
        <p>
          {React.string("XeNaCrO\u00A0")}
          <ExternalLink href="mailto:kayush054@gmail.com" className="text-secondary">
            {React.string("kayush054@gmail.com")}
          </ExternalLink>
        </p>
        <p> {React.string("Web Developer and System Architect")} </p>
      </div>
      <div>
        <p className="font-bold text-right"> {React.string("Media")} </p>
        <div className="flex gap-2">
          <ExternalLink href="https://github.com/xenacro">
            <img src="/assets/icons/github.svg" className="w-8 h-8" />
          </ExternalLink>
          <ExternalLink href="https://www.linkedin.com/in/xenacro/">
            <img src="/assets/icons/linkedin.svg" className="w-8 h-8" />
          </ExternalLink>
          <ExternalLink href="https://github.com/xenacro">
            <img src="/assets/icons/github.svg" className="w-8 h-8" />
          </ExternalLink>
        </div>
      </div>
    </div>
    <div className="flex justify-center">
      {React.string("© Copyright 2023. Made by XeNaCrO")}
    </div>
  </div>
