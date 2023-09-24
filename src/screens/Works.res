@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <ScreenHeader title="projects" subTitle="List of my projects" />
    <SectionHeader title="complete-apps" lineWidth="0" />
    <div className="grid grid-cols-3 gap-4">
      {Belt.Array.make(5, 0)
      ->Js.Array2.mapi((_, idx) =>
        <ProjectTile
          className="flex flex-col border border-solid border-secondary"
          thumbnail=Some("/assets/icons/banner-img.png")
          tags="HTML CSS Python Flask"
          title="SomeName"
          description="Small Description"
          link="/someURL"
          key={Belt.Int.toString(idx)}
        />
      )
      ->React.array}
    </div>
    <SectionHeader title="small-projects" lineWidth="0" />
    <div className="grid grid-cols-3 gap-4">
      {Belt.Array.make(8, 0)
      ->Js.Array2.mapi((_, idx) =>
        <ProjectTile
          className="flex flex-col border border-solid border-secondary"
          tags="HTML CSS Python Flask"
          title="SomeName"
          description="Small Description"
          link="/someURL"
          key={Belt.Int.toString(idx)}
        />
      )
      ->React.array}
    </div>
  </div>
