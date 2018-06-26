<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR - PESSOA</title>
    <body>
       <div class="container"/>
        <h1>INSERIR PESSOA</h1>
        <form name="inserirPessoa" action="validaInserirPessoa.jsp" method="post">
            Nome: <input type="text" name="NOME" value=""> <br>
            Cpf: <input type="text" name="cpf" value=""> <br>
            Tipo: <input type="text" name="tipo" value=""> <br>
            Email: <input type="text" name="email" value=""> <br>
            
            <input type="submit" name="Enviar" value="OK">
        </form>
        </div>
    </body>
</html>

