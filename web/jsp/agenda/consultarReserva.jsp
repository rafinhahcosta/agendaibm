<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>CONSULTAR - RESERVA</title>
    <body>
       <div class="container"/>
       <h1>CONSULTAR RESERVA</h1>
       <form name="consultarReserva" action="validaConsultarReserva.jsp" method="post">
            Ano: <input type="text" name ="ano" value=""> <br>
            Mes: <input type="text" name ="mes" value=""> <br>
            Dia: <input type="text" name ="dia" value=""> <br>
           <input type="submit" name ="Enviar" value="Enviar"> <br>
       </form>
       </div>
    </body>
</html>