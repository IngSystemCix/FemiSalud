/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
      "./src/main/webapp/views/*.xhtml",
      "./src/main/webapp/js/*.js"],
  theme: {
    extend: {
      colors: {
        "femisalud": {
          "225": "#f0f8fb",
          "450": "#cee8f9",
          "675": "#006eb6",
          "900": "#11568f",
        }
      }
    },
  },
  plugins: [
  ],
}

