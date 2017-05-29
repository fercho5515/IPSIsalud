<%-- 
    Document   : sube_archivos_img
    Created on : 16/08/2013, 07:09:40 PM
    Author     : Emmanuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            #img_a{
                 width:20px;
                 height:15px;
                  }
            #img_a:hover{
                 padding-top:2px;
                 cursor:pointer;
                 background: #3baae3;
                 border-radius:3px;
                  }
        </style>
        <script type="text/javascript" >
            function muestraarchimg(arc){
                                         $("#ruta_arch_img").val(arc);
                                         document.forms["muestra_arch_img"].submit();
                                        }
           function subeimg(id,sr){
               if(sr=='s'){ $("#id_soli_img").val(id);
                            document.getElementById("archiv_img_sol").value="";
                            $( "#dialog_sube_img" ).dialog( "open" );}
               else if(sr=='r'){
                                   apprise("¿Esta seguro de reemplazar el archivo?", {'verify':true}, function(opcion) {
                                                            if(opcion) { $("#id_soli_img").val(id);  
                                                                         document.getElementById("archiv_img_sol").value="";
                                                                         $( "#dialog_sube_img" ).dialog( "open" ); }
                                                            else{}            
                                                           }); 
                               }
                           }                            
            		   
         $(document).ready(function(){
                         
                                            anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                                            //alert(document.body.offsetWidth+" t "+anchoPantalla+" p "+((document.body.offsetWidth*24)/100));
                                    jQuery("#lis_resu_img").jqGrid({
                               url:'carga_img_sin_arch.jsp?q=2',
                               datatype: "json",
                               colNames:['id','Fecha solicitud','Paciente','Identificación','Profesional','Descripción','Archivo','arc2'],
                               colModel:[
                                       {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                                       {name:'fecha',index:'fecha',width:((anchoPantalla*10)/100),search:true,align: "center",editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'p1',index:'p1', width:((anchoPantalla*21)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'id1',index:'id1', width:((anchoPantalla*9)/100),search:true,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'p2',index:'p2', width:((anchoPantalla*21)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                                       {name:'desr',index:'desr', width:((anchoPantalla*22)/100),search:true,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'arc',index:'arc',hidden:true,width:0,search:false,editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                       {name:'arc2',index:'arc2', width:((anchoPantalla*12)/100),search:false,align: "center",editable: true,required : false,editoptions:{maxlength: 63},editrules: { required: false },searchoptions:{sopt:['cn','eq']}},
                                   ],       
                               rowNum:15,
                               rowList:[15,30,45,500],
                               pager: '#pager_resu_img',
                               sortname: 'i.fecha_soli',
                           viewrecords: true,
                           sortorder: "asc",
                           width:anchoPantalla,
                           height: 'auto',
                           shrinkToFit: false,
                           caption: "Listado de imágenes solicitadas", 
                           gridComplete: function () {
                                        var ids = jQuery("#lis_resu_img").jqGrid('getDataIDs');
                                        for (var i = 0; i < ids.length; i++)
                                        {
                                            var cl = ids[i];
                                            var ret = jQuery("#lis_resu_img").jqGrid('getRowData',ids[i]);

                                              if(ret.arc!="nada"){
                                                           be = "<input style='height:22px;width:95px;color: red'  id='aceptar' type='button' value='Reemplazar' onclick=\"subeimg('"+ret.id+"','r')\"  />&nbsp;<img id='img_a' src='../imagenes/fotos/arc.png' onclick='muestraarchimg(\""+ret.arc+"\")'>";
                                               }
                                           else{ be = "<input style='height:22px;width:68px;color:green'  id='aceptar' type='button' value='Subir' onclick=\"subeimg('"+ret.id+"','s')\" />";} 

                                        //   be = "<input style='height:22px;width:68px;'  id='aceptar' type='button' value='Atender' onclick=\"atiende('" + cl + "','"+ret.descripcion+"','"+ret.serial+"');\"  />";

                                          jQuery("#lis_resu_img").jqGrid('setRowData', ids[i], { arc2: be });
                                        }                  
                                  },
	                   ondblClickRow: function(id){  
                                                        }
                       });
                       jQuery("#lis_resu_img").jqGrid('navGrid','#pager_resu_img',{add:false,edit:false,del:false,search:true,view: true},
                                                                               {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                               {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                                                                               {}, //opciones del
                                                                               {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                               {width:400} //para el view
                                                                                       );


                        });    
      //dialog  
  $(function() {
     $( "#dialog_sube_img" ).dialog({
      autoOpen: false,
      modal: false,
      width:'500',
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1200
      }
    });});        
 function id_arc_img(){
     
     jQuery("#lis_resu_img").jqGrid('setCaption',"Listado de imágenes solicitadas").trigger('reloadGrid');  
     $( "#dialog_sube_img" ).dialog( "close" );   
 }
 function valida_sube_img_sl(){
      var archiv_img_solv=document.getElementById("archiv_img_sol").value; 
   
    if( archiv_img_solv == null || archiv_img_solv.length == 0 || /^\s+$/.test(archiv_img_solv) ) {
                         alert("Primero agregue archivo");
                         return false;  
                                                                      }  
                                                                      
        setTimeout (function(){
            jQuery("#lis_resu_img").jqGrid('setCaption',"Listado de imágenes solicitadas").trigger('reloadGrid');  
     $( "#dialog_sube_img" ).dialog( "close" ); 
        },1200);    
 }
                
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
            <input type="hidden" id="id_resu_img" name="id_resu_img">
        <br>
    <center><h2>IMAGENES SOLICITADAS</h2></center>
        <br>         
        <center>
            <table id="lis_resu_img" ></table>
            <div id="pager_resu_img"></div> 
            <br>
        </center>
        
          
        <form id="muestra_arch_img" name="muestra_arch_img" method="post" action="muestra_arch_img.jsp" target="_blank" >
            <input type="hidden" id="ruta_arch_img" name="ruta_arch_img">
        </form>
        
        <div id="dialog_sube_img" name="dialog_sube_img">
            <center><h2>Subir archivo</h2>
                <br>
                <form id="muestra_arch_img" name="muestra_arch_img" method="post" action="sube_arch_img.jsp" target="id_arc_img" onsubmit="return valida_sube_img_sl();" enctype="multipart/form-data" >
                <input type="file" id="archiv_img_sol" name="archiv_img_sol"><br>
                <input type="hidden" name="id_soli_img" id="id_soli_img">
                <input type="submit" id="aceptar" name="aceptar" value="Subir">
                </form>
            </center>
            
        </div>
        <iframe onload="id_arc_img()" id="id_arc_img" name="id_arc_img" src="" style="border-width:0px;height:100px;width:100%" >
       
    
    </body>
</html>


