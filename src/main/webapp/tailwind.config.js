/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    "./**/*.{html,jsp}",
    "assets/js/**/*.js",
    "!./node_modules",
    "node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      colors: {
        femisalud: {
          100: '#f0f8fb',
          300: '#cee8f9',
          600: '#006eb6',
          900: '#11568f'
        }
      },
      backgroundColor: {
        femisalud: {
          100: '#f0f8fb',
          300: '#cee8f9',
          600: '#006eb6',
          900: '#11568f'
        }
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}

