<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Ejemplo de gráfico generado con la librería javascript flot</title>
  <!--[if lte IE 8]><script language="javascript" type="text/javascript" 
      src="/js/flot-0.7/excanvas.min.js"></script><![endif]-->
     <script src="../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
     
     
     
<script type="text/javascript" src="../jquery/graficas-Flotr2-master/flotr2.min.js"></script>

 <!-- para mortrar el data -->
  <link rel="stylesheet" href="../jquery/graficas-Flotr2-master/css/hsd.css?d3fal" type="text/css">
  <link rel="stylesheet" href="../jquery/graficas-Flotr2-master/css/hsd-flotr2.css?d3fal" type="text/css">
 <!-- fin para mortrar el data -->

  <script language="javascript" type="text/javascript">
      
          $(document).ready(function(){
  (function download_image(container) {

  var
    d1 = [],//graficas
    d2 = [],
    d3 = [],
    d4 = [],
    d5 = [],
    d6 = [],
    graph,
    i;
  
  for (i = 0; i <= 10; i += 0.1) {
    d1.push([i, 4 + Math.pow(i,1.5)]);
    d2.push([i, Math.pow(i,3)]);
    d3.push([i, i*5+3*Math.sin(i*4)]);
   // d4.push([i, i]);
    if( i.toFixed(1)%1 == 0 ){
      d5.push([i, 2*i]);
    }
  }
      
    d4.push([0,0]);    
    d4.push([1,5]);    
    d4.push([2,5]);    
    d4.push([3,7]);    
    d4.push([4,9]);    
    d4.push([5,11]); 
    d4.push([5.5,12]);     
    d4.push([6,13]);    
    d4.push([6.5,14]);    
    d4.push([7,15]);  
    d4.push([7.2,15]);
    
    d6.push([2,20]);
    
  // Draw the graph
  graph = Flotr.draw(
    container,[ 
    //  {data:d1, label:'y = 4 + x^(1.5)', lines:{fillColor: ['#00A8F0', '#fff'],fill:true}}, 
      {data:d1, label:'y = 4 + x^(1.5)', lines:{fill:true}},
      {data:d2, label:'y = x^3', yaxis:2}, 
      {data:d3, label:'y = 5x + 3sin(4x)',color:'#545454' }, 
      {data:d4, label:'y = x por X'},
      {data:d5, label:'y = 2x', lines: {show: true}, points: {show: true}},       
      {data:d6, label:'Punto',  points: {show: true}}
    ],{
      title: 'Ejemplo para descargar como Imagen',
      subtitle: 'Grafica de Cosas Interesantes',
      xaxis:{
        noTicks: 7, // numero de etiqueta en x
        tickFormatter: function(n){ return '('+n+')'; }, // => muestra valores entre parentesis
        min: 0,  // => part of the series is not displayed.
        max: 7.5, // => part of the series is not displayed.
        labelsAngle: 45,//angulo de las etiquetas
        title: 'titulo de x'
      },
      yaxis:{
        ticks: [[0, "Minimo"], 10, 20, 30, [40, "Maximo"]],
        max: 40,
        title: 'titulo de y'
      },
      y2axis:{color:'#FF0000', //es como otra escala para una fd las graficas
              max: 500, title: 'titulo y de la derecha'
            },
      grid:{
        verticalLines: true,
     // backgroundColor: 'white' //fondo de la grafica
        backgroundColor : {
          colors : [[0,'#fff'], [1,'#ccc']],
          start : 'top',
          end : 'bottom'
        } 
      },
      HtmlText: false, //etiquetas en html se pone todo feo
      legend: {
        position: 'nw' //posicion de convenciones norte oeste
      },
      spreadsheet : {
        show : true,
        tickFormatter : function (e) { return e+''; }
      }
  });

  this.CurrentExample = function (operation) {

    var
      format = $('#image-download input:radio[name=format]:checked').val();
    if (Flotr.isIE && Flotr.isIE < 9) {
      alert(
        "Su navegador no le permiten obtener una imagen de mapa de bits.<br />"
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

          });
 </script>
 </head>
 <body>
     <center>
            
            
         <!--   <div class="flotr-example-description"> -->
             <div >   
                <form name="image-download" id="image-download" action="" onsubmit="return false">
                    <table style="width: 200px">
                       <tr>
                           <td><input type="radio" name="format" value="png" checked="checked" style="height:15px;width:15px"> PNG</td>
                           <td><input type="radio" name="format" value="jpeg" style="height:15px;width:15px"> JPEG</td>
                      </tr>     
               <!-- <button name="to-image" onclick="CurrentExample('to-image')">A imagen</button> -->
                      <tr>
                           <td colspan="2">
                                <center><button name="download" onclick="CurrentExample('download')">Descargar</button></center>    
                           </td>
                      </tr>
               <!-- <button name="reset" onclick="CurrentExample('reset')">Reset</button> -->
                    </table>
                </form>
            </div>
            
       <!-- <div class="render flotr-crosshair" id="editor-render-0" style="width:600px;height:300px"></div> -->
            <div class="render flotr-crosshair" id="editor-render-0" style="width:500px;height:600px"></div> 
     
     </center>
 </body>
 </html>
