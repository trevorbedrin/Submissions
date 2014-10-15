// BINDING DATA TO SELECTIONS

// 2a. SCATTERPLOT
// **************************************************************************
// start off by stealing the code we used at the end of challenge 1 to create the svg and axes.
var margin = {'bottom':30,'top':20,'left':30,'right':20}
var h = 400 - margin.bottom - margin.top;
var w = 400 - margin.left - margin.right;

var svg = d3.select('#challenge_2a').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
    .style('border','2px dotted gray')
  .append('g')
    .attr('transform','translate(' + margin.left + ',' + margin.top + ')');

var y = d3.scale.linear()
    .domain([h,0])
    .range([0,h])
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
svg.append('g')
    .attr('class','y axis')
    .call(yAxis);

var x = d3.scale.linear()
    .domain([0,w])
    .range([0,w])
var xAxis = d3.svg.axis()
    .scale(x)
    .orient('bottom')
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,' + h + ')')
    .call(xAxis);


// Now let's plot some data. 
var data1 = [[20,40],[85,115],[110,120],[175,210],[220,255],[295,315],[305,335]];

// To do this we bind the data to something called a 'selection.'
// We are going to start with a scatter plot, which means the data will be bound to 
// cirle elements in the svg with the function data().
// The weird part is that usually when you bind the data to the circles in the svg,
// there aren't actually any circles in the svg.


// Uncomment the steps one at a time and refresh the page to understand how it works.
// 1. make the initial selection
var circles = svg.selectAll('circle');
console.log('circles',circles);



// // 2. bind the data
circles = circles.data(data1);
console.log('circles after data',circles);


// // 3. use enter() to choose the elements of the selection that now have data 
// // but don't exist in the DOM yet (that's all of them.) 
circles = circles.enter();
console.log('enter',circles);

// // You would similarly use exit() to choose the elements that already exist
// // but don't have any data (say if you selected 10 existing circles and bound them to 
// // data with 7 elements). 
// // In that case, the 3 extra circles would be the exit() selection, 
// // the enter() selection would be empty, and the 7 circles that had data to bind to
// // would be called the update() selection.


// // 4. for each member of enter(), append a circle
circles = circles.append('circle');
// // now if you check the DOM you'll see 5 circles with no attributes


// // 5. changing an attribute of `circles` changes that attribute for each element of the selection.
circles.attr('r',3);
// // check the DOM to see this attribute has appeared


// // 6. the data for each element can be accessed using inline anonymous functions. 
// // the convention is to use the variable d.
circles
    .attr('cx',function(d) { return x(d[0]); })
    .attr('cy',function(d) { return y(d[1]); });


// // 7. adding a class allows the circles to be styled in the css file.
circles.attr('class','scatter');


// CHALLENGE:
// Is the graph correct? Do the plotted points match the data? If not, how can this be corrected?  
//			They do not match.  The scale needs to be applied.						

// // This is how it's usually written, all together:
// var circles = svg.selectAll('circle')
//     .data(data1)
//     .enter().append('circle')
//     .attr('r',3)
//     .attr('cx',function(d) { return x(d[0]); })
//     .attr('cy',function(d) { return y(d[1]); })
//     .attr('class','scatter');


// 2b. ADJUSTING SCALES TO DATA
// **************************************************************************
// In the previous example I cheated a bit by giving you data that was in the 
// general range of the axes we already created,
// which were just based on the pixels of the SVG. 
// Normally the domains of the scales have to be adjusted to fit the data.  
var data2 = data1.map(function(d){
    return { x: Math.floor(d[0]*Math.random()*7),
	     y: Math.floor(d[1]*Math.random()*11),
	   }
});

// CHALLENGE: 
// Make a scatter plot of data2. 
// Adjust the domains of the x and y axis to fit the data. 
// Hint: use d3.max(array,key()) to find the max value of x and y. 

max_x = d3.max(data2, function(d) { return +d['x'];})
max_y = d3.max(data2, function(d) { return +d['y'];})

console.log('max_x',max_x)
console.log('max_y',max_y)

var margin = {'bottom':30,'top':20,'left':40,'right':20}

