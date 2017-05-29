<%-- 
    Document   : grafica
    Created on : 20/11/2013, 01:09:56 PM
    Author     : servidor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Grafica</title>
    
     <link rel="shortcut icon" href="../imagenes/fotos/favicon.ico">
	
    <link rel="stylesheet" type="text/css" href="../jquery/grafica/jquery.jqChart.css" />
    <link rel="stylesheet" type="text/css" href="../jquery/grafica/jquery.jqRangeSlider.css" />
    
    <script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
    <script src="../jquery/grafica/jquery.mousewheel.js" type="text/javascript"></script>
    <script src="../jquery/grafica/jquery.jqChart.min.js" type="text/javascript"></script>
    <script src="../jquery/grafica/jquery.jqRangeSlider.min.js" type="text/javascript"></script>
    
    <script lang="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#jqChart').jqChart({
                title: { text: 'Grafica de Prueva' },
                tooltips: { type: 'shared' },
                animation: { duration: 1 },
                axes: [
                    {
                        type: 'category',
                        location: 'bottom',
                        categories: [1, 2, 3, 4, 5,6,7] ///valores de x para ambos
                    }
                ],
                series: [
                    {
                        type: 'spline',
                        title: 'Cosita 1',
                        data: [62, 70, 68, 58, 52, 60, 48]    //valores de y para uno
                    },
                    {
                        type: 'spline',
                        title: 'Cosita 2',
                        data: [56, 30, 62, 65, 40, 36, 70],//valores de y para dos
                        labels: {
                            font: '12px sans-serif'
                        }
                    }
                ]
            });
        });
    </script>

</head>
<body>
    <br>  
  <center>
    <div>
        <div id="jqChart" style="width: 500px; height: 300px;"></div>
    </div>
  </center>
</body>
</html>