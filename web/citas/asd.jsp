
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%    
         conecta_bd ba = new conecta_bd();
         ba.ConectaDb();
         String dato=request.getParameter("dato");
         //dato=dato.replace('*',' ');
         out.print("este es el dato--"+dato);
                        String datos2[]=new String[1];
                        //out.print("consulta de carga proced"+sql);
                        String sql2="select count(DISTINCT da.dia) from dias_atencion da,afiliados_cont ac, pacientes pa, personas pe where da.id_contrato=ac.id_cont and ac.serial_paciente=pa.serial_persona and pa.serial_persona=pe.serial and pe.id_person='"+dato+"';";
                        ResultSet resu3=ba.consultas(sql2);
                        try{
                             while (resu3.next()||resu3!=null) { 
                                         datos2[0]=resu3.getString(1);
                                       }
                        }
                        catch(SQLException e){}
                        catch(Exception ex){}
                        //out.print(datos2[0]);
                        if(Integer.parseInt(datos2[0])==0){
        %>
                                         <select name="2cambia_dia" id="2cambia_dia" value='No valido' style="width: 150px">
                                         </select>
                                         <input type="hidden" id="contrato" name="contrato" value="0">
                                         <%
                                          }
                                         else{
                                         %>
                                         <select name="2cambia_dia" id="2cambia_dia" value='No valido' style="width: 150px" value='<% out.print(datos2[0]);%>'  readonly>
                                         <%
                                            String sql="select DISTINCT da.dia from dias_atencion da,afiliados_cont ac, pacientes pa, personas pe where da.id_contrato=ac.id_cont and ac.serial_paciente=pa.serial_persona and pa.serial_persona=pe.serial and pe.id_person='"+dato+"';";    
                                            
                                            ResultSet resu=ba.consultas(sql);
                                                 try{
                                                     
                                                 while (resu.next()&&resu!=null) {   
                                                 out.print("<option value='"+resu.getString(1)+"'>"+resu.getString(1)+"</option>");
                                                 //out.print("<input type='hidden' id='contrato' name='contrato' value='"+resu.getString(2)+"'>");
                                                        }
                                                 }
                                            catch(SQLException e){}
                                            catch(Exception ex){}
                                            ba.cierraResultado(resu);
                                             %>
                                         </select>
                                          <input type="hidden" id="contrato" name="contrato" value="0">
                                            <%
                                             String sql5="select DISTINCT da.id_contrato from dias_atencion da,afiliados_cont ac, pacientes pa, personas pe where da.id_contrato=ac.id_cont and ac.serial_paciente=pa.serial_persona and pa.serial_persona=pe.serial and pe.id_person='"+dato+"';";
                        
                        ba.cerrar();
                        %>     
    </body>
</html>