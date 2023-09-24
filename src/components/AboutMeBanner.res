@react.component
let make = (~completeLink=None) =>
  <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
    <div className="text-secondary flex flex-col gap-4">
      <p> {React.string("Hello, I'm Xenacro!")} </p>
      <p>
        {React.string(
          "I'm a self-taught front-end developer based in Kyiv, Ukraine. I can develop responsive websites from scratch and raise them into modern user-friendly web experiences. ",
        )}
      </p>
      <p>
        {React.string(
          "Transforming my creativity and knowledge into a websites has been my passion for over a year. I have been helping various clients to establish their presence online. I always strive to learn about the newest technologies and frameworks.",
        )}
      </p>
      {completeLink->Belt.Option.mapWithDefault(React.null, href =>
        // <a href className="border border-solid border-primary px-4 py-2 w-fit">
        //   {React.string("Read more \u21DD")}
        // </a>
        <Link to=href className="border border-solid border-primary px-4 py-2 w-fit">
          {React.string("Read more \u21DD")}
        </Link>
      )}
    </div>
    <img className="hidden lg:block" src="/assets/icons/banner-img.png" />
  </div>
