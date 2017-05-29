<%-- 
    Document   : nuevo_paquete.jsp
    Created on : 2/03/2013, 03:40:51 PM
    Author     : EMMANUEL
--%>

<%@page import="pac.conecta_bd"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*" session="true" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
            ///modal jquery	
    jQuery(function ($) {
	var OSX = {
		container: null,
		init: function () {
			$("input.mas, a.mas, figure.mase").click(function (e) {
				e.preventDefault();	

				$("#osx-modal-content").modal({
					overlayId: 'osx-overlay',
					containerId: 'osx-container',
					closeHTML: null,
					minHeight: 80,
					opacity: 65, 
					position: ['0',],
					overlayClose: true,
					onOpen: OSX.open,
					onClose: OSX.close
				});
			});
		},
		open: function (d) {
			var self = this;
			self.container = d.container[0];
			d.overlay.fadeIn('slow', function () {
				$("#osx-modal-content", self.container).show();
				var title = $("#osx-modal-title", self.container);
				title.show();
				d.container.slideDown('slow', function () {
					setTimeout(function () {
						var h = $("#osx-modal-data", self.container).height()
							+ title.height()
							+ 20; // padding
						d.container.animate(
							{height: h}, 
							200,
							function () {
								$("div.close", self.container).show();
								$("#osx-modal-data", self.container).show();
							}
						);
					}, 300);
				});
			})
		},
		close: function (d) {
			var self = this; // this = SimpleModal object
			d.container.animate(
				{top:"-" + (d.container.height() + 20)},
				500,
				function () {
					self.close(); // or $.modal.close();
				}
			);
		}
	};

	OSX.init();

});
        </script>
    </head>
    <body>
           <% request.setCharacterEncoding("UTF-8");
                 if(session.getAttribute("nombre")==null||session.getAttribute("clave")==null||session.getAttribute("id")==null || session.getAttribute("permiso")==null ){
          
          %>
    <br><center><h1>Por favor ingrese adecuadamente</h1></center>
    <br><center><a href="../index.jsp">volver</a></center>
     
     
  
            <% 
              out.println("</body></html>");
              return;
            }
                 /////////////////////////77
                 /////////////////////777777

   String   nom_pac = request.getParameter("paquete_pac");
   String   id_cont = request.getParameter("id_cont");
   String   nom_cont = request.getParameter("ncont_pac");
   String valor_pac = request.getParameter("valor_pac");
   int bandera=0;
   
   String sqll="INSERT INTO `paquete_int` (`id_contratacion`, `valor_pac`, `nombre`) VALUES ('"+id_cont+"','"+valor_pac+"','"+nom_pac+"');";  
        
   conecta_bd baa = new conecta_bd();
   baa.ConectaDb();
   try{      
        if(baa.transaccion(sqll)==true){bandera=1;
                                        String sqlh="insert into historial_c (id_empleado,fecha_hora,descripcion) values ('"+session.getAttribute("id")+"',now(),'crea paquete "+nom_pac+" en contrato "+nom_cont+" con id interna de contrato "+id_cont+"');";
                                        try{ if(baa.transaccion(sqlh)==true){ } }
                                        catch(Exception e){} 
        }
        else{bandera=0;}
        //out.print("333 |"+sqll+"|" +bandera);
    }
   catch(Exception e){bandera=0;}
   
   
       
   sqll="select id_paquete_int,nombre from paquete_int where id_contratacion='"+id_cont+"' order by nombre;";
      //  out.print(sql);
   
   out.print("  <div style='vertical-align:top'>"); 
   if(bandera==0){
               out.print("<center><h3 style='color:red'>Falla al crear al agregar, asegurase de que el nombre del paquete no está repetido.</h3></center><br>");
                }

                                                                              //  out.print(sql);
   ResultSet resufii=null;
   try{  resufii=baa.consultas(sqll);
         while (resufii.next()&&resufii!=null) {  
                            out.print(" <figure id='figu' name='figu' style=' display:inline-block;' onclick='cargapac("+'"'+resufii.getString(1)+'"'+")' style='width:100px'>");
                            out.print(" <center> <img src='../imagenes/fotos/paq.png' alt='contrato uno' style='width:40px;height:40px'>");
                            out.print("  <figcaption  style='width:60px'>"+resufii.getString(2)+"</figcaption></center> ");
                            out.print("  </figure>");
                                              }
       }                       
   catch(SQLException ex){/*System.out.println("2 "+ex);*/}
   catch(Exception exe){/*System.out.println("3 "+exe);*/}
   baa.cierraResultado(resufii);

      
   baa.cerrar(); 
     %>    
	                                                                             		
 <figure style="display:inline-block;text-align:center" class='mase' id="mase" name='mase'  onclick="muestram(4,1)"  >
	 <img src="../imagenes/fotos/mas.png" alt="agregar" style="width:40px;height:40px">
	 <figcaption>Nuevo Paquete</figcaption>
</figure>
</div>  
  </body>
</html>
