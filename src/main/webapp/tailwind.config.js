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
        "femisalud": {
          100: '#f0f8fb',
          300: '#cee8f9',
          400: '#91BEE1',
          600: '#006eb6',
          900: '#11568f'
        },
        "lavender": {
          400: '#d9c4e1'
        },
        "verde": {
          400: '#4fb600'
        }
      },
      backgroundColor: theme => ({
        ...theme('colors'),
      }),
      keyframes: {
        'confetti-fall': {
          '0%': { transform: 'translateY(-100vh)' },
          '100%': { transform: 'translateY(100vh)' },
        },
      },
      animation: {
        'confetti-fall': 'confetti-fall 2s linear infinite',
      },
    },
  },
  plugins: [
    require('flowbite/plugin')
  ],
}
