@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12">
    <ScreenHeader title="about-me" subTitle="Who am I?" />
    <AboutMeBanner />
    <SectionHeader title="skills" lineWidth="0" />
    <div className="grid grid-cols-2 lg:grid-cols-5 gap-4 place-items-center lg:place-items-start">
      <SkillTile title="Language" names="JS PS RS TS" />
      <SkillTile title="Databases" names="MySQL PSQL SQLite MongoDB" />
      <SkillTile
        title="Frameworks"
        names="React Vue Angular Django Flask Haskel Presto React Vue Angular Django Flask Haskel Presto"
      />
      <SkillTile title="Others" names="HTML CSS EJS JSX SCSS Rest" />
      <SkillTile title="Tools" names="VSCode Linux Figma Git Jenkins" />
    </div>
    <SectionHeader title="my-fun-facts" lineWidth="0" />
    <div className="flex justify-between">
      <div className="flex flex-col gap-4">
        <div className="flex gap-4">
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I like winter more than summer")}
          </p>
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I often bike with my friends")}
          </p>
        </div>
        <div className="flex gap-4">
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I like pizza and pasta")}
          </p>
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I was in Egypt, Poland and Turkey")}
          </p>
        </div>
        <div className="flex gap-4">
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("My favorite movie is The Green Mile")}
          </p>
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I am still in school")}
          </p>
        </div>
        <div className="flex gap-4">
          <p className="border border-solid border-secondary text-secondary w-fit p-2">
            {React.string("I like winter more than summer")}
          </p>
        </div>
      </div>
      <img src="/assets/icons/about-doodle.png" className="w-44 h-fit" />
    </div>
  </div>
