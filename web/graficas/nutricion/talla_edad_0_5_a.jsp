<%-- 
    Document   : talla_edad_hombre_percentil_0_5_a
    Created on : 19/03/2014, 11:10:25 AM
    Author     : servidor

    XXXXXX.jsp?genero=M&tipo=percentiles
    XXXXXX.jsp?genero=F&tipo=puntuacionz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Grafica</title>
  <!--[if lte IE 8]><script language="javascript" type="text/javascript" 
      src="/js/flot-0.7/excanvas.min.js"></script><![endif]-->
     <script src="../../jquery/bajados/jquery.min.js" type="text/javascript"></script> 
     
     
     
<script type="text/javascript" src="../../jquery/graficas-Flotr2-master/flotr2.min.js"></script>

 <!-- para mortrar el data -->
 
  <link rel="shortcut icon" href="../../imagenes/fotos/favicon.ico">
  <link rel="stylesheet" href="../../jquery/graficas-Flotr2-master/css/hsd.css?d3fal" type="text/css">
  <link rel="stylesheet" href="../../jquery/graficas-Flotr2-master/css/hsd-flotr2.css?d3fal" type="text/css">
 <!-- fin para mortrar el data -->
  <script language="javascript" type="text/javascript">
      var graph;
      var d1=[],d5=[];
      var posymax=0;
      var eti1="";
      var eti2="";
      var eti3="";
      var eti4="";
      var eti5="";
      var dmin="";
      var dmax="";
   function calula_y1(dato){ // var regre=dmin;
                               var regre=43;                                    
                               for (x=(d1.length-1) ;x>=0;x--){
                                     if(dato<=d1[x][0]){regre=d1[x][1];}
                                                      }
                             //  if(regre>=(dmin+5)){regre=regre-5;}  
                               if(regre>=(43+5)){regre=regre-5;}                          
                               return regre;                      
                             }     
   function calula_y2(dato){  var regre2=dmax;
                               for (x=0;x<d5.length;x++){
                                     if(dato>=d5[x][0]){regre2=d5[x][1];posymax=x;}
                                                      }
                               if(regre2<=(dmax-5)) {regre2=regre2+5;}                        
                               return regre2;                       
                             }   
   
          $(document).ready(function(){
  (function download_image(container) {

  var
   // d1 = [],//graficas
    d2 = [],
    d3 = [],
    d4 = [],
  //  d5 = [],
    d6 = [],
   // graph,
    i; 
  <% 
      
    request.setCharacterEncoding("UTF-8");
        
    String genero="";
    String tipo="";
    
    try{
     genero=request.getParameter("genero");
     tipo=request.getParameter("tipo");
       }
    catch(Exception se){genero="";tipo="";}
    
    String color="#40BEF4";
    String color2="#FF0000";
    String gensql="M";
    String pecent="";
    if(genero.compareTo("F")==0){color="#E57EB5";gensql="F";color2="#585556";}
    
    String sql="";
    if(tipo.compareTo("puntuacionz")==0){
           sql="select (dia/30.4375),sd3neg,sd2neg,sd0,sd2,sd3 from nutricion_talla_edad_puntuacionz_h_m_0_1856_d where genero='"+gensql+"'";
           out.print("eti1='3';");
           out.print("eti2='2';");
           out.print("eti3='0';");
           out.print("eti4='-2';");
           out.print("eti5='-3';");
           out.print("dmin='40';");
           out.print("dmax='126';");
           pecent="Puntuación Z";
                                         }
    else{  sql="SELECT (dia/30.4375),p3,p15,p50,p85,p97 FROM nutricion_talla_edad_percentil_h_m_0_1856_dias where genero='"+gensql+"' ;";
           out.print("eti1='97';");
           out.print("eti2='85';");
           out.print("eti3='50';");
           out.print("eti4='15';");
           out.print("eti5='3';");
           out.print("dmin='43';");
           out.print("dmax='120';");
           pecent="Percentiles";
        }
    
    conecta_bd ba = new conecta_bd();
    ba.ConectaDb();
    
    //consulta para hombres con los dias convertidos a meses (dias/30.4375)
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
     
    
    
    
        String d="";
         if(session.getAttribute("serial_pacinete")!=null){d=""+session.getAttribute("serial_pacinete");}
         
          String sqlfech="select c.altura,c.peso,p.fecha_naci,date(c.fecha) as fecha_consulta from consulta_nutri c,personas p where c.id_historia=p.serial and p.serial="+d+" and c.altura is not null and c.peso is not null and c.fecha is not null;";
            ResultSet resufech=null;
            
          //out.print("alert('"+d+"    |"+sqlfech+"|  '");
        try{  resufech=ba.consultas(sqlfech);}
        catch(Exception e){}
           
         // String fnac="2015-02-02";
	try{
	    while (resufech.next()&&resufech!=null) {  
                       //  if(resufech.getString(1)!=null){fnac=resufech.getString(1);}
                             /// los datos de la consulta 
                           edad s = new edad();
                           int[] edadn =s.edad_num2(""+resufech.getString(3),""+resufech.getString(4));
                           int intedad=0;
                                if(edadn[0]==0){intedad=((edadn[1]/365)*12);}
                           else if(edadn[0]==1){intedad=(edadn[1]);}
                           else{  intedad=(edadn[1]*12);}  
                           //los de abajo son los de la consultaaaa
                           out.print("d6.push(["+intedad+","+resufech.getString(1)+"]);");     
                     }
        }
        catch(SQLException ex){ }
	catch(Exception exe){ }
        ba.cierraResultado(resufech);
    
    ba.cerrar();
  %>
   
    options = {
    selection : { mode : 'x', fps : 30 },
    title: 'Talla Para la Edad',
      subtitle: '<% out.print(pecent); %> (Nacimiento a 5 años)', 
       xaxis:{
        ticks:<%
               int contaa=0;
               int contaa2=0;
               out.print("[[0,\"0 años\"],");
               for(int i=0;i<59;i++){   
                     contaa++;
                     contaa2++;
                          if(contaa==12){out.print("[12,\"1 año\"],");contaa2=0;}
                     else if(contaa==24){out.print("[24,\"2 años\"],");contaa2=0;}
                     else if(contaa==36){out.print("[36,\"3 años\"],");contaa2=0;}
                     else if(contaa==48){out.print("[48,\"4 años\"],");contaa2=0;}
                     else{
                         if (contaa%2==0){out.print("["+contaa+",\""+contaa2+"\"],");}
                         else{out.print("["+contaa+",\"\"],");}
                         }
                                      }
               out.print("[60,\"5 años\"]]");
        
              %>,
        min:0, 
        max:61,
        labelsAngle: 45,
        title: 'Edad (Años con Meses)'
      },
      yaxis:{
        ticks: [45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125],
        min:dmin, 
        max:dmax,
        title: 'Talla (cm)'
      }, 
      y2axis:{color:'<% out.print(color2); %>', //es como otra escala para una fd las graficas
              max:dmax, 
              min:dmin,//d1[(d1.length-1)][1];
             //ticks: [[119.279,eti1],[115.337,eti2],[110.497,eti3],[105.657,eti4],[101.714,eti5]],
              ticks: [[d5[(d5.length-1)][1],eti1],[d4[(d4.length-1)][1],eti2],[d3[(d3.length-1)][1],eti3],[d2[(d2.length-1)][1],eti4],[d1[(d1.length-1)][1],eti5]],
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
  };
  // Draw the graph
   function drawGraph (opts) {

    // Clone the options, so the 'options' variable always keeps intact.
    var o = Flotr._.extend(Flotr._.clone(options), opts || {});

    // Return a new graph.
    return Flotr.draw(
      container,[ 
      {data:d5, color:'#CD4B52',yaxis:2},
      {data:d4, color:'#DB8A51'}, 
      {data:d3, color:'#288454' }, 
      {data:d2, color:'#DB8A51'},
      {data:d1, color:'#CD4B52'},
      {data:d6,label:'Datos del Paciente', color:'<% out.print(color); %>',lines: {show: true}, points: {show: true}} 
     ],
      o
    );
  }

  // Actually draw the graph.
  graph = drawGraph();  
  
  // Hook into the 'flotr:select' event.
  Flotr.EventAdapter.observe(container, 'flotr:select', function (area) {
      
    // Draw graph with new area
    graph = drawGraph({
       
      title: 'Talla Para la Edad',
      subtitle: '<% out.print(pecent); %> (Nacimiento a 5 años)', 
       xaxis:{
       // ticks:<%/*
               int conta=0;
             
               out.print("[[0,\"0 años\"],");
               for(int i=0;i<59;i++){   
                                 conta++;
                                 out.print("["+conta+",\""+conta+"\"],");                         
                                      }
               out.print("[60,\"5 años\"]]");
        */
              %>//,
        noTicks: 37, // numero de etiqueta en x
        tickFormatter: function(n){ return ''+n+''; }, // => muestra valores entre parentesis                                     
        min:area.x1, 
        max:area.x2,
        labelsAngle: 45,
        title: 'Edad (Meses)'
      },
      yaxis:{
        ticks: [45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125],
        min:calula_y1(area.x1), 
        max:calula_y2(area.x2), 
        title: 'Talla (cm)'
      },  
      y2axis:{color:'<% out.print(color2); %>', //es como otra escala para una fd las graficas
              max:calula_y2(area.x2),
              min:calula_y1(area.x1), 
              ticks: [[d5[posymax][1],eti1],[d4[posymax][1],eti2],[d3[posymax][1],eti3],[d2[posymax][1],eti4],[d1[posymax][1],eti5]],
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
      }
    });
  });
    
  // When graph is clicked, draw the graph with default area.
  Flotr.EventAdapter.observe(container, 'flotr:click', function () { drawGraph(); });
  
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
 
 <style type="text/css">
     .flotr-canvas{background-color:<% out.print(color); %> }
 </style>
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
                    </table>
                </form>
            </div>
            
       <!-- <div class="render flotr-crosshair" id="editor-render-0" style="width:600px;height:300px;background-color:#40BEF4"></div> -->
            <div class="render flotr-crosshair" id="editor-render-0" style="width:830px;height:600px"></div> 
     
     </center>
 </body>
 </html>
