@react.component
let make = () =>
  <div className="flex flex-col gap-8 lg:gap-12" id="works">
    <SectionHeader title="projects" lineWidth="32rem" expandPath=Some("/projects") />
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
      <ProjectTile
        className="flex flex-col border border-solid border-secondary"
        thumbnail=Some("/assets/icons/banner-img.png")
        tags="HTML CSS Python Flask"
        title="SomeName"
        description="Small Description"
        link="/someURL"
      />
      <ProjectTile
        className="hidden lg:flex flex-col border border-solid border-secondary"
        thumbnail=Some("/assets/icons/banner-img.png")
        tags="HTML CSS Python Flask"
        title="SomeName"
        description="Small Description"
        link="/someURL"
      />
      <ProjectTile
        className="hidden lg:flex flex-col border border-solid border-secondary"
        thumbnail=Some("/assets/icons/banner-img.png")
        tags="HTML CSS Python Flask"
        title="SomeName"
        description="Small Description"
        link="/someURL"
      />
    </div>
  </div>
