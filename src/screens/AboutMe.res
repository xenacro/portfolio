module FunFact = {
  @react.component
  let make = (~text) =>
    <p className="border border-solid border-secondary text-secondary w-fit p-2">
      {React.string(text)}
    </p>
}

module FunFacts = {
  @react.component
  let make = (~first, ~second) =>
    <div className="flex gap-4">
      <FunFact text=first />
      <UiUtils.RenderOptional data=second logic={text => <FunFact text />} />
    </div>
}

@react.component
let make = (~skills: option<Types.skills>, ~data: Types.aboutMe) =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <ScreenHeader title="about-me" subTitle="Who am I?" />
    <AboutMeBanner intro=data.intro aboutImg=data.about_img />
    <SectionHeader title="skills" lineWidthClass="w-0" />
    <UiUtils.RenderOptional
      data=skills
      logic={skills =>
        <div
          className="grid grid-cols-2 lg:grid-cols-6 gap-4 place-items-center lg:place-items-start">
          <SkillTile title="Language" names=skills.language />
          <div className="border border-solid border-secondary flex flex-col w-full h-fit">
            <p className="border-b border-solid border-secondary p-2"> {React.string("CP/DSA")} </p>
            <p className="text-secondary text-s font-light p-2">
              {skills.cp_dsa
              ->Js.Array2.mapi((str, idx) =>
                <p key={idx->Belt.Int.toString}> {React.string(str)} </p>
              )
              ->React.array}
            </p>
          </div>
          <SkillTile title="Databases" names=skills.databases />
          <SkillTile title="Frameworks" names=skills.frameworks />
          <SkillTile title="Others" names=skills.others />
          <SkillTile title="Tools" names=skills.tools />
        </div>}
    />
    <SectionHeader title="my-fun-facts" lineWidthClass="w-0" />
    <div className="flex justify-between">
      <div className="flex flex-col gap-4">
        {data.fun_facts
        ->Belt.List.fromArray
        ->CustomUtils.getTupleArr([], _)
        ->Js.Array2.mapi(((first, second), idx) =>
          <FunFacts first second key={idx->Belt.Int.toString} />
        )
        ->React.array}
      </div>
      <img src="/assets/icons/about-doodle.png" className="w-0 lg:w-44 h-fit" />
    </div>
  </div>
