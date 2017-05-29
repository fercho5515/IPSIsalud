<%-- 
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
                               var regre=0;                                    
                               for (x=(d1.length-1) ;x>=0;x--){
                                     if(dato<=d1[x][0]){regre=d1[x][1];}
                                                      }
                             //  if(regre>=(dmin+5)){regre=regre-5;}  
                               if(regre>=(0+5)){regre=regre-5;}
                               else{regre=regre-1;}
                               
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
           sql="select talla,sd3neg,sd2neg,sd0,sd2,sd3 from nutricion_peso_talla_puntuacionz_h_m_65_120_cm where genero='"+gensql+"'";
           out.print("eti1='3';");
           out.print("eti2='2';");
           out.print("eti3='0';");
           out.print("eti4='-2';");
           out.print("eti5='-3';");
           out.print("dmin='1';");
           out.print("dmax='31';");
           pecent="Puntuación Z";
                                         }
    else{  sql="SELECT talla,p3,p15,p50,p85,p97 FROM nutricion_peso_talla_percentil_h_m_65_120_cm where genero='"+gensql+"' ;";
           out.print("eti1='97';");
           out.print("eti2='85';");
           out.print("eti3='50';");
           out.print("eti4='15';");
           out.print("eti5='3';");
           out.print("dmin='5';");
           out.print("dmax='28';");
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
                           out.print("d6.push(["+resufech.getString(1)+","+resufech.getString(2)+"]);");     
                     }
        }
        catch(SQLException ex){ }
	catch(Exception exe){ }
        ba.cierraResultado(resufech);
       
        /*
        edad s = new edad();
        int[] edadn =s.edad_num(fnac);
        
        int intedad=0;
        if(edadn[0]==0){intedad=(edadn[1]/365);}
        if(edadn[0]==1){intedad=(edadn[1]/12);}
        else{  intedad=edadn[1];}
        */
        
    ba.cerrar();
  %>
        /*
    d6.push([70,8.5]);
    d6.push([71,9]);
    d6.push([72,20]);
    d6.push([73,10.2]);*/
    
     options = {
    selection : { mode : 'x', fps : 30 },
    title: 'Peso Para la Talla',
      subtitle: '<% out.print(pecent); %> (Nacimiento a 5 años)', 
       xaxis:{
        ticks:<%
               int contaa=0;
               int contaa2=0;
               out.print("[[45,\"45\"],");
               for(int i=46;i<120;i++){   
                     contaa++;
                          if(contaa==5){out.print("["+i+",\""+i+"\"],");contaa=0;}
                          else{out.print("["+i+",\"\"],");}
                                      }
               out.print("[120,\"120\"]]");
        
              %>,
        min:65, 
        max:120,
        labelsAngle: 45,
        title: 'Talla (cm)'
      },
      yaxis:{
        ticks: [[1,""],[1.5,""],2,[2.5,""],[3,""],[3.5,""],4,[4.5,""],[5,""],[5.6,""],6,[6.5,""],[7,""],[7.5,""],8,[8.5,""],[9,""],[9.5,""],10,[10.5,""],[11,""],[11.5,""],12,[12.5,""],[13,""],[13.5,""],14,[14.5,""],[15,""],[15.5,""],16,[16.5,""],[17,""],[17.5,""],18,[18.5,""],[19,""],[19.5,""],20,[20.5,""],[21,""],[21.5,""],22,[22.5,""],[23,""],[23.5,""],24,[24.5,""],[25,""],[25.5,""],26,[26.5,""],[27,""],[27.5,""],28,[28.5,""],[29,""],[29.5,""],30],
        min:dmin, 
        max:dmax,
        title: 'Peso (kg)'
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
       
      title: 'Peso Para la Talla',
      subtitle: '<% out.print(pecent); %> (Nacimiento a 5 años)', 
       xaxis:{
        noTicks: 37, // numero de etiqueta en x
        tickFormatter: function(n){ return ''+n+''; }, // => muestra valores entre parentesis                                     
        min:area.x1, 
        max:area.x2,
        labelsAngle: 45,
        title: 'Talla (cm)'
      },
      yaxis:{
       ticks: [[1,""],[1.5,""],2,[2.5,""],[3,""],[3.5,""],4,[4.5,""],[5,""],[5.6,""],6,[6.5,""],[7,""],[7.5,""],8,[8.5,""],[9,""],[9.5,""],10,[10.5,""],[11,""],[11.5,""],12,[12.5,""],[13,""],[13.5,""],14,[14.5,""],[15,""],[15.5,""],16,[16.5,""],[17,""],[17.5,""],18,[18.5,""],[19,""],[19.5,""],20,[20.5,""],[21,""],[21.5,""],22,[22.5,""],[23,""],[23.5,""],24,[24.5,""],[25,""],[25.5,""],26,[26.5,""],[27,""],[27.5,""],28,[28.5,""],[29,""],[29.5,""],30],
       min:calula_y1(area.x1), 
       max:calula_y2(area.x2), 
       title: 'Peso (kg)'
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
