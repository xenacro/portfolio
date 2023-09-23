@react.component
let make = () =>
  <div className="lg:px-40 px-6 py-4 lg:py-8 flex flex-col justify-between gap-12">
    <div className="flex justify-between items-start">
      <div>
        <p>
          {React.string("XeNaCrO\u00A0")}
          <a href="/something" target="_blank" className="text-secondary">
            {React.string("xenacro@email.com")}
          </a>
        </p>
        <p> {React.string("Web Developer and System Architect")} </p>
      </div>
      <div>
        <p className="font-bold text-right"> {React.string("Media")} </p>
        <div className="flex gap-2">
          <a href="/something" target="_blank">
            <img src="/assets/icons/github.svg" className="w-8 h-8" />
          </a>
          <a href="/something" target="_blank">
            <img src="/assets/icons/linkedin.svg" className="w-8 h-8" />
          </a>
          <a href="/something" target="_blank">
            <img src="/assets/icons/github.svg" className="w-8 h-8" />
          </a>
        </div>
      </div>
    </div>
    <div className="flex justify-center">
      {React.string("© Copyright 2023. Made by XeNaCrO")}
    </div>
  </div>