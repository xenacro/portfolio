@react.component
let make = (~title, ~names) =>
  <div className="border border-solid border-secondary flex flex-col w-full h-fit">
    <p className="border-b border-solid border-secondary p-2"> {React.string(title)} </p>
    <p className="text-secondary text-s font-light p-2"> {React.string(names)} </p>
  </div>
