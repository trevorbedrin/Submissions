
// 1a. SVG & G ELEMENTS
// **************************************************************************
// Use d3.select() and a css selector to select the div with id 'challenge_1a' 
// and append an svg element to it.

var svg = d3.select('#challenge_1a')
			.append('svg')
		
// CHALLENGE:
// Use .attr() to set the width and the height to 400x400 px.
			.attr('width', 400)
			.attr('height', 400)

// You can always check the positioning and size of your svg by giving it a border.
svg.style('border','3px solid orange')


// You can also see where the corners are by drawing some circles.
svg.append('circle')
    .attr('cx',0)
    .attr('cy',0)
    .attr('r',30)
    .attr('class','svg_corners')

//the circles are only visible where they appear within the svg

    
// CHALLENGE:
// add circles at the other three corners and in the center.
// how was the color of the circle determined?

svg.append('circle')
    .attr('cx',400)
    .attr('cy',0)
    .attr('r',30)
    .attr('class','svg_corners')
    
svg.append('circle')
    .attr('cx',0)
    .attr('cy',400)
    .attr('r',30)
    .attr('class','svg_corners')
    
svg.append('circle')
    .attr('cx',400)
    .attr('cy',400)
    .attr('r',30)
    .attr('class','svg_corners')        

svg.append('circle')
    .attr('cx',200)
    .attr('cy',200)
    .attr('r',30)
    .attr('class','svg_corners')
    
// The color is determined by the css class    

// Now add a g element. g elements are awesome, so let's get familiar right away.

var g = svg.append('g').attr('transform','translate(25,5)')

// draw circles in the corners again.
// to make this simpler, I am going to draw the circles by binding data to 
// a selection of elements. we'll walk through this in the next one.
var corners = [[0,0],[400,0],[0,400],[400,400],[200,200]]


g.selectAll('circle').data(corners).enter().append('circle')
    .attr('cx',function(d){return d[0]})
    .attr('cy',function(d){return d[1]})
    .attr('r',30)
    .attr('class','g_corners')

// CHALLENGE:
// Change the amount and direction of the "transform","translate" values.
// Which value is specified for x and which is y? 
//			(x, y)
// Do positive values move the g element left or right? Up or down? 
//			+x = left; +y = down
//**************************************************************************



// 1b. X AXIS
// **************************************************************************
// x axis is simpler so let's start there.

// first let's make a new svg

// CHALLENGE: 
// Make `var svg` by selecting the div #challenge_1b and appending an svg. 
// Give it height h and width w and style the border to be '3px solid navy'.

var h = 400;
var w = 400;

// var svg = ...
var svg = d3.select('#challenge_1b')
			.append('svg')
			.attr('height', h)
			.attr('width', w)

// CHALLENGE: 
// Make `var x` a linear scale with domain and range equal to [0,w]
// Make `var xAxis` with scale of x and orient 'bottom'

// var x = ...
var x = d3.scale.linear()
		.domain([0,w])
		.range([0,w])

// var xAxis = ... 
var xAxis = d3.svg.axis()
		.scale(x)
		.orient("bottom");


// We can add the axis to the svg by appending a new g element and calling 
// the axis we just defined.  
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,'+(h-30)+')')
    .call(xAxis);

// CHALLENGE: 
// Why did we translate the axis g (h-30) pixels? 
//			So the labels would be visible
// What happens if we just use h?
//			You see just a line because the labels are off the SVG
// **************************************************************************


// 1c. MARGINS
// **************************************************************************
// The previous x axis ran off the edges. 
// This is why bostock always does that margin thing. 

var margin = {'bottom':30,'top':20,'left':30,'right':20}
var h = 400 - margin.bottom - margin.top;
var w = 400 - margin.left - margin.right;

// We've chosen 400 x 400 for the coverage of the entire SVG.
// The plottable area will be some size smaller than that, determined by the margins we cut off.
// The variables h and w will correspond to the height and width of just the plottable area. 
// This will be convenient later.

// CHALLENGE:
// Set the height and width of the svg, using the variables above, to be 400 x 400
// Transform the g element over "margin left" pixels and down "margin top" pixels.
var svg = d3.select('#challenge_1c').append('svg')

//    .attr('height',...
		.attr('height', h + margin.top + margin.bottom)

//    .attr('width',...
		.attr('width', w + margin.left + margin.right)

    .style('border','3px solid teal')
  .append('g')
//    .attr('transform','translate(...
		.attr('transform','translate(' + margin.left + ',' + margin.top + ')')

// CHALLENGE: 
// What does the variable svg refer to? Why?
//			svg refers to the function declaration that creates the full canvas including 
//			margins and the single translated group.  

// CHALLENGE: 
// Create the x scale and xAxis as above.
// Append a g element, transform it, and call the x axis. 
// What value should you use to translate the g?
//			The bottom margin
// Hint: this is one of the times when the 'margin trick' pays off.

// var x = ...
var x = d3.scale.linear()
		.domain([0,w])
		.range([0,w])

// var xAxis = ... 
var xAxis = d3.svg.axis()
		.scale(x)
		.orient("bottom");

// svg.append('g')...
g = svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,'+(h)+')')
    .call(xAxis);
    
// CHALLENGE: 
// Check your axis by appending a circle to g. Give it attr's for cx,cy,&r.
// Does it match up with the axis?

g.append('circle')
    	.attr('cx',50)
    	.attr('cy',0)
    	.attr('r',30)
    	.attr('class','svg_corners');        


// **************************************************************************



// 1d. Y AXIS
// **************************************************************************
// // let's try the same for y axis 
var svg = d3.select('#challenge_1d').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
    .style('border','3px solid teal')
  .append('g')
    .attr('transform','translate(' + margin.left + ',' + margin.top + ')');

var y = d3.scale.linear()
    .domain([0,h])
    .range([h,0])
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')

svg.append('g')
    .attr('class','y axis')
    .call(yAxis);
    
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,'+(h)+')')
    .call(xAxis);    

// CHALLENGE: 
// What is wrong with the y axis?
//			The scale of the axis is reversed
// Change the range of y() to fix it. 
// Add the x axis as well as the y to this svg. 
// Plot some circles to check that your coordinates and axes match.

svg.append('circle')
    .attr('cx',x(150))
    .attr('cy',x(123))
    .attr('r',23)

svg.append('circle')
    .attr('cx',x(53))
    .attr('cy',x(176))
    .attr('r',30)
    
svg.append('circle')
    .attr('cx',x(254))
    .attr('cy',x(112))
    .attr('r',15)

// Remember that you have to use the same scale to transform the elements you plot that 
// you used to create the axes. 
// For this example, though, you can get away with .attr('cx',50) instead of .attr('cx',x(50)). 
// Why does this come out the same?
//			Because the range is equal to the domain




