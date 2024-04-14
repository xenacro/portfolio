@react.component
let make = (~data: Types.skills) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="skills">
    <SectionHeader title="skills" lineWidthClass="w-[16rem]" />
    <div className="flex flex-col lg:flex-row gap-16">
      <img className="hidden lg:block mix-blend-screen" src=data.skills_img />
      <div
        className="grid grid-cols-1 lg:grid-cols-4 gap-4 place-items-center lg:place-items-start">
        <div className="grid grid-cols-1 w-3/5 lg:w-full">
          <SkillTile title="Language" names=data.language />
        </div>
        <div className="grid grid-cols-1 w-4/5 lg:w-full">
          <div className="border border-solid border-secondary flex flex-col w-full h-fit">
            <p className="border-b border-solid border-secondary p-2"> {React.string("CP/DSA")} </p>
            <p className="text-secondary text-s font-light p-2">
              {data.cp_dsa
              ->Js.Array2.mapi((str, idx) =>
                <p key={idx->Belt.Int.toString}> {React.string(str)} </p>
              )
              ->React.array}
            </p>
          </div>
        </div>
        <div className="grid grid-cols-2 lg:grid-cols-1 gap-4 w-[90%] lg:w-full">
          <SkillTile title="Databases" names=data.databases />
          <SkillTile title="Others" names=data.others />
        </div>
        <div className="grid grid-cols-2 lg:grid-cols-1 gap-4 w-full">
          <SkillTile title="Tools" names=data.tools />
          <SkillTile title="Frameworks" names=data.frameworks />
        </div>
      </div>
    </div>
  </div>
