@react.component
let make = (~data: Types.skills) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="skills">
    <SectionHeader title="skills" lineWidth="16rem" />
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
      <img className="hidden lg:block" src=data.skills_img />
      <div
        className="grid grid-cols-1 lg:grid-cols-3 gap-4 place-items-center lg:place-items-start">
        <div className="grid grid-cols-1 w-3/5 lg:w-full">
          <SkillTile title="Language" names=data.language />
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
