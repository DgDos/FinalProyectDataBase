<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="model.ReporteServicio"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Agregar Categoria</title>
    </head>
    <body>
        <button onclick="Listar()">Oprime aqui para maravillarte amiguito :)</button>
            <table>
                <tbody id="miTabla">
                    <thead>
                        <tr>
                            <th>Nombre Servicio</th>
                            <th>Cantidad de Funciones</th>
                        </tr>
                    </thead>
                </tbody>
            </table>  
    </body>
</html>

<script type="text/javascript">
    function Listar(){
        $.ajax({
            url:"ServicioReporte",
            type:"GET",
            success:function(data){
                var lista=$.parseJSON(data);
                for(int i=0;i<lista.length;i++){
                    $("#miTabla").append('<tr><td>'+lista[i].nombre+'</td>');
                    $("#miTabla").append('<td>'+lista[i].cuenta+'</td></tr>');
                }
            }
        }
        )
    }
</script>