<%-- 
    Document   : flotr ee 2
    Created on : 20/11/2013, 07:16:26 PM
    Author     : servidor
--%>
<head>

<style type="text/css">

body {

margin: 0px;

padding: 0px;

}

#container {

width : 600px;

height: 384px;

margin: 8px auto;

}

</style>

</head>

<body>

<div id="container">

<!--[if lt IE 9]>

<script type="text/javascript" src="/static/lib/FlashCanvas/bin/flashcanvas.js"></script>

<![endif]-->

<script type="text/javascript" src="../jquery/graficas-Flotr2-master/flotr2.min.js"></script>

<script type="text/javascript">

(function () {

var container = document.getElementById('container'),start = (new Date).getTime(),data, graph, offset, i;

// Draw a sine curve at time t

function animate (t) {

data = [];

offset = 2 * Math.PI * (t - start) / 10000;

// Sample the sine function

for (i = 0; i < 4 * Math.PI; i += 0.2) {

data.push([i, Math.sin(i - offset)]);

}

// Draw Graph

graph = Flotr.draw(container, [ data ], {

yaxis : {

max : 2,

min : -2

}

});

// Animate

setTimeout(function () {

animate((new Date).getTime());

}, 50);

}

animate(start);

})();
///////////
(function download_image(container) {

  var
    d1 = [],
    d2 = [],
    d3 = [],
    d4 = [],
    d5 = [],
    graph,
    i;
  
  for (i = 0; i <= 10; i += 0.1) {
    d1.push([i, 4 + Math.pow(i,1.5)]);
    d2.push([i, Math.pow(i,3)]);
    d3.push([i, i*5+3*Math.sin(i*4)]);
    d4.push([i, i]);
    if( i.toFixed(1)%1 == 0 ){
      d5.push([i, 2*i]);
    }
  }

  // Draw the graph
  graph = Flotr.draw(
    container,[ 
      {data:d1, label:'y = 4 + x^(1.5)', lines:{fill:true}}, 
      {data:d2, label:'y = x^3', yaxis:2}, 
      {data:d3, label:'y = 5x + 3sin(4x)'}, 
      {data:d4, label:'y = x'},
      {data:d5, label:'y = 2x', lines: {show: true}, points: {show: true}}
    ],{
      title: 'Download Image Example',
      subtitle: 'You can save me as an image',
      xaxis:{
        noTicks: 7, // Display 7 ticks.
        tickFormatter: function(n){ return '('+n+')'; }, // => displays tick values between brackets.
        min: 1,  // => part of the series is not displayed.
        max: 7.5, // => part of the series is not displayed.
        labelsAngle: 45,
        title: 'x Axis'
      },
      yaxis:{
        ticks: [[0, "Lower"], 10, 20, 30, [40, "Upper"]],
        max: 40,
        title: 'y = f(x)'
      },
      y2axis:{color:'#FF0000', max: 500, title: 'y = x^3'},
      grid:{
        verticalLines: false,
        backgroundColor: 'white'
      },
      HtmlText: false,
      legend: {
        position: 'nw'
      }
  });

  this.CurrentExample = function (operation) {

    var
      format = $('#image-download input:radio[name=format]:checked').val();
    if (Flotr.isIE && Flotr.isIE < 9) {
      alert(
        "Your browser doesn't allow you to get a bitmap image from the plot, " +
        "you can only get a VML image that you can use in Microsoft Office.<br />"
      );
    }

    if (operation == 'to-image') {
      graph.download.saveImage(format, null, null, true)
    } else if (operation == 'download') {
      graph.download.saveImage(format);
    } else if (operation == 'reset') {
      graph.download.restoreCanvas();
    }
  };

  return graph;
})(document.getElementById("editor-render-0"));
</script>

</body>

</html>
