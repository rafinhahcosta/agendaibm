<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    PessoaFisica pes = new PessoaFisica(id, "", "", "", "");
    PessoaControler pesCont = new PessoaControler();
    pes = pesCont.buscarPessoa(pes);
    String pbusca = request.getParameter("PBUSCA");
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR - PESSOA</title>
    <body>
       <div class="container"/>
       <h1>ALTERAR PESSOA</h1>
        <form name="alterarPessoa" action="validaAlterarPessoa.jsp" method="post">
            Nome: <input type="text" name="NOME" value="<%=pes.getNome()%>"> <br>
            CPF: <input type="text" name="cpf" value="<%=pes.getCpf()%>"> <br>
            Tipo: <input type="text" name="tipo" value="<%=pes.getTipo()%>"> <br>
            Email: <input type="text" name="email" value="<%=pes.getEmail()%>"> <br>
            <input type="HIDDEN" name="ID" value="<%=pes.getIdPessoa()%>"> <br>
            <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>"> <br>
            <input type="submit" name="Enviar" value="OK">
        </form>
        <div>
    </body>
</html>
