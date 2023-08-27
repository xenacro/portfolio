const fs = require("fs");
const content = fs.readFileSync("dist/template.html").toString();

fs.writeFileSync("dist/index.html", content);
