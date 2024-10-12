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
          400: '#91BEE1',
          600: '#006eb6',
          900: '#11568f'
        },
        lavender: {
          400: '#d9c4e1'
        }
      },
      backgroundColor: {
        femisalud: {
          100: '#f0f8fb',
          300: '#cee8f9',
          400: '#91BEE1',
          600: '#006eb6',
          900: '#11568f'
        },
        lavender: {
          400: '#d9c4e1'
        }
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}

