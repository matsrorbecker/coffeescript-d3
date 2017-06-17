module.exports = (d3) ->
    WIDTH = 420
    BAR_HEIGHT = 20

    x = d3.scaleLinear()
        .range [0, WIDTH]

    chart = d3.select '.chart'
        .attr 'width', WIDTH

    type = (d) ->
        d.value = +d.value
        d

    d3.csv './data/bar-chart-data.csv', type, (error, data) ->
        if error then throw error
        
        x.domain [0, d3.max(data, (d) -> d.value)]

        chart.attr 'height', BAR_HEIGHT * data.length

        bar = chart.selectAll 'g'
            .data data
            .enter().append 'g'
            .attr 'transform', (d, i) -> "translate(0,#{i * BAR_HEIGHT})"

        bar.append 'rect'
            .attr 'width', (d) -> x(d.value)
            .attr 'height', BAR_HEIGHT - 1

        bar.append 'text'
            .attr 'x', (d) -> x(d.value) - 3
            .attr 'y', BAR_HEIGHT / 2
            .attr 'dy', '.35em'
            .text (d) -> d.value
