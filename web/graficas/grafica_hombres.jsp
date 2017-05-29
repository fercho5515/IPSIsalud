<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conecta_bd"%>
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
    d7 = [],
    d8 = [],
    graph,
    i;
  <% 
      
    request.setCharacterEncoding("UTF-8");
    conecta_bd ba = new conecta_bd();
    ba.ConectaDb();
    
    
    String sql="select edad,p3_log,p50_log,p97_log,ds_log from nutricion_longitudinal_chicos";
    ResultSet resu1=ba.consultas(sql);
    try{
        while (resu1.next()&&resu1!=null) {   
                out.print("d1.push(["+resu1.getString(1)+","+resu1.getString(2)+"]);");
                out.print("d2.push(["+resu1.getString(1)+","+resu1.getString(3)+"]);");
                out.print("d3.push(["+resu1.getString(1)+","+resu1.getString(4)+"]);");
              //  out.print("d4.push(["+resu1.getString(1)+","+resu1.getString(5)+"]);");
                
                                          }
        }
    catch(SQLException e){}
    catch(Exception ex){}
    ba.cierraResultado(resu1);
     
    String sql2="SELECT edad,p3_long,p50_long,p97_long,ds_long FROM nutricion_transverlas_chicos;";
    ResultSet resu2=ba.consultas(sql2);
    try{
        while (resu2.next()&&resu2!=null) {   
                out.print("d5.push(["+resu2.getString(1)+","+resu2.getString(2)+"]);");
                out.print("d6.push(["+resu2.getString(1)+","+resu2.getString(3)+"]);");
                out.print("d7.push(["+resu2.getString(1)+","+resu2.getString(4)+"]);");
              //  out.print("d8.push(["+resu1.getString(1)+","+resu1.getString(5)+"]);");
                
                                          }
        }
    catch(SQLException e){}
    catch(Exception ex){}
    ba.cierraResultado(resu2);
    ba.cerrar();
  %>
        
    
  // Draw the graph
  graph = Flotr.draw(
    container,[ 
    //{data:d1, label:'y = 4 + x^(1.5)', lines:{fillColor: ['#00A8F0', '#fff'],fill:true}}, 
    //{data:d1, label:'p3',markers: { show: true, position: 'ct' }, lines:{fill:true}},
     //{data:d6, label:'p50 transversal'},
    //  {data:d7, label:'p97 transversal',color:'#FFFFFF',lines:{fill:true,fillOpacity: 1,show: true,fillColor: ['#FFFFFF', '#FFFFFF']}},
    //  {data:d5, label:'p3 transversal',color:'#ccc',lines:{fill:true,fillOpacity: 1,show: true,fillColor: ['#ccc', '#ccc']}},
      {data:d7, label:'p97 transversal',color:'#FFFFFF',lines:{fill:true,fillOpacity: 1, start: 'top', end: 'd5'}},
      {data:d5, label:'p3 transversal',color:'#ccc',lines:{fill:true,fillOpacity: 1}},
      {data:d8, label:'ds transversal'},
            
      {data:d1, label:'p3',yaxis:2},
      {data:d2, label:'p50'}, 
      {data:d3, label:'p97',color:'#545454' }, 
      {data:d4, label:'ds'}
  //  {data:d5, label:'y = 2x', lines: {show: true}, points: {show: true}},       
     ],{
      title: 'Estado Nutricional 2 a 18 años',
      subtitle: 'Talla/Edad',
      xaxis:{
        ticks: [2,[2.5,""],3,[3.5,""],4,[4.5,""],5,[5.5,""],6,[6.5,""],7,[7.5,""],8,[8.5,""],9,[9.5,""],10,[10.5,""],11,[11.5,""],12,[12.5,""],13,[13.5,""],14,[14.5,""],15,[15.5,""],16,[16.5,""],17,[17.5,""],18],
        max: 18,
        min:2,
        labelsAngle: 45,
        title: 'Edad (Años)'
      },
      yaxis:{
     // ticks: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195],
        ticks: [70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195],
        max: 195,
        min: 70,
        title: 'Talla (cm)'
      },
      y2axis:{color:'#FF0000', //es como otra escala para una fd las graficas
              max: 195, 
              min:70,
              ticks: [160,174,188],
              title: 'titulo y de la derecha'
            },
      grid:{
        verticalLines: true,
      backgroundColor: '#ccc' //fondo de la grafica
    /*    backgroundColor : {
          colors : [[0,'#fff'], [1,'#ccc']],
          start : 'top',
          end : 'bottom'
        } */
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
            <div class="render flotr-crosshair" id="editor-render-0" style="width:500px;height:700px"></div> 
     
     </center>
 </body>
 </html>
