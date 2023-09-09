@react.component
let make = () =>
    <>
        <div className="absolute top-[min(42rem,90vh)] right-0 w-9 lg:w-20 h-12 lg:h-24 border border-solid border-[#ABB2BF] border-r-0"/>
        <div className="absolute top-[min(60rem,90vh)] left-0 w-6 lg:w-20 h-12 lg:h-24 grid grid-cols-2 p-1">
            {Belt.Array.make(6,0)->Js.Array2.mapi((_,idx)=><div key={idx->Belt.Int.toString} className="w-1 h-1 bg-[#ABB2BF] rounded-full"/>)->React.array}
        </div>
    </>