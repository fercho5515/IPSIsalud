<%-- 
    Document   : talla_edad_hombre_percentil_0_5_a
    Created on : 19/03/2014, 11:10:25 AM
    Author     : servidor
--%>

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
     <script src="../../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
     
     
     
<script type="text/javascript" src="../../jquery/graficas-Flotr2-master/flotr2.min.js"></script>

 <!-- para mortrar el data -->
  <link rel="stylesheet" href="../../jquery/graficas-Flotr2-master/css/hsd.css?d3fal" type="text/css">
  <link rel="stylesheet" href="../../jquery/graficas-Flotr2-master/css/hsd-flotr2.css?d3fal" type="text/css">
 <!-- fin para mortrar el data -->
 <style type="text/css">
     .flotr-canvas{background-color:#40BEF4 }
 </style>
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
  <% 
      
    request.setCharacterEncoding("UTF-8");
    conecta_bd ba = new conecta_bd();
    ba.ConectaDb();
    
    //consulta para hombres con los dias convertidos a meses (dias/30.4375)
    String sql="SELECT (dia/30.4375),p3,p15,p50,p85,p97 FROM nutricion_talla_edad_percentil_h_m_0_1856_dias where genero='M' ;";
    ResultSet resu1=ba.consultas(sql);
    try{
        while (resu1.next()&&resu1!=null) {   
                out.print("d1.push(["+resu1.getString(1)+","+resu1.getString(2)+"]);");
                out.print("d2.push(["+resu1.getString(1)+","+resu1.getString(3)+"]);");
                out.print("d3.push(["+resu1.getString(1)+","+resu1.getString(4)+"]);");
                out.print("d4.push(["+resu1.getString(1)+","+resu1.getString(5)+"]);");              
                out.print("d5.push(["+resu1.getString(1)+","+resu1.getString(6)+"]);");                
                                          }
        }
    catch(SQLException e){}
    catch(Exception ex){}
    ba.cierraResultado(resu1);
     
    ba.cerrar();
  %>
        
    d6.push([12,76]);
    d6.push([14,77]);
    d6.push([16,82]);
    d6.push([18,83]);
  // Draw the graph
  graph = Flotr.draw(
    container,[ 
      {data:d5, color:'#CD4B52',yaxis:2},
      {data:d4, color:'#DB8A51'}, 
      {data:d3, color:'#288454' }, 
      {data:d2, color:'#DB8A51'},
      {data:d1, color:'#CD4B52'},
      {data:d6,label:'Datos del Daciente', color:'#40BEF4',lines: {show: true}, points: {show: true}} 
     ],{
      title: 'Talla Para la Edad',
      subtitle: 'Percentiles (Nacimiento a 5 años)',
      xaxis:{
        ticks:<%
               int conta=0;
               int conta2=0;
               out.print("[[0,\"0 años\"],");
               for(int i=0;i<59;i++){   
                     conta++;
                     conta2++;
                          if(conta==12){out.print("[12,\"1 año\"],");conta2=0;}
                     else if(conta==24){out.print("[24,\"2 años\"],");conta2=0;}
                     else if(conta==36){out.print("[36,\"3 años\"],");conta2=0;}
                     else if(conta==48){out.print("[48,\"4 años\"],");conta2=0;}
                     else{
                         if (conta%2==0){out.print("["+conta+",\""+conta2+"\"],");}
                         else{out.print("["+conta+",\"\"],");}
                         }
                                      }
               out.print("[60,\"5 años\"]]");
        
              %>,
    //  [[0,""],[1,""],2,[3,""],4,[5,""],6,[7,""],8,[9,""],10,[11,""],8,[8.5,""],9,[9.5,""],10,[10.5,""],11,[11.5,""],12,[12.5,""],13,[13.5,""],14,[14.5,""],15,[15.5,""],16,[16.5,""],17,[17.5,""],18],
        max: 61,
        min:0,
        labelsAngle: 45,
        title: 'Edad (Años con Meses)'
      },
      yaxis:{
     // ticks: [0,5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195],
        ticks: [45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120],
        max: 120,
        min: 45,
        title: 'Talla (cm)'
      },
      y2axis:{color:'#FF0000', //es como otra escala para una fd las graficas
              max: 120, 
              min:45,
              ticks: [[119.279,"97"],[115.337,"85"],[110.497,"50"],[105.657,"15"],[101.714,"3"]],
              title: ''
            },
      grid:{
        verticalLines: true,
    //  backgroundColor: '#ccc' //fondo de la grafica
       backgroundColor : {
          colors : [[0,'#fff'], [1,'#ccc']],
          start : 'top',
          end : 'bottom'
        },
        //color:'#40BEF4', //color etiquetas y vorde de la grafica
      },      
      HtmlText: false, //etiquetas en html se pone todo feo
      legend: {
        show: true,  
        position: 'nw' //posicion de convenciones norte oeste
      },
      spreadsheet : {//para poder ver los datos
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
            
       <!-- <div class="render flotr-crosshair" id="editor-render-0" style="width:600px;height:300px;background-color:#40BEF4"></div> -->
            <div class="render flotr-crosshair" id="editor-render-0" style="width:830px;height:600px"></div> 
     
     </center>
 </body>
 </html>
