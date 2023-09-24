@react.component
let make = () =>
  <div className="flex-grow flex justify-center items-center">
    <p className="text-center text-secondary">
      {React.string("This isn't coocked yet\u00A0")}
      <a href="/" className="font-bold text-white"> {React.string("Go Back")} </a>
    </p>
  </div>
