@react.component
let make = () =>
    <div className="pt-6 lg:pt-14 px-6 lg:px-40 flex flex-col text-[1.25rem] items-end gap-0">
        <div className="border border-solid border-[#ABB2BF] p-4 lg:p-8 w-full relative">
            {React.string("With great power comes great electricity bill")}
            <p className="absolute top-[-1.5rem] left-[-1rem] lg:left-3 text-6xl z-10 p-[0.025rem] bg-[#282C33] h-6">{React.string("\u201C")}</p>
            <p className="absolute bottom-[-0.75rem] right-[-1rem] lg:right-3 text-6xl z-10 p-[0.125rem] bg-[#282C33] h-6">{React.string("\u201D")}</p>
        </div>
        <div className="border border-solid border-[#ABB2BF] border-t-0 p-2 lg:p-4 w-40">
            {React.string("- Dr. Who")}
        </div>
    </div>