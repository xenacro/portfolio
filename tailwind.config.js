/** @type {import('tailwindcss').Config} */
const colors = require("tailwindcss/colors");
module.exports = {
  content: ["./src/**/*.js"],
  theme: {
    colors: {
      ...colors,
      primary: "#C778DD",
      secondary: "#ABB2BF",
    },
    animation: {
      "slide-in-left": "slideInLeft 0.5s ease-out",
      simmer: "simmer 5s cubic-bezier(0.4, 0, 0.6, 1) infinite",
      "show-up": "showUp 0.5s ease-out",
    },
    keyframes: {
      slideInLeft: {
        "0%,20%": { transform: "translateX(-90%)", opacity: "0" },
        "20%,85%": { transform: "translateX(-40%)", opacity: "1" },
        "85%,100%": { transform: "translateX(0)" },
      },
      simmer: {
        "0%,100%": {
          opacity: 1,
        },
        "50%": {
          opacity: 0.8,
        },
      },
      showUp: {
        "0%,20%": {
          opacity: 0.5,
        },
        "20%,100%": {
          opacity: 1,
        },
      },
    },
    listStyleType: {
      square: "square bg-[red]",
    },
  },
  plugins: [],
};
