<%-- 
    Document   : consulta_f1
    Created on : 6/05/2013, 05:12:16 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="pac.edad"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <%    request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null || session.getAttribute("serial_agenda" )==null || session.getAttribute("serial_pacinete")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
        conecta_bd ba = new conecta_bd();
        ba.ConectaDb(); 
       /*
        
        String motconsu=request.getParameter("motivoconsulta"); 
        String enfact=request.getParameter("enfermedadactual"); 
        String revpsist=request.getParameter("revisionsistemas");        
        String finalidad=request.getParameter("finalidad_conculta_c_med");*/
         //////
        
         String vih_fecha_diag="null"; 
        if(request.getParameter("vih_fecha_diag")!=null && request.getParameter("vih_fecha_diag").trim().compareTo("")!=0){
        vih_fecha_diag="'"+request.getParameter("vih_fecha_diag").replace("'","").replace("\"","")+"'";}


         String vih_estadio_inicial="null"; 
        if(request.getParameter("vih_estadio_inicial")!=null && request.getParameter("vih_estadio_inicial").trim().compareTo("")!=0){
        vih_estadio_inicial="'"+request.getParameter("vih_estadio_inicial").replace("'","").replace("\"","")+"'";}

         String vih_estadio_actual="null"; 
        if(request.getParameter("vih_estadio_actual")!=null && request.getParameter("vih_estadio_actual").trim().compareTo("")!=0){
        vih_estadio_actual="'"+request.getParameter("vih_estadio_actual").replace("'","").replace("\"","")+"'";}

         String vih_infecciones_oportunistas="null"; 
        if(request.getParameter("vih_infecciones_oportunistas")!=null && request.getParameter("vih_infecciones_oportunistas").trim().compareTo("")!=0){
        vih_infecciones_oportunistas="'"+request.getParameter("vih_infecciones_oportunistas").replace("'","").replace("\"","")+"'";}
        //////////

         String sr="null"; 
        if(request.getParameter("sr")!=null && request.getParameter("sr").trim().compareTo("")!=0){
        sr="'"+request.getParameter("sr").replace("'","").replace("\"","")+"'";}

         String sp="null"; 
        if(request.getParameter("sp")!=null && request.getParameter("sp").trim().compareTo("")!=0){
        sp="'"+request.getParameter("sp").replace("'","").replace("\"","")+"'";}

         String pdd_fecha="null"; 
        if(request.getParameter("pdd_fecha")!=null && request.getParameter("pdd_fecha").trim().compareTo("")!=0){
        pdd_fecha="'"+request.getParameter("pdd_fecha").replace("'","").replace("\"","")+"'";}

         String pdd_resultado="null"; 
        if(request.getParameter("pdd_resultado")!=null && request.getParameter("pdd_resultado").trim().compareTo("")!=0){
        pdd_resultado="'"+request.getParameter("pdd_resultado").replace("'","").replace("\"","")+"'";}
       ////////////////////////////////////////

         String motconsu="null"; 
        if(request.getParameter("motivoconsulta")!=null && request.getParameter("motivoconsulta").trim().compareTo("")!=0){
        motconsu="'"+request.getParameter("motivoconsulta").replace("'","").replace("\"","")+"'";}

         String enfact="null"; 
        if(request.getParameter("enfermedadactual")!=null && request.getParameter("enfermedadactual").trim().compareTo("")!=0){
        enfact="'"+request.getParameter("enfermedadactual").replace("'","").replace("\"","")+"'";}

         String revpsist="null"; 
        if(request.getParameter("revisionsistemas")!=null && request.getParameter("revisionsistemas").trim().compareTo("")!=0){
        revpsist="'"+request.getParameter("revisionsistemas").replace("'","").replace("\"","")+"'";}
       
         String finalidad="null"; 
        if(request.getParameter("finalidad_conculta_c_med")!=null && request.getParameter("finalidad_conculta_c_med").trim().compareTo("")!=0){
        finalidad="'"+request.getParameter("finalidad_conculta_c_med").replace("'","").replace("\"","")+"'";}

        //////////////////////////
         String recomienda_autocuidado="null"; 
        if(request.getParameter("recomienda_autocuidado")!=null && request.getParameter("recomienda_autocuidado").trim().compareTo("")!=0){
        recomienda_autocuidado="'"+request.getParameter("recomienda_autocuidado").replace("'","").replace("\"","")+"'";}

         String recomienda_alimentacion="null"; 
        if(request.getParameter("recomienda_alimentacion")!=null && request.getParameter("recomienda_alimentacion").trim().compareTo("")!=0){
        recomienda_alimentacion="'"+request.getParameter("recomienda_alimentacion").replace("'","").replace("\"","")+"'";}

         String recomienda_signos_alarma="null"; 
        if(request.getParameter("recomienda_signos_alarma")!=null && request.getParameter("recomienda_signos_alarma").trim().compareTo("")!=0){
        recomienda_signos_alarma="'"+request.getParameter("recomienda_signos_alarma").replace("'","").replace("\"","")+"'";}

         String recomienda_cuidados_gen="null"; 
        if(request.getParameter("recomienda_cuidados_gen")!=null && request.getParameter("recomienda_cuidados_gen").trim().compareTo("")!=0){
        recomienda_cuidados_gen="'"+request.getParameter("recomienda_cuidados_gen").replace("'","").replace("\"","")+"'";}

         String recomienda_adherencia="null"; 
        if(request.getParameter("recomienda_adherencia")!=null && request.getParameter("recomienda_adherencia").trim().compareTo("")!=0){
        recomienda_adherencia="'"+request.getParameter("recomienda_adherencia").replace("'","").replace("\"","")+"'";}

         String incapacidad="null"; 
        if(request.getParameter("incapacidad")!=null && request.getParameter("incapacidad").trim().compareTo("")!=0){
        incapacidad="'"+request.getParameter("incapacidad").replace("'","").replace("\"","")+"'";}

         String incapacidad_texto="null"; 
        if(request.getParameter("incapacidad_texto")!=null && request.getParameter("incapacidad_texto").trim().compareTo("")!=0){
        incapacidad_texto="'"+request.getParameter("incapacidad_texto").replace("'","").replace("\"","")+"'";}


        
         String acompana_nombre="null"; 
        if(request.getParameter("acompana_nombre")!=null && request.getParameter("acompana_nombre").trim().compareTo("")!=0){
        acompana_nombre="'"+request.getParameter("acompana_nombre").replace("'","").replace("\"","")+"'";}
        
         String acompana_telefono="null"; 
        if(request.getParameter("acompana_telefono")!=null && request.getParameter("acompana_telefono").trim().compareTo("")!=0){
        acompana_telefono="'"+request.getParameter("acompana_telefono").replace("'","").replace("\"","")+"'";}
        /////////////////////////
        
         String sintomaticopiel="null"; 
        if(request.getParameter("sintomaticopiel")!=null && request.getParameter("sintomaticopiel").trim().compareTo("")!=0){
        sintomaticopiel="'"+request.getParameter("sintomaticopiel").replace("'","").replace("\"","")+"'";}

         String sintomaticorepi="null"; 
        if(request.getParameter("sintomaticorepi")!=null && request.getParameter("sintomaticorepi").trim().compareTo("")!=0){
        sintomaticorepi="'"+request.getParameter("sintomaticorepi").replace("'","").replace("\"","")+"'";}


         String conducta="null"; 
        if(request.getParameter("conducta")!=null && request.getParameter("conducta").trim().compareTo("")!=0){
        conducta="'"+request.getParameter("conducta").replace("'","").replace("\"","")+"'";}
        
        String con="UPDATE  `consulta_medica` SET  `conducta`="+conducta+",`sintomaticopiel`="+sintomaticopiel+",`sintomaticorepi`="+sintomaticorepi+",`acompana_nombre`="+acompana_nombre+",`acompana_telefono`="+acompana_telefono+",`anamnesis`="+motconsu+", `enf_actual`="+enfact+", `revision_por_sistemas`="+revpsist+",`fecha`=now(),`cod_finalidad_consulta`="+finalidad+",`vih_fecha_diag`="+vih_fecha_diag+",`vih_estadio_inicial`="+vih_estadio_inicial+",`vih_estadio_actual`="+vih_estadio_actual+",`vih_infecciones_oportunistas`="+vih_infecciones_oportunistas+",`sr`="+sr+", `sp`="+sp+", `pdd_fecha`="+pdd_fecha+", `pdd_resultado`="+pdd_resultado+",`recomienda_autocuidado`="+recomienda_autocuidado+",`recomienda_alimentacion`="+recomienda_alimentacion+",`recomienda_signos_alarma`="+recomienda_signos_alarma+",`recomienda_cuidados_gen`="+recomienda_cuidados_gen+",`recomienda_adherencia`="+recomienda_adherencia+",`incapacidad`="+incapacidad+",`incapacidad_texto`="+incapacidad_texto+" WHERE `id_consulta`='"+session.getAttribute("serial_consulta")+"';";
      // System.out.println("sql ==> "+con);   
        ba.transaccion(con);       
       // System.out.println("resultado ==> "+ba.transaccion(con));               
       ba.cerrar();
       
      %>
    </body>
</html>

