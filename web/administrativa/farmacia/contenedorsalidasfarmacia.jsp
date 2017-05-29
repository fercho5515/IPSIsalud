<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8"/>
        

        <script type="text/javascript" language="javascript">
    
    
    
            function cambiaPestanaSalidasFarmacia(pestana2){

                     if(pestana2==1){$("#tabs-salidas-farmacia").load("entrega.jsp");}
                else if(pestana2==2){$("#tabs-salidas-farmacia").load("farmacia/entregas/ventas.jsp");}
                else if(pestana2==3){$("#tabs-salidas-farmacia").load("farmacia/entregas/vencidos.jsp");}
            }    

            $(function() {
                $( "#tabs" ).tabs();
            });
                           
    
        </script>     

        <title>Salidas Farmacia</title>
    </head>
    <body>
        <table border="0">
            <tr>
                <td>
                    <div id="tabs" style="height:100%;width:100%;">
                        <ul>    
                            <li><a href="#tabs-salidas-farmacia" onclick="cambiaPestanaSalidasFarmacia(1)">Formula Medica</a></li>
                         <!--  
                            <li><a href="#tabs-salidas-farmacia" onclick="cambiaPestanaSalidasFarmacia(2)">Ventas</a></li>
                            <li><a href="#tabs-salidas-farmacia" onclick="cambiaPestanaSalidasFarmacia(3)">Vencimiento</a></li>
                         
                            <li><a href="#tabs-medicamentos" onclick="cambiaPestanaMedicamentos(3)">Farmacia</a></li>
                            <li><a href="#tabs-medicamentos" onclick="cambiaPestanaMedicamentos(4)">Entregas</a></li>
                            <li><a href="#tabs-medicamentos" onclick="cambiaPestanaMedicamentos(5)">inventario farmacia</a></li>  -->
                        </ul>
                        <div id="tabs-salidas-farmacia" style="height:100%;width:100%;overflow:auto;">
                        </div>
                    </div>
                </td>
            </tr>
        </table>


        <script type="text/javascript" language="javascript">
            var hoja = document.createElement('style')

            var element = document.getElementById("tabs-salidas-farmacia");
            element.style.width= ""+(screen.width-300)+"px";
            element.style.height= ""+(screen.height-325)+"px";
            cambiaPestanaSalidasFarmacia(1);
        </script>




    </body>

</html>
