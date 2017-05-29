
<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8"/>

        <script type="text/javascript" language="javascript">
            function cambiaPestanaCefalocaudal(pestanaIns){

                if(pestanaIns==1){$("#tabs-cefalocaudal").load("crear_parte.jsp");}
                else if(pestanaIns==2){$("#tabs-cefalocaudal").load("subdiagnostico.jsp");}
                           
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
                            <li><a href="#tabs-cefalocaudal" onclick="cambiaPestanaCefalocaudal(1)">Crear Partes para Examen Cefalocaudal </a></li>

                        </ul>
                        <div id="tabs-cefalocaudal" style="height:400px;width:1012px;overflow:auto;">
                        </div>
                    </div>

                </td></tr></table>


        <script type="text/javascript" language="javascript">
            var hoja = document.createElement('style')

            var element = document.getElementById("tabs-cefalocaudal");
            element.style.width= ""+(screen.width-300)+"px";
            element.style.height= ""+(screen.height-335)+"px";
            cambiaPestanaCefalocaudal(1);
        </script>
    </body>

</html>

