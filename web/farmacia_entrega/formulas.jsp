<%-- 
    Document   : formulas
    Created on : 02-mar-2013, 15:06:32
    Author     : Fercho
--%>

<!doctype html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table style="width: 60%" align="center">
            <tr>
                <td style="width:30%"></td>
                <td style="width:40%"><h2>Entrega de Medicamentos</h2></td>
                <td style="width:30%"></td>
            </tr>
            <tr>
                <td align="right"><label>Numero Formula:</label></td>
                <td><input type="text" style="width:90%"></td>
                <td align="left"><input type="submit" value="Buscar"></td>
            </tr>
            
            
         </table>
         <table  style="width: 50%" align="center">
         
         <tr>
         <td><h2>Medicamento</h2></td>
         <td><h2>Cantidad</h2></td>
         <td><h2>Posología</h2></td>
         <td><h2>Entrega</h2></td>
         </tr>
         
         <tr>
         <td>
         <label>ACETAMINOFEN 500 mg</label>
         </td>
         <td align="center"><label>25</label></td>
         <td><label>una cada 8 horas</label></td>
         <td align="center"><input type="checkbox"></td>
         </tr>
         
         <tr>
         <td>
         <label>ABACAVIR 200 mg/ml</label>
         </td>
         <td  align="center"><label>20</label></td>
         <td><label>una cada 6 horas</label></td>
         <td align="center"><input type="checkbox"></td>
         </tr>
				
         <tr>
         <td colspan="4" align="center"><input type="submit" value="Guardar"></td>
         </tr>
         </table>
        
        
        
    </body>
</html>
