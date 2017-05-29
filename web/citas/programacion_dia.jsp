
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
        %>
        
        <script type="text/javascript" language="javascript">
                            <%
                            Calendar cald = new GregorianCalendar();
                            String dia=Integer.toString(cald.get(Calendar.DATE));
                            String mes=Integer.toString(cald.get(Calendar.MONTH));
                            String año=Integer.toString(cald.get(Calendar.YEAR));
                            out.print(" var fechits=new Date("+año+","+mes+","+dia+");");
                            %>
            
            function actu_datap(dia,mes,ano){
                var fecha_cal = new Date(ano,mes,dia);
                $("#calendarioatencion").datepicker("option","maxDate",fecha_cal);
            }
            function cambiacon(){
                var sel =document.getElementById("contratos");
                var valsel=sel.options[sel.selectedIndex].value;
                 $("#servicios").load("carga_servicios.jsp?dato="+valsel+"");
            }
            function carga_contrato(){
                $("#contratos").load("cambia_contrato.jsp?");
            };
            function carga_particular(){
                $("#contratos").load("cambia_particular.jsp?");
            };
            
            $(function(){
		     $("#calendarioatencion").datepicker({
		            //inline:true
		            showOn:'both',
		            buttonImageOnly:true,
		            buttonImage:'../imagenes/fotos/calendar.gif',
		            firstDay:1,
		            changeMonth:true,
		            changeYear:true,                           
                            minDate:fechits
                            
		     });	
		     $('#calendarioatencion').datepicker($.datepicker.regional['es']);
		     $('#calendarioatencion').datepicker("option","showAnim","slideDown");
		     $('#calendarioatencion').datepicker("option","dateFormat","yy-mm-dd");
		     		
	});
        function valida(){
              var nom = document.getElementById("contratos").value;               
              if( nom == null || nom.length == 0 || /^\s+$/.test(nom) ) {
                                                      alert('el contrato es obligatorio');
                                                       return false;  
                                                                                     }  
        }
       </script> 
    </head>
    <body>
        
        <form id="servi" action="cargar_dias.jsp" method="post" name="servi" target="iframe_dias" onsubmit="return valida();">

        <table style="width: 60%" align="center" border="0">
            <tr>
                <td></td>
                <td></td>
                <td><h2>Programacion de Dias</h2></td>
                <td></td>
                <td></td>
            </tr>
            <tr style="display: none">
                <td></td>
                <td><input type="radio" name="cont" value="1" onclick="carga_particular();">PARTICULAR</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="radio" name="cont" value="1" onclick="carga_contrato();">CONTRATO</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><label>Contrato</label></td>
            <td colspan="2">
            <div id="dia_contrato" style="float:left;text-align: left;width: 70%">
                <select id="contratos" name="contratos" style="width: 200px" onchange="cambiacon();" >
                </select></div></td>
                <td><label>Hora Inicio</label></td>
                <td><label>Hora Fin</label></td>
            </tr>
            <tr>
                <td><label>Fecha</label></td>
                <td><input type="text" id="calendarioatencion" name="calendarioatencion" style="width:70%" > </td>
                <td>
                </td>
                <td><select id="hora_inicio" name="hora_inicio">
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                    </select></td>
                <td><select id="hora_fin" name="hora_fin">
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                      </select></td>
            </tr>
        </table>
        <div id="servicios" name="servicios"></div>
        </form>
        <iframe id="iframe_dias" name="iframe_dias" style="width: 100%;height: 400px;border:0px"></iframe>  
    </body>
</html>
