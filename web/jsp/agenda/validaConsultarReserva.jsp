<%@page import="br.com.controler.AgendaControler"%>
<%@page import="br.com.bean.Agenda"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    int ano = Integer.parseInt(request.getParameter("ano"));
    int mes = Integer.parseInt(request.getParameter("mes"));
    int dia = Integer.parseInt(request.getParameter("dia"));
    
    Agenda age = new Agenda(0, ano, mes, dia, "", "", 0);
    AgendaControler ageCont = new AgendaControler();
    List<Agenda> ages = ageCont.listarTodosAgenda(age);
    String pbusca = "&ano="+Integer.toString(ano)+"&m="+Integer.toString(mes)+"&dia="+Integer.toString(dia);
    
    Usuario usuLogado = (Usuario) session.getAttribute("UsuarioLogado");
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>LISTA RESERVA</title>
    <body>
        <table class="striped responsive-table">
            <thead>
              <tr>
                  <th data-field="IDReserva">Id Reserva</th>
                  <th data-field="IDPessoa"> ID Pessoa </th>
                  <th data-field="Horario">Horário</th>
                  <th data-field="Obs">Observacao</th>
                  <th data-field="Excluir">Excluir</th>
                  <th data-field="Alterar">Alterar</th>
              </tr>
            </thead>
            <% if (!(ages.isEmpty())) { %>    
                <tbody>
                    <% for (Agenda listaAgenda : ages) { %>
                        <tr>
                            <td><%=listaAgenda.getIdReserva()%></td>
                            <td><%=listaAgenda.getIdPessoa()%></td>
                            <td><%=listaAgenda.getHorario()%></td>
                            <td><%=listaAgenda.getObs()%></td>
                            
                            <% if (usuLogado.getTipo().equals("ADM")) { %>
                                <td><a href="excluirReserva.jsp?ID=<%=listaAgenda.getIdReserva()%>" >Excluir</a></td>
                                <td><a href="alterarReserva.jsp?ID=<%=listaAgenda.getIdReserva()%>" >Alterar</a></td>
                            <% } %>
                        </tr>
                    <% } %>
    I            </tbody>
            <% } %>
        </table>    
    </body>
</html>