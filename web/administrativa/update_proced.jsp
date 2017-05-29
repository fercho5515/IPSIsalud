<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pac.conecta_bd"%>
        <% 
            
            
      response.setContentType("text/x-json");
      response.setCharacterEncoding("utf-8");
      response.setHeader("Pragma", "no-cache");
      response.setHeader("Cache-Control", "no-cache, must-revalidate");
      response.setHeader("Pragma", "no-cache");
      JSONObject obj=new JSONObject();      
         
            
            
            String obs, pp, quir, c, c1, ser, cup, des;
            HttpSession sesion = request.getSession();
            if (session.getAttribute("nombre") == null || session.getAttribute("clave") == null || session.getAttribute("id") == null || session.getAttribute("permiso") == null) {
           obj.put("res","0");
            } else {
                conecta_bd ba = new conecta_bd();
                ba.ConectaDb();
                obs = request.getParameter("obstetrico");
                pp = request.getParameter("pyp");
                quir = request.getParameter("quirurjico");
                c1 = request.getParameter("consulta1");
                c = request.getParameter("consulta");
                ser = request.getParameter("servicio");

                cup = request.getParameter("cod_cup");
                if (obs == null) {
                    obs = "0";
                } else {
                    obs = "1";
                }
                if (pp == null) {
                    pp = "0";
                } else {
                    pp = "1";
                }
                if (quir == null) {
                    quir = "0";
                } else {
                    quir = "1";
                }
                if (c1 == null) {
                    c1 = "0";
                } else {
                    c1 = "1";
                }
                if (c == null) {
                    c = "0";
                } else {
                    c = "1";
                }
                if (ser == null) {
                    ser = "0";
                } else {
                    ser = "1";
                }
                String emin = request.getParameter("edadmin");
                if (emin.compareTo("") == 0) {
                    emin = "null";
                    //out.print(emin);
                } else {
                    emin = "'" + emin + "'";
                }
                //out.print(emin);
                String emax = request.getParameter("edadmax");
                if (emax.compareTo("") == 0) {
                    emax = "null";
                    //out.print(emax);
                } else {
                    emax = "'" + emax + "'";
                }


                String datos[] = new String[1];
                String sqlcup = "select id_cups from cups where cup_verdadero='" + cup + "';";
                ResultSet resucup = ba.consultas(sqlcup);
                try {
                    while (resucup.next() || resucup != null) {
                        datos[0] = resucup.getString(1);

                    }
                } catch (SQLException e) {
                }
                //out.print(emax);
                try {
                    // String sql2="UPDATE `ips_isalud`.`procedimientos_tari` SET `id_subcie10`='"+request.getParameter( "subcie10" )+"', `descripcion`= '"+request.getParameter( "diagnostico" )+"', `masc_fem`='"+request.getParameter( "sexo" )+"',`edad_minima`="+emin+",`edad_maxima`="+emax+",`uni_edad_minima`='"+request.getParameter( "edadmin2" )+"',`uni_edad_maxima`='"+request.getParameter( "edadmax2" )+"' WHERE `id_subcie10`='"+sesion.getAttribute("codigo_sibcie10")+"';";
                    // out.print(sql2);
                    String sql = "UPDATE  `ips_isalud`.`procedimientos_tari` SET `codigo_maipos`='" + request.getParameter("cod_mapipo") + "',`cod_cups`='" + datos[0] + "',`descripcion`='" + request.getParameter("mapipo") + "',`sexo`='" + request.getParameter("sexo") + "',`edad_min`=" + emin + ",`unidad_edad_min`='" + request.getParameter("edadmin2") + "',`edad_max`=" + emax + ",`unidad_edad_max`='" + request.getParameter("edadmax2") + "',`plan_beneficios`='" + request.getParameter("plan") + "',`obstetrico`='" + obs + "',`pyp`='" + pp + "',`quirurgico`='" + quir + "',`consulta_primeraves`='" + c1 + "',`consulta`='" + c + "',`servicio`='" + ser + "',`cod_finalidad`='" + request.getParameter("finalidad") + "',`cod_rip_adicional`='" + request.getParameter("rip_adicional") + "',`cod_forma_realiza`='" + request.getParameter("formarealizacion") + "',`cod_tipo_serv`='" + request.getParameter("tiposervicio") + "',`cod_concepto_facturacion`='" + request.getParameter("conceptofactu") + "' where `idprocedimientos_tari`='" + request.getParameter("idproced") + "';";
                    //out.print(sql);
                    // String sql3="INSERT INTO `ips_isalud`.`procedimientos_tari`(`codigo_maipos`,`cod_cups`,`descripcion`,`sexo`,`edad_min`,`unidad_edad_min`,`edad_max`,`unidad_edad_max`,`plan_beneficios`,`obstetrico`,`pyp`,`quirurgico`,`consulta_primeraves`,`consulta`,`servicio`,`cod_finalidad`,`cod_rip_adicional`,`cod_forma_realiza`,`cod_tipo_serv`,`cod_concepto_facturacion`) VALUES ('"+request.getParameter( "cod_mapipo" )+"','"+datos[0]+"','"+request.getParameter( "mapipo" )+"','"+request.getParameter( "sexo" )+"',"+emin+",'"+request.getParameter( "edadmin2" )+"',"+emax+",'"+request.getParameter( "edadmax2" )+"','"+request.getParameter( "plan" )+"','"+obs+"','"+pp+"','"+quir+"','"+c1+"','"+c+"','"+ser+"','"+request.getParameter( "finalidad" )+"','"+request.getParameter( "rip_adicional" )+"','"+request.getParameter( "formarealizacion" )+"','"+request.getParameter( "tiposervicio" )+"','"+request.getParameter( "conceptofactu" )+"');";

                    if (ba.transaccion(sql)) {obj.put("res","1");} else {obj.put("res","0");}
                              } catch (Exception ex) {obj.put("res","0");}
                     ba.cerrar();
                 }
            
            
        out.print(obj);
        out.close(); 
    %>   