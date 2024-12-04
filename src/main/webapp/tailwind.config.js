/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    './public/**/*.jsp',
    './error/**/*.html',
    './private/**/*.jsp',
    './assets/**/*.js',
    './fragment/**/*.jsp'
  ],
  theme: {
    extend: {
      stroke: ['hover'],
      screens: {
        'tablet-vertical': '1030px'
      }
    },
  },
  plugins: [],
}

