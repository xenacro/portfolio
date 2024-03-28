@react.component
let make = (~data: Types.projects) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="works">
    <SectionHeader title="projects" lineWidth="32rem" expandPath=Some("/projects") />
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
      {data.major
      ->Js.Array2.slice(~start=0, ~end_=3)
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
  </div>
