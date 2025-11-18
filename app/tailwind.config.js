module.exports = {
  content: [
    "./app/views/**/*.{html,erb,slim,haml}",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('preline/plugin'),
  ],
}
