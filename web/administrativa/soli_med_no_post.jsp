<%-- 
    Document   : soli_med_no_post
    Created on : 12/08/2013, 01:44:14 PM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" >
            		     $(document).ready(function(){
                         
                                            anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                                            //alert(document.body.offsetWidth+" t "+anchoPantalla+" p "+((document.body.offsetWidth*24)/100));
                                    jQuery("#lis_med_no_post").jqGrid({
                               url:'carga_soli_no_pos.jsp?q=2',
                               datatype: "json",
                               colNames:['id','Fecha solicitud','Paciente','Identificación','Profesional','Identificación'],
                               colModel:[
                                       {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                                       {name:'fecha',index:'fecha',width:((anchoPantalla*10)/100),search:true,align: "center",editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'p1',index:'p1', width:((anchoPantalla*33)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'id1',index:'id1', width:((anchoPantalla*10)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'p2',index:'p2', width:((anchoPantalla*33)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                                       {name:'id2',index:'id2', width:((anchoPantalla*10)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       ],       
                               rowNum:15,
                               rowList:[15,30,45,500],
                               pager: '#pager_med_no_post',
                               sortname: 'c.fecha',
                           viewrecords: true,
                           sortorder: "asc",
                           width:anchoPantalla,
                           height: 'auto',
                           shrinkToFit: false,
                           caption: "Listado de solicitudes",                           
	                   ondblClickRow: function(id){        
                                     $("#id_soli_no_post_hi").val(""+id+"");
                                     $("#datos_soli_np").load("medicamentos_no_pos_solisitado.jsp?id_soli_no_pos="+id+"");                                  
                                                     }
                       });
                       jQuery("#lis_med_no_post").jqGrid('navGrid','#pager_med_no_post',{add:false,edit:false,del:false,search:true,view: true},
                                                                               {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                               {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                                                                               {}, //opciones del
                                                                               {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                               {width:400} //para el view
                                                                                       );


                        });
        </script>
        
    </head>
    <body>
         <% 
                    request.setCharacterEncoding("UTF-8");
           
            if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
            %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            } %>
            <input type="hidden" id="id_soli_no_post_hi" name="id_soli_no_post_hi">
        <br>
    <center><h2>SOLICITUD DE MEDICAMENTOS NO POS</h2></center>
        <br>         
        <center>
            <table id="lis_med_no_post" ></table>
            <div id="pager_med_no_post"></div> 
            <br>
            <div name="datos_soli_np" id="datos_soli_np"></div>
        </center>

    </body>
</html>
