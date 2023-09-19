@react.component
let make = (~title, ~names) =>
  <div className="border border-solid border-[#ABB2BF] flex flex-col w-full">
    <p className="border-b border-solid border-[#ABB2BF] p-2"> {React.string(title)} </p>
    <p className="text-[#ABB2BF] text-s font-light p-2"> {React.string(names)} </p>
  </div>
