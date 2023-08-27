/** @type {import('tailwindcss').Config} */
const colors = require("tailwindcss/colors");
module.exports = {
  content: ["./src/**/*.js"],
  theme: {
    colors: {
      ...colors,
      "primary": "#C778DD"
    },
    animation: {
      "slide-in-left": "slideInLeft 0.5s ease-out"
    },
    keyframes: {
      slideInLeft: {
        "0%,20%": { transform: "translateX(-90%)", opacity: "0", },
        "20%,85%": { transform: "translateX(-40%)", opacity: "1" },
        "85%,100%": { transform: "translateX(0)" }
      }
    }
  },
  plugins: [],
}

