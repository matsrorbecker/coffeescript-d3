d3 = window.d3 = Object.assign {},
    require 'd3',
    require 'd3-scale'

renderBarChart = require './src/bar-chart'

document.addEventListener 'DOMContentLoaded', ->
    renderBarChart d3