@react.component
let make = (~data: Types.contactMe) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="contacts">
    <SectionHeader
      title="contacts"
      lineWidthClass="w-[6rem] lg:w-[12rem]"
      expandPath=Some(External.getPageLink("contacts"))
    />
    <ContactMeBanner data />
  </div>
