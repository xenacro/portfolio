@react.component
let make = () =>
  <div className="flex flex-col lg:flex-row justify-between gap-16">
    <p className="max-w-lg text-secondary">
      {React.string(
        "I'm interested in freelance opportunities. However, if you have other request or question, don't hesitate to contact me",
      )}
    </p>
    <div className="border border-solid border-secondary max-w-[15rem] p-4 flex flex-col gap-4">
      <p> {React.string("Message me here")} </p>
      <div className="flex gap-1 text-secondary place-items-center">
        <img src="/assets/icons/github.svg" className="w-8 h-8" />
        <a href="/redirect" target="_blank" className="hover:text-white">
          {React.string("xenacro")}
        </a>
      </div>
      <div className="flex gap-1 text-secondary place-items-center">
        <img src="/assets/icons/github.svg" className="w-8 h-8" />
        <a href="/redirect" target="_blank" className="hover:text-white">
          {React.string("kayush054@gmail.com")}
        </a>
      </div>
    </div>
  </div>
