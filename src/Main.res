%%raw(`import "./styles/tailwind.css"`)

let initReactApp = (. ()) =>
  switch ReactDOM.querySelector("#root") {
  | Some(rootElement) =>
    let root = ReactDOM.Client.createRoot(rootElement)
    ReactDOM.Client.Root.render(root, <AppWrapper />)
  | None => Js.log("No id named root in index.html")
  }

initReactApp(.)
