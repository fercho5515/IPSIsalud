<%-- 
    Document   : grafica_morris
    Created on : 20/11/2013, 02:45:23 PM
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Grafica</title>
    
     <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
	 
    <title>SIMILE Widgets | Timeplot</title><!--
    <link rel='stylesheet' href='../jquery/graficas_simile/styles.css' type='text/css' />
    <link rel='stylesheet' href='../jquery/graficas_simile/timeplot-bundle.css' type='text/css' />
    <script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
    <script src="../jquery/graficas_simile/timeplot-bundle.js" type="text/javascript"></script> 
    <script type="text/javascript" src="../jquery/graficas_simile/timeplot-api.js"></script>
    <link rel="alternate" type="application/rdf+xml" href="../jquery/graficas_simile/doap.rdf" /> 
     
      <script type="text/javascript" src="../jquery/graficas_simile/timeplot-api.js"></script>   
     <script src="http://api.simile-widgets.org/timeplot/1.1/timeplot-api.js" 
       type="text/javascript"></script>  -->
       
    <script src="../jquery/graficas_simile/timeplot-api.js" type="text/javascript"></script>
    <style type="text/css"></style><script src="../jquery/graficas_simile/simile-ajax-api.js" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/timeline-api.js" onerror="" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/timeline-bundle.js" onerror="" type="text/javascript"></script>
    <link rel="stylesheet" href="../jquery/graficas_simile/timeline-bundle.css" type="text/css">
    <script src="../jquery/graficas_simile/timeline.js" onerror="" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/labellers.js" onerror="" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/timeline(1).js" onerror="" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/labellers(1).js" onerror="" type="text/javascript"></script>
    <script src="../jquery/graficas_simile/timeplot-bundle.js" onerror="" type="text/javascript">        
    </script><link rel="stylesheet" href="../jquery/graficas_simile/timeplot-bundle.css" type="text/css">
    <link rel="stylesheet" href="../jquery/graficas_simile/graphics.css" type="text/css">
    <script src="../jquery/graficas_simile/create-timeplots.js" type="text/javascript"></script>
  
       
       
    <style> /*
        .label {
            color: #91AA9D;
            margin-top: 0.5em;
            padding: 0.1em;
            font-family: 'verdana', 'helvetica', sans serif;
        }        
        
        .timeplot-grid-label {
            color: #333;
            font-family: 'verdana', 'helvetica', sans serif;
            font-size: 9px !important;
        }
        
        .sources {
            font-size: 90%;
        } */
    </style>
    
    
    <script>
               /*             
        var timeplot1;

        function onLoad() {

	        var red = new Timeplot.Color('#B9121B');
	        var blue = new Timeplot.Color('#193441');
	        var green = new Timeplot.Color('#468966');
	        var lightGreen = new Timeplot.Color('#5C832F');
	        
	        var gridColor  = new Timeplot.Color('#000000');

            var timeGeometry = new Timeplot.DefaultTimeGeometry({
                gridColor: gridColor,
                axisLabelsPlacement: "bottom"
            });

            var geometry1 = new Timeplot.DefaultValueGeometry({
                gridColor: gridColor,
                gridType: "short",
                axisLabelsPlacement: "left",
                min: 0
            });

            var geometry2 = new Timeplot.DefaultValueGeometry({
                min: 0
            });

            var eventSource1 = new Timeplot.DefaultEventSource();
            var dataSource1 = new Timeplot.ColumnSource(eventSource1,1);

            var eventSource2 = new Timeplot.DefaultEventSource();
            var dataSource2 = new Timeplot.ColumnSource(eventSource2,1);

            var eventSource3 = new Timeplot.DefaultEventSource();
            
            var plotInfo1 = [
                Timeplot.createPlotInfo({
                    id: "Population",
                    dataSource: dataSource2,
                    timeGeometry: timeGeometry,
                    valueGeometry: geometry2,
                    lineColor: green,
                    dotColor: lightGreen,
                    showValues: true
                }),
                Timeplot.createPlotInfo({
                    id: "Immigration",
                    dataSource: dataSource1,
                    timeGeometry: timeGeometry,
                    valueGeometry: geometry1,
                    lineColor: blue,
                    dotColor: blue,
                    showValues: true
                }),
                Timeplot.createPlotInfo({
                    id: "Events",
                    eventSource: eventSource3,
                    timeGeometry: timeGeometry,
                    lineColor: red
                }) 
            ];
            
            timeplot1 = Timeplot.create(document.getElementById("timeplot1"), plotInfo1);
            timeplot1.loadText("../jquery/graficas_simile/immigration.txt", " ", eventSource1);
            timeplot1.loadText("us_population.txt", " ", eventSource2);
        }            
        
        var resizeTimerID = null;
        function onResize() {
            if (resizeTimerID == null) {
                resizeTimerID = window.setTimeout(function() {
                    resizeTimerID = null;
                    if (timeplot1) timeplot1.repaint();
                }, 0);
            }
        } */
    
    var timeplot;

function onLoad() {
    var eventSource = new Timeplot.DefaultEventSource();
    var plotInfo = [
    Timeplot.createPlotInfo({
      id: "plot1",
      dataSource: new Timeplot.ColumnSource(eventSource,1),
      valueGeometry: new Timeplot.DefaultValueGeometry({
        gridColor: "#000000",
        axisLabelsPlacement: "left",
        min: 0,
        max: 100
      }),
      timeGeometry: new Timeplot.DefaultTimeGeometry({
        gridColor: "#000000",
        axisLabelsPlacement: "top"
      })
    })
  ];
            
  timeplot = Timeplot.create(document.getElementById("my-timeplot"), plotInfo);
}

var resizeTimerID = null;
function onResize() {
    if (resizeTimerID == null) {
        resizeTimerID = window.setTimeout(function() {
            resizeTimerID = null;
            timeplot.repaint();
        }, 100);
    }
}
    </script>

</head>

     <body onload="onLoad();" onresize="onResize();">
      <div id="my-timeplot" style="height: 150px;"></div>
    </body>
</html>