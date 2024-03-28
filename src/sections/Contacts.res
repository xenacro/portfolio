@react.component
let make = (~data: Types.contactMe) =>
  <div className="flex flex-col gap-8 lg:gap-12" id="contacts">
    <SectionHeader title="contacts" lineWidth="12rem" expandPath=Some("/contacts") />
    <ContactMeBanner data />
  </div>
