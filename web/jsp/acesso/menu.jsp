<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String login = request.getParameter("LOGIN");
    String senha = request.getParameter("SENHA");
    Usuario usu = new Usuario(0, "", login, senha, "", "");
    UsuarioControler usucont = new UsuarioControler();
    usu = usucont.validaUsuario(usu);
    session.setAttribute("UsuarioLogado", usu);
%>

<!DOCTYPE html>
<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>SISTEMA </title>

    <body>

        <% if (!usu.getStatus().equals("")) { %>
        <!-- Dropdown1 Trigger -->
        <a class='dropdown-button btn' data-beloworigin="true" href='#' data-activates='dropdown1'>Controle de Acesso</a>        
        <a class='dropdown-button btn' data-beloworigin="true" href='#' data-activates='dropdown2'>Controle de Pessoa e Usuario</a>        
        <a class='dropdown-button btn' data-beloworigin="true" href='#' data-activates='dropdown3'>Controle de Pessoa</a>
        <a class='dropdown-button btn' data-beloworigin="true" href='#' data-activates='dropdown4'>Controle de Agenda</a>

        <% if (usu.getTipo().equals("ADM")) { %>
        <!-- Dropdown1 Structure -->
        <ul id='dropdown1' class='dropdown-content'>
            <li><a href="../usuario/inserirUsuario.jsp"> InserirUsuario </a></li>
            <li><a href="../usuario/consultarUsuario.jsp"> ConsultarUsuario </a></li>
        </ul>

        <ul id='dropdown3' class='dropdown-content'>
            <li><a href="../pessoa/inserirPessoa.jsp"> InserirPessoa </a></li>
            <li><a href="../pessoa/consultarPessoa.jsp"> ConsultarPessoa </a></li>
        </ul>

        <% } else { %>
        <ul id='dropdown1' class='dropdown-content'>
            <li><a href="../usuario/consultarUsuario.jsp"> ConsultarUsuario</a></li>
        </ul>
        <% } %>
        
        <% if (usu.getTipo().equals("ADM")) { %>
        <!-- Dropdown2 Structure -->
        <ul id='dropdown2' class='dropdown-content'>
            <li><a href="../usupes/inserirRelacaoUsuarioPessoa.jsp"> InserirUsuarioPessoa </a></li>
            <li><a href="../usupes/consultarRelacaoUsuarioPessoa.jsp"> ConsultarUsuarioPessoa </a></li>
        </ul>
        <% } else { %>
        <ul id='dropdown2' class='dropdown-content'>
            <li><a href="../usuario/consultarUsuarioPessoa.jsp"> ConsultarUsuarioPessoa </a></li>
        </ul>
        <% } %>
        
        <% if (usu.getTipo().equals("ADM")) { %>
        <!-- Dropdown3 Structure -->
        <ul id='dropdown3' class='dropdown-content'>
            <li><a href="../pessoa/inserirPessoa.jsp"> InserirUsuarioPessoa </a></li>
            <li><a href="../pessoa/consultarPessoa.jsp"> ConsultarUsuarioPessoa </a></li>
        </ul>
        <% } else { %>
        <ul id='dropdown3' class='dropdown-content'>
            <li><a href="../pessoa/consultarPessoa.jsp"> ConsultarUsuarioPessoa </a></li>
        </ul>
        <% } %>
                
        <% if (usu.getTipo().equals("ADM")) { %>
        <!-- Dropdown4 Structure -->
        <ul id='dropdown4' class='dropdown-content'>
            <li><a href="../agenda/inserirReserva.jsp"> InserirReserva </a></li>
            <li><a href="../agenda/consultarReserva.jsp"> ConsultarReserva </a></li>
        </ul>
        <% } else { %>
        <ul id='dropdown4' class='dropdown-content'>
            <li><a href="../agenda/consultarReserva.jsp"> ConsultarReserva </a></li>
        </ul>
        <% } %>
        <% } else { %>
        <h1>USUÁRIO INVÁLIDO</h1>
        <% }%>
    </body>
</html>
