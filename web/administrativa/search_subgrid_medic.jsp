
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session="true" %>
<%@page import="java.sql.*" %>
<%@page import="pac.conexion" %>


<%
    request.setCharacterEncoding("UTF-8");

    int start = 0;
    int total = 0;
    int total_pages = 0;

    int intpage = new Integer(request.getParameter("page"));
    int limit = new Integer(request.getParameter("rows"));

    String sidx = request.getParameter("sidx");
    String sord = request.getParameter("sord");

    String strQuery = "";
    String json = "";

    // analiza busqueda
    int bandera = 0;
    String where = " and (";

    JSONParser parser = new JSONParser();

    String busca = "" + request.getParameter("_search");
    if (busca.compareTo("true") == 0) {
        String json0 = "" + request.getParameter("filters");

        try {
            Object obj = parser.parse(json0);

            JSONObject jsonObject = (JSONObject) obj;

            String and_or = (String) jsonObject.get("groupOp");



            // loop array
            JSONArray msg = (JSONArray) jsonObject.get("rules");



            for (int i = 0; i < Integer.parseInt("" + msg.size()); i++) {   ///ago un ciclo para todad las restricciones

                if (bandera == 0) {
                    bandera = 1;
                } else {
                    where = where + " " + and_or;
                }


                Object obj2 = parser.parse("" + msg.get(i) + "");
                JSONObject jsonObject2 = (JSONObject) obj2;

                String campo = (String) jsonObject2.get("field");
                if (campo.compareTo("atc") == 0) {
                    campo = "m.cod_atc";
                } else {
                    campo = campo.replace("_", ".");
                }
                if(campo.compareTo("f1")==0){
                    campo="ff.descripcion";
                }
                
                if(campo.compareTo("v1")==0){
                    campo="v.descripcion";
                }
                
                if(campo.compareTo("m1")==0){
                    campo="CONCAT(COALESCE(producto, ''), ' - ', COALESCE(presentacion, ''))";
                }
                String ope = (String) jsonObject2.get("op");
                String dato = (String) jsonObject2.get("data");
               


                /// miro la opcion que pucieron para crear la restriccion
                if (ope.compareTo("eq") == 0) {
                    where = where + " " + campo + " = '" + dato + "'";
                } // igual
                else if (ope.compareTo("ne") == 0) {
                    where = where + " " + campo + " != '" + dato + "'";
                } // '<>' diferente                                                
                else if (ope.compareTo("lt") == 0) {
                    where = where + " " + campo + " < '" + dato + "'";
                } // menor que
                else if (ope.compareTo("le") == 0) {
                    where = where + " " + campo + " <= '" + dato + "'";
                } // menor igula
                else if (ope.compareTo("gt") == 0) {
                    where = where + " " + campo + " > '" + dato + "'";
                } // mayor que
                else if (ope.compareTo("ge") == 0) {
                    where = where + " " + campo + " >= '" + dato + "'";
                } // mayor igual
                else if (ope.compareTo("bw") == 0) {
                    where = where + " " + campo + " like '" + dato + "%'";
                } // comienza con
                else if (ope.compareTo("bn") == 0) {
                    where = where + " " + campo + " not like '" + dato + "%'";
                } //  no comienza por
                else if (ope.compareTo("in") == 0) {
                    where = where + " " + campo + " like '%" + dato + "%'";
                } //se encuentra en
                else if (ope.compareTo("ni") == 0) {
                    where = where + " " + campo + " not like '%" + dato + "%'";
                } //no esta en 
                else if (ope.compareTo("ew") == 0) {
                    where = where + " " + campo + " like '%" + dato + "'";
                } // termina con
                else if (ope.compareTo("en") == 0) {
                    where = where + " " + campo + " not like '%" + dato + "'";
                } //no termina con
                else if (ope.compareTo("cn") == 0) {
                    where = where + " " + campo + " like '%" + dato + "%'";
                } // contiene
                else if (ope.compareTo("nc") == 0) {
                    where = where + " " + campo + " not like '%" + dato + "%'";
                } //no contiene

            }
            where = where + " )";

        } catch (ParseException e) {
            e.printStackTrace();
        }
    } else {
        where = "";
    }
   // System.out.println(where);


    // finaliza busqueda
    boolean rc;

    ResultSet rs = null;

    if (sidx == "") {
        sidx = "1";
    }
    
    /*-----------------------------------Conexión a la base de datos MySql-------------------------------------------*/
    conexion conexiondb = new conexion();
    conexiondb.Conectar();
    /*-----------------------------------------------------------------------------------------------------------*/
    
    String cont=""+request.getParameter("id");
    total = conexiondb.countRec("id_salidas_farmacia", "salidas_farmacia sf, inventario_farmacia ifa, medicamentos m where sf.id_medicamento_inventario=ifa.serial_inven and ifa.cod_medicamento=m.serial and serial_formula_media='"+ cont + "' "+ where + "");
    //System.out.println(total);
    //     out.print("1");
    if (total > 0) {
        double d = Math.ceil((double) (total) / (double) (limit));
        total_pages = (int) (d);
    } else {
        total_pages = 0;
    }

    if (intpage > total_pages) {
        intpage = total_pages;
    }

    start = limit * intpage - limit;

    if (start < 0) {
    }

    strQuery = "select sf.id_salidas_farmacia as id_salida,sf.cantidad as canti,sf.id_medicamento_inventario as id_inven,m.titular as lab, CONCAT(COALESCE(m.producto,''),'-', COALESCE(m.unidad_referencia,''),'-', COALESCE(m.descripcion_comercial,''), '-', COALESCE(m.unidad_medida, '')) as m1,sf.fecha from salidas_farmacia sf, inventario_farmacia ifa, medicamentos m where sf.id_medicamento_inventario=ifa.serial_inven and ifa.cod_medicamento=m.serial and serial_formula_media='"+ cont + "' " + where + " ORDER BY " + sidx + " " + sord + " LIMIT " + start + " , " + limit;
    System.out.print("ss " + strQuery);

    rs = conexiondb.Consulta(strQuery);
    //System.out.print("ac");
    
   // total = conexiondb.countRec("id_salidas_farmacia", "salidas_farmacia sf, inventario_farmacia ifa, medicamentos m,lab_farmaceutico as lb,unidad_medida um where sf.id_medicamento_inventario=ifa.serial_inven and ifa.cod_medicamento=m.serial and lb.idlab_farmaceutico=ifa.laboratorio and m.unidad_medida=um.id_unidad_medida and serial_formula_media='"+ cont + "' "+ where + "");
    //System.out.println(total);
  //System.out.print("af");
    response.setContentType("text/x-json");
    response.setCharacterEncoding("utf-8");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");

    json = "";
    json = json + "{\n";
    json = json + " \"page\":\"" + intpage + "\",\n";
    json = json + "\"total\":" + total_pages + ",\n";
    json = json + "\"records\":" + total + ",\n";
    json = json + "\"rows\": [";
    rc = false;
    
    int totals=0;
    try {
        while (rs.next()) {

            if (rc) {
                json = json + ",";
            }
            json = json + "\n{";
            json = json + "\"id\":\"" + rs.getInt("id_salida") + "\",";
            json = json + "\"cell\":[" + rs.getInt("id_salida") + "";
            json = json + ",\"" + rs.getString("id_inven") + "\"";
            json = json + ",\"" + rs.getString("m1") + "\"";
            json = json + ",\"" + rs.getString("lab") + "\"";
            json = json + ",\"" + rs.getString("fecha") + "\"";
            json = json + ",\"" + rs.getString("canti") + "\"]";
            json = json + "}";
            try{totals=totals+Integer.parseInt(rs.getString("canti"));}catch(Exception es){}
            rc = true;
        }

    } catch (Exception e) {
    }

    json = json + "],\n";
    
                //userdata: {amount: 3220, tax: 342, total: 3564, name: "Totals:"}
    json = json + "\"userdata\":{\"canti\":\"" + totals + "\",\"fecha\":\" Total: \"}\n";

    json = json + "}";
    //System.out.print("ag");
    out.print(json);
    out.close();

   
conexiondb.Close();


%>