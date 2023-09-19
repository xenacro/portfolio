@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12" id="works">
    <SectionHeader title="skills" lineWidth="16rem" />
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
      <img className="hidden lg:block p-8" src="/assets/icons/banner-img.png" />
      <div
        className="grid grid-cols-1 lg:grid-cols-3 gap-4 place-items-center lg:place-items-start">
        <div className="grid grid-cols-1 w-3/5 lg:w-full">
          <SkillTile title="Language" names="JS PS RS TS" />
        </div>
        <div className="grid grid-cols-2 lg:grid-cols-1 gap-4 w-[90%] lg:w-full">
          <SkillTile title="Databases" names="MySQL PSQL SQLite MongoDB" />
          <SkillTile title="Others" names="HTML CSS EJS JSX SCSS Rest" />
        </div>
        <div className="grid grid-cols-2 lg:grid-cols-1 gap-4 w-full">
          <SkillTile title="Tools" names="VSCode Linux Figma Git Jenkins" />
          <SkillTile
            title="Frameworks"
            names="React Vue Angular Django Flask Haskel Presto React Vue Angular Django Flask Haskel Presto"
          />
        </div>
      </div>
    </div>
  </div>
