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
	
    <link rel="stylesheet" type="text/css" href="../jquery/grafica/jquery.jqChart.css" />
    
    <script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
    <script src="../jquery/grafica_morris/morris.min.js" type="text/javascript"></script>
    <script src="../jquery/grafica_morris/raphael-2.1.0.min.js" type="text/javascript"></script>
    
    <script lang="javascript" type="text/javascript">
       $(document).ready(function () {
        /*   Morris.Line({
                        element: 'line-example',
                        data: [
                            { y: '2', a: 100, b: 90 },
                            { y: '4', a: 75,  b: 65 },
                            { y: '6', a: 50,  b: 40 },
                            { y: '7', a: 75,  b: 65 },
                            { y: '8', a: 50,  b: 40 },
                            { y: '9', a: 75,  b: 65 },
                            { y: '10', a: 100, b: 90 }
                        ],
                        xkey: 'y',
                        ykeys: ['a', 'b'],
                        labels: ['Cosa a', 'Cosa B']
                        });
                     */   
           new Morris.Line({
                    // ID of the element in which to draw the chart.
                    element: 'line-example',
                    // Chart data records -- each entry in this array corresponds to a point on
                    // the chart.
                    data: [
                            { y: '2', a: 100, b: 90 },
                            { y: '4', a: 75,  b: 65 },
                            { y: '6', a: 50,  b: 40 },
                            { y: '7', a: 75,  b: 65 },
                            { y: '8', a: 50,  b: 40 },
                            { y: '9', a: 75,  b: 65 },
                            { y: '10', a: 100, b: 90 }
                    ],
                    // The name of the data record attribute that contains x-values.
                    xkey: 'y',
                    // A list of names of data record attributes that contain y-values.
                    ykeys: ['a', 'b'],
                    labels: ['Cosa a', 'Cosa B']
                    });             
                        
                        
       });
    </script>

</head>
<body>
    <br>  
  <center>
       <div id="line-example"></div>

  </center>
</body>
</html>