<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String nome = request.getParameter("NOME");
    PessoaFisica pes = new PessoaFisica(0, nome, "", "", "");
    PessoaControler pesCont = new PessoaControler();
    List<PessoaFisica> pess = pesCont.listarTodosPessoa(pes);
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
    String url = "PBUSCA" + pes.getNome() + "&ID=";
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LISTA PESSOA</title>
    <body>
        <table class="striped responsive-table">
            <thead>
              <tr>
                  <th data-field="Id">Id</th>
                  <th data-field="Nome">Nome</th>
                  <th data-field="Cpf">Cpf</th>
                  <th data-field="Tipo">Tipo</th>
                  <th data-field="Email">Email</th>
                  <th data-field="Excluir">Excluir</th>
                  <th data-field="Alterar">Alterar</th>
              </tr>
            </thead>
            <% if (!(pess.isEmpty())) { %>    
                <tbody>
                    <% for (PessoaFisica listaPessoa : pess) { %>
                        <tr>
                            <td><%=listaPessoa.getIdPessoa()%></td>
                            <td><%=listaPessoa.getNome()%></td>
                            <td><%=listaPessoa.getCpf()%></td>
                            <td><%=listaPessoa.getTipo()%></td>
                            <td><%=listaPessoa.getEmail()%></td>
                            
                            
                            <% if (usuLogado.getTipo().equals("ADM")) { %>
                                <td><a href="excluirPessoa.jsp?<%=url + listaPessoa.getIdPessoa()%>">Excluir</a></td>
                                <td><a href="alterarPessoa.jsp?<%=url + listaPessoa.getIdPessoa()%>">Alterar</a></td>
                            <% } %>
                        </tr>
                    <% } %>
                </tbody>
            <% } %>
        </table>    
    </body>
</html>
