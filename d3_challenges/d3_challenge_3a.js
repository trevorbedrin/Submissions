// TRANSITIONS

// 3a. BUTTONS
// **************************************************************************

// CHALLENGE: 
// Make an svg that is 400 pixels tall and 500 wide. 
// Append a g element called main_g and translate it using margin top and left

var margin = {'top':20,'bottom':50,'left':50,'right':100};
var h = 400 - margin.bottom - margin.top;
var w = 500 - margin.left - margin.right;

svg = d3.select('#challenge_3a').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
	.style('border','2px dotted lavender')

main_g = svg.append('g')
     .attr('transform','translate(' + margin.left + ',' + margin.top + ')');


// let's make some buttons. 
var button_data = ['one','two','three','four','five']
button_data = button_data.map(function(d,i){return {num:i+1,name:d}})
console.log(button_data)

var button_padding = 10;
var button_height = 50;
var button_width = margin.right - button_padding;

// you might have wondered why the right margin was so big. well, now we can jam
// some buttons over there.

// CHALLENGE:
// Make a 'g' called `button_g` that is appended to svg. 
// Translate it over w + margin.left and down margin.top
// Give it the class 'button_g'
var button_g = svg.append('g')
     .attr('transform','translate(' + (w + margin.left) + ',' + margin.top + ')')
     .attr('class','button_g');



// CHALLENGE: 
// Add a g for each button selectingAll the g's in button_g and binding them to the 
// data button_data. 
// Enter and append the 'g's, and I've done the translate to space out the buttons.
var buttons = button_g.selectAll('g')
	.data(button_data)
	.enter()
	.append('g')
    .attr('transform',function(d,i) {
		return 'translate(0,' + i*(button_height + button_padding)  + ')'})

// CHALLENGE: 
// Add rects to the g's in buttons. 
// give them height and width (hint: check out the variables above), and give them 
// the class 'button'
buttons.append('rect')
	.attr('height', button_height)
	.attr('width', button_width)
	.attr('class', 'button');


// I'll add the labels. 
// CHALLENGE: mess around with the text-anchor (other choices are 'start' and 'end'
// and the dy attributes to see what they do.
buttons.append('text')
    .attr('x',button_width/2)
    .attr('y',button_height/2)
    .attr('dy','-.8em')
    .attr('text-anchor','start')
    .text(function(d){return d.name})


// scale and axis
var main_data = [3]
var y = d3.scale.linear().domain([0,5]).range([h,0])
var x = d3.scale.ordinal().domain(['amount']).rangeBands([0,w],0.2)

// CHALLENGE:
// create the yAxis. specify .ticks(4)
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
    .ticks(4)


// CHALLENGE:
// Add the axis to the viz by appending a g to main_g. 
// Give it the class 'y axis' and call yAxis
//main_g.append('g').attr('class','y axis').call(yAxis)

main_g.append('g')
	.attr('class', 'y axis')
	.call(yAxis)
	
// now I'll fill in our graph. everything look ok? 
var amount_rect = main_g.selectAll('rect')
    .data(main_data)
    .enter().append('rect')
    .attr('x', x('amount'))
    .attr('width',x.rangeBand())
    .attr('y',function(d) { return y(d); })
    .attr('height',function(d) { return h - y(d); })


// FINALLY, let's click and transition.

var update_amount = function() {

    new_amount = d3.select(this).attr('num')

//...
    // CHALLENGE:
    // Use console.log to figure out how to get the numerical value 
    // when the button is clicked.
    console.log('new_amount = ',new_amount)

    // this is where the transition happens.
    amount_rect
	.data([new_amount]) // bind new data to the selection
	.transition().duration(750) // tell it to transition to something and how long to take
	.attr('y',function(d){return y(d);}) // tell it what to change
	.attr('height',function(d){return h-y(d)}); // etc.

}

// this binds the listener to the button. click a button and see if your graph updates!
buttons.on('click',update_amount)

