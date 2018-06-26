<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.UsuarioPessoa"%>
<%@page import="br.com.controler.UsuarioPessoaControler"%>
<%@page import="java.util.List"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page import="br.com.controler.PessoaControler"%>

<%
    UsuarioControler usuCont = new UsuarioControler();
    List<Usuario> usus = usuCont.listarTodosUsuario();

    PessoaControler pesCont = new PessoaControler();
    List<PessoaFisica> pess = pesCont.listarTodos();

    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    UsuarioPessoa usuPes = new UsuarioPessoa(id,0,0,"");
    UsuarioPessoaControler usuPesCont = new UsuarioPessoaControler();
    usuPes = usuPesCont.buscarUsuarioPessoa(usuPes);
    String pbusca = request.getParameter("PBUSCA");


%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR - USUÁRIO PESSOA</title>
    <body>
       <div class="container"/>
       <h1>ALTERAR - USUÁRIO PESSOA</h1>
        <form name="alterarUsuarioPessoa" action="validaAlterarRelacaoUsuarioPessoa.jsp" method="post">
            <table>
                <tr>
                    <td>Usuario:</td>
                        <td>
                            <select NAME="ID_USUARIO" class="browser-default">
                                <% for (Usuario usu : usus) { %>
                                    <% if( usu.getId() == usuPes.getIdUsuario() ) { %>
                                        <option selected value="<%=usu.getId()%>"><%=usu.getNome()%></option>
                                    <% } else { %>
                                        <option value="<%=usu.getId()%>"><%=usu.getNome()%></option>
                                    <% } %>
                                <% } %>
                            </select> 
                        </td>
                </tr>
                <tr>
                        <td>Pessoa:</td>
                        <td>
                            <select NAME ="ID_PESSOA" class="browser-default">
                                <% for (PessoaFisica pes : pess) { %>
                                    <% if( pes.getIdPessoa()== usuPes.getIdPessoa() ) { %>
                                        <option selected value="<%=pes.getIdPessoa()%>"><%=pes.getNome()%></option>
                                    <% } else { %>
                                        <option value="<%=pes.getIdPessoa()%>"><%=pes.getNome()%></option>
                                    <% } %>
                                <% } %>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Observação:</td>
                        <td><input type="text" name="OBS" value="<%=usuPes.getObs()%>"></td>

                    </tr>
                </table>    
            <input type="HIDDEN" name="ID" value="<%=usuPes.getIdUsuPes()%>"> <br>
            <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>">
            <input type="submit" name="Enviar" value="OK">
        </form>
        <div>
    </body>
</html>