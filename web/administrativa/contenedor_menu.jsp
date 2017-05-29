<%-- 
    Document   : contenedor_cefalocaudal
    Created on : 17-abr-2013, 12:36:42
    Author     : Fercho
--%>
<% request.setCharacterEncoding("UTF-8");%>
<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8"/>

        <script type="text/javascript" language="javascript">
            function cambiaPestanaComida(pestanaComida){

                if(pestanaComida==1){$("#tabs-comida").load("crear_horacomida.jsp");}
                else if(pestanaComida==2){$("#tabs-comida").load("crear_comida.jsp");}
                           
            }    

            $(function() {
                $( "#tabs" ).tabs();
            });
                           
    
        </script>     

        <title>Empleados</title>
    </head>
    <body>
        <table border="0"><tr><td>
                    <div id="tabs" style="height:100%;width:100%;">
                        <ul>    
                            <li><a href="#tabs-comida" onclick="cambiaPestanaComida(1)">Crear Hora Comida </a></li>
                            <li><a href="#tabs-comida" onclick="cambiaPestanaComida(2)">Crear Comida</a></li>

                        </ul>
                        <div id="tabs-comida" style="height:400px;width:1012px;overflow:auto;">
                        </div>
                    </div>

                </td></tr></table>


        <script type="text/javascript" language="javascript">
            var hoja = document.createElement('style')

            var element = document.getElementById("tabs-comida");
            element.style.width= ""+(screen.width-300)+"px";
            element.style.height= ""+(screen.height-335)+"px";
            cambiaPestanaComida(1);
        </script>
    </body>

</html>


