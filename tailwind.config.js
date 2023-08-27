/** @type {import('tailwindcss').Config} */
const colors = require("tailwindcss/colors");
module.exports = {
  content: ["./src/**/*.js"],
  theme: {
    colors: {
      ...colors,
      "primary": "#C778DD"
    }
  },
  plugins: [],
}

