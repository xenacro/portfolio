@react.component
let make = (~title, ~subTitle) =>
  <div className="flex flex-col gap-3">
    <p className="text-3xl">
      <span className="text-primary"> {React.string("/")} </span>
      {React.string(title)}
    </p>
    <p> {React.string(subTitle)} </p>
  </div>