var svg = d3.select('#challenge_2b').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
    .style('border','2px dotted gray')
  .append('g')
    .attr('transform','translate(' + margin.left + ',' + margin.top + ')');

var y = d3.scale.linear()
    .domain([max_y,0])
    .range([0,h])
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
svg.append('g')
    .attr('class','y axis')
    .call(yAxis);

var x = d3.scale.linear()
    .domain([0, max_x])
    .range([0,w])
var xAxis = d3.svg.axis()
    .scale(x)
    .orient('bottom')
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,' + h + ')')
    .call(xAxis);

var circles = svg.selectAll('circle')
    .data(data2)
    .enter().append('circle')
    .attr('r',3)
    .attr('cx',function(d) { return x(d['x']); })
    .attr('cy',function(d) { return y(d['y']); })
    .attr('class','scatter');


// **************************************************************************


// 2c. LINE GRAPH
// **************************************************************************
// CHALLENGE: 
// Make a line graph of data2. 

data2.sort(function(a, b) { return a.x - b.x; });

max_x = d3.max(data2, function(d) { return +d['x'];})
max_y = d3.max(data2, function(d) { return +d['y'];})

var margin = {'bottom':30,'top':20,'left':40,'right':20}

var line = d3.svg.line()
    .x(function(d) { return x(d.x); })
    .y(function(d) { return y(d.y); });
    
var svg = d3.select('#challenge_2c').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
    .style('border','2px dotted gray')
  .append('g')
    .attr('transform','translate(' + margin.left + ',' + margin.top + ')');

var y = d3.scale.linear()
    .domain([max_y,0])
    .range([0,h])
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
svg.append('g')
    .attr('class','y axis')
    .call(yAxis);

var x = d3.scale.linear()
    .domain([0, max_x])
    .range([0,w])
var xAxis = d3.svg.axis()
    .scale(x)
    .orient('bottom')
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,' + h + ')')
    .call(xAxis);

svg.append("path")
   .datum(data2)
   .attr("class", "line")
   .attr("d", line);


// **************************************************************************


// 2d. BAR GRAPH
// **************************************************************************
// OPTIONAL CHALLENGE: 
// Make a bar graph of data3.
// Use d3.scale.ordinal() to make a categorical axis and d3.rangeBands(data3.length) for 
// the domain. Check the d3 API for more information on the usage.

categories = ['cat','dog','bunny','pig','owl','frog','hen'];

var data3 = data2.map(function(d,i){
    d.y = d.y;
    d.category = categories[i];
    return d;
});

// HINT: append and transform a 'g' element for each bar. 

var margin = {'bottom':30,'top':20,'left':40,'right':20}
    
var svg = d3.select('#challenge_2d').append('svg')
    .attr('height',h + margin.bottom + margin.top)
    .attr('width',w + margin.left + margin.right)
    .style('border','2px dotted gray')
  .append('g')
    .attr('transform','translate(' + margin.left + ',' + margin.top + ')');

var y = d3.scale.linear()
    .domain([max_y,0])
    .range([0,h])
var yAxis = d3.svg.axis()
    .scale(y)
    .orient('left')
svg.append('g')
    .attr('class','y axis')
    .call(yAxis);

x = d3.scale.ordinal()
	.domain(data3.map(function (d) { return d.category; }))
    .rangeRoundBands([0, w], .15);
 
var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");
  	
svg.append('g')
    .attr('class','x axis')
    .attr('transform','translate(0,' + h + ')')
    .call(xAxis);

var animals = svg.selectAll(".animal")
	.data(data3)
	.enter()
	.append("g")
	.attr("transform", function(d) { return "translate(" + x(d.category) + ",0)"; })
	.append("rect")
    .attr("y", function(d) { return h - y(d.y); })
	.attr("width", x.rangeBand())
	.attr("height", function(d) { return y(d.y); })
	.attr("class", "bar");
	
// console.log(data3);




// PREVIEW:
// 2e. G ELEMENTS, NESTED DATA, GROUPED BAR CHART
// **************************************************************************
// make a nested bar graph that groups the mta data into boroughs and plots a bar
// for each station



