<%-- 
    Document   : cambia_antecedente2
    Created on : 11/03/2013, 07:56:05 PM
    Author     : EMMANUEL
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <select name="antecedentee2" id="antecedentee2">
                        <option value='2212aei'>Seleccione tipo de antecedente</option>   
         <% 
         String dato=request.getParameter("dato");  
         String dato2=request.getParameter("dato2");        
         if(dato.compareTo("2212aei")!=0){
         
                        conecta_bd ba = new conecta_bd();
                        ba.ConectaDb();

                        String generoo=(String)session.getAttribute("generop");
                        String sexoo="1' or sexo='2";
                        if(generoo.compareTo("Masculino")==0){sexoo="1";}
                        else if(generoo.compareTo("Femenino")==0){sexoo="2";}
                        String sql=" select id_descri_antecedente,descripcion from descripcion_antecedente where id_tipo_antecedente='"+dato+"' and (sexo='"+sexoo+"' or sexo='3');";// and id_descri_antecedente not in (select id_descri_antecedente from antecedentes_familiares where id_historia_clinica='"+(String)session.getAttribute("serial_pacinete")+"' and id_parentesco='"+dato2+"')
                   //   System.out.println("ee "+sql);
                        ResultSet resu2=ba.consultas(sql);
                        try{
                            while (resu2.next()&&resu2!=null) {   
                                       out.print("<option value='"+resu2.getString(1)+"'>"+resu2.getString(2)+"</option>");
                            }}
                        catch(SQLException e){}
                        catch(Exception ex){}
                        ba.cierraResultado(resu2);
                        ba.cerrar();
                       } 
                        
                        
         %>           
            
                </select>   

