<%-- 
    Document   : visita
    Created on : 10-mar-2013, 21:40:38
    Author     : Fercho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
           var anchoPantalla=document.body.offsetWidth -((document.body.offsetWidth*24)/100);
                    $(document).ready(function(){

                         jQuery("#list_archi_trab").jqGrid({
                    url:'../comunes/carga_arch_fami.jsp?q=2',
                    datatype: "json",
                    colNames:['id','Descripción','nombre'],
                    colModel:[
                            {name:'id',index:'id', hidden:true,width:0,search:false,editable:false,required :false,editoptions:{maxlength: 63},editrules: { required: false }},
                            {name:'descripcion',index:'descripcion',width:((anchoPantalla*70)/100),search:true,editable: true,required : true,editoptions:{maxlength: 63},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                            {name:'nombre',index:'nombre',width:((anchoPantalla*25)/100),search:true, editable: true,required : true,editoptions: {maxlength: 43},editrules: { required: true },searchoptions:{sopt:['cn','eq']}},
                            ],
                    rowNum:15,
                    rowList:[15,30,45,500],
                    pager: '#pager_archi_trab',
                    sortname: 'nombre',        
                sortorder: "asc",
                viewrecords: true,
                  width:anchoPantalla,
                    //height: 190,
                    height: 'auto',        
                    editurl: '../comunes/quita_archi.jsp',
               // autowidth: true, 
                shrinkToFit: false,
                caption: "",
	        onSelectRow: function(id){  
                                         $("#result_arch").load("../comunes/muestra_arch.jsp?id_arch="+id+"");
                                         }
            });
            jQuery("#list_archi_trab").jqGrid('navGrid','#pager_archi_trab',{add:false,edit:false,del:true,search:true,view: true},
                                         {closeAfterEdit: true,reloadAfterSubmit:true,reloadAfterEdit:true},//opciones edit
                                                                    {closeAfterAdd: true, closeOnEscape: true,afterSubmit: function() {  NuevoCaso();  } }, //opciones add
                                                                    {width:320}, //opciones del
                                                                    {multipleSearch:true,closeAfterSearch: true, closeOnEscape: true},
                                                                    {width:420} //para el view
                                                                            );
             jQuery("#list_archi_trab").jqGrid('navButtonAdd','#pager_archi_trab',
                 {
                  caption:"",
               // buttonicon:"ui-icon-circle-plus",     
                  buttonicon:"ui-icon-copy",
                  onClickButton:function(){ 
                                          $( "#diag_sube_arch" ).dialog( "open" );
                  },
                  position:"last",
                  title:"Agregar Archivo",
                  cursor: "pointer"});

             });
             
          function  carga_archi(){
                                document.getElementById("archivo_arch").value=""; 
                                document.getElementById("descri_arch").value="";                                  
                                jQuery("#list_archi_trab").jqGrid('setCaption',"").trigger('reloadGrid');
                                $( "#diag_sube_arch" ).dialog( "close" ); 
                                 }
          function valida_nuevo_archivo(){
               
                                var arc = document.getElementById("archivo_arch").value; 
                                if( arc == null || arc.length == 0 || /^\s+$/.test(arc) ) {
                                                                          alert('El archivo es obligatorio');
                                                                          return false;  
                                                                                          }                            
                                 
                                var des = document.getElementById("descri_arch").value; 
                                if( des == null || des.length == 0 || /^\s+$/.test(des) ) {
                                                                          alert('La descripción es obligatoria');
                                                                          return false;  
                                                                                          }   
                                if( des.length >= 499 ) {
                                                                          alert('La descripción tiene como maximo 298 caracteres');
                                                                           return false;  
                                                         }                                    
                                des=des.replace(/\r\n|\n|\r/g, " ");            
                                des=des.replace("'", " ");            
                                document.getElementById("descri_arch").value=des;                        
                                         }    
         $("#archivo_arch").change(function() {

                                        var val = $(this).val();

                                        switch(val.substring(val.lastIndexOf('.') + 1).toLowerCase()){
                                            case 'gif': case 'jpg': case 'png':case 'jpeg': case 'txt': case 'doc':case 'docx': case 'xls': case 'xlsx': case 'pdf': case 'zip': case '7zip': case 'rar':
                                              //  alert("an image");
                                                break;
                                            default:
                                                $(this).val('');
                                                // error message here
                                                alert("Archivo no valido, los formatos permitidos son gif, jpg, png, jpeg, txt, doc, docx, xls, xlsx, pdf, zip, 7zip, rar");
                                                break;
                                        }
});        

       $(function() {
     $( "#diag_sube_arch" ).dialog({
      autoOpen: false,
      modal: true,
      show: {
        effect: "blind",
        duration: 500
      },
      hide: {
       // effect: "explode",
        effect: "drop", 
        duration: 1000
      },
      width:'400px'
    });}); 
        </script>
        <title>JSP Page</title>
    </head>
    <body>
         <center>
              <table id="list_archi_trab" ></table>
              <div id="pager_archi_trab"></div>    
         </center>
    <br>
    <div id="result_arch" ></div>
    <iframe name="ifr_agregaarch" id="ifr_agregaarch" style="display:none" onload="carga_archi()"></iframe>             

        <div id="diag_sube_arch" title="Subir archivos">
             <center><br>
                 <form id="form_agregafami" name="form_agregafami" action="../comunes/agraga_arch_fami.jsp" target="ifr_agregaarch" onsubmit="return valida_nuevo_archivo()" method="post"  enctype="multipart/form-data">
                     <input type="file" id="archivo_arch" name="archivo_arch"><br>
                     <label>Descripción</label><br>
                     <textarea id="descri_arch" name="descri_arch" style="width:100%" rows="3" maxlength="499"></textarea>
                     <br>
                     <input type="submit" value="Subir" id="aceptar">
                 </form>
             </center>             
         </div>
    </body>
</html>
