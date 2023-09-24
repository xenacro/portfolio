@react.component
let make = (~isLoading) =>
  <div className="flex-grow flex justify-center items-center">
    <p className="text-center text-secondary text-2xl">
      {isLoading
        ? React.string("Hold On! Data is on it's way...")
        : <>
            {React.string("This isn't coocked yet\u00A0")}
            // <a href="/" className="font-bold text-white"> {React.string("Go Back")} </a>
            <Link to="/" className="font-bold text-white"> {React.string("Go Back")} </Link>
          </>}
    </p>
  </div>
