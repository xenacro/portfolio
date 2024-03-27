@react.component
let make = (~className="", ~href, ~children) => {
  <a href className={`hover:cursor-pointer ${className}`} target="_blank"> children </a>
}
