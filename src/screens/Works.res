@react.component
let make = (~data: Types.projects) =>
  <div className="flex flex-col gap-8 lg:gap-12 animate-show-up">
    <ScreenHeader title="projects" subTitle="List of my projects" />
    <SectionHeader title="complete-apps" lineWidth="0" />
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
      {data.major
      ->Js.Array2.mapi((project, idx) =>
        <ProjectTile
          className="flex flex-col border border-solid border-secondary"
          thumbnail=Some(project.thumbnail)
          data=project.projectData
          key={idx->Belt.Int.toString}
        />
      )
      ->React.array}
    </div>
    <SectionHeader title="small-projects" lineWidth="0" />
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
      {data.minor
      ->Js.Array2.mapi((project, idx) =>
        <ProjectTile
          className="flex flex-col border border-solid border-secondary"
          data=project
          key={idx->Belt.Int.toString}
        />
      )
      ->React.array}
    </div>
  </div>
