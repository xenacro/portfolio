@react.component
let make = (~showFull=true) => <>
  <div
    className="absolute top-[42rem] right-0 w-6 lg:w-20 h-12 lg:h-24 border border-solid border-secondary border-r-0 opacity-60 lg:opacity-100"
  />
  <div
    className="absolute top-[60rem] left-0 w-6 lg:w-20 h-12 lg:h-24 grid grid-cols-2 p-1 opacity-60 lg:opacity-100">
    {Belt.Array.make(6, 0)
    ->Js.Array2.mapi((_, idx) =>
      <div key={idx->Belt.Int.toString} className="w-1 h-1 bg-secondary rounded-full" />
    )
    ->React.array}
  </div>
  {showFull
    ? <>
        <div
          className="absolute top-[133rem] left-0 w-4 lg:w-20 h-12 lg:h-24 border border-solid border-secondary border-l-0 opacity-60 lg:opacity-100"
        />
        <div
          className="absolute top-[144rem] right-0 w-20 h-24 grid grid-cols-4 place-items-end p-1 opacity-60 lg:opacity-100">
          {Belt.Array.make(20, 0)
          ->Js.Array2.mapi((_, idx) =>
            <div key={idx->Belt.Int.toString} className="w-1 h-1 bg-secondary rounded-full" />
          )
          ->React.array}
        </div>
        <div
          className="absolute top-[169rem] left-0 w-6 lg:w-20 h-12 lg:h-24 grid grid-cols-3 p-1 opacity-60 lg:opacity-100">
          {Belt.Array.make(15, 0)
          ->Js.Array2.mapi((_, idx) =>
            <div key={idx->Belt.Int.toString} className="w-1 h-1 bg-secondary rounded-full" />
          )
          ->React.array}
        </div>
      </>
    : React.null}
</>
