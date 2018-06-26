<%@page import="br.com.controler.AgendaControler"%>
<%@page import="br.com.bean.Agenda"%>
<%@page import="java.util.List"%>
<%@page import="br.com.controler.PessoaControler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int idReserva = Integer.parseInt(cod);
    Agenda age = new Agenda(idReserva, 0, 0, 0, "", "", 0);
    AgendaControler ageCont = new AgendaControler();
    age = ageCont.buscarAgenda(age);
    String pbusca = request.getParameter("PBUSCA");
    List<Agenda> ages = ageCont.listarTodos();
    PessoaControler pesCont = new PessoaControler();
    List<PessoaFisica> pess = pesCont.listarTodos();
%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>ALTERAR - RESERVA</title>
    <body>
        <div class="container"/>
        <h1>ALTERAR RESERVA</h1>
        <form name="alterarReserva" action="validaAlterarReserva.jsp" method="post">
            <table>
                <tr>
                    <td>Pessoa:</td>
                    <td>
                        <select NAME ="ID_PESSOA" class="browser-default">
                            <% for (PessoaFisica pes : pess) {%>
                            <% if (pes.getIdPessoa() == age.getIdPessoa()) {%>
                            <option selected value="<%=pes.getIdPessoa()%>"><%=pes.getNome()%></option>
                            <% } else {%>
                            <option value="<%=pes.getIdPessoa()%>"><%=pes.getNome()%></option>
                            <% }%>
                            <% }%>
                        </select> 
                    </td>
                </tr>
                <tr>
                Ano: <input type="text" name="ano" value="<%=age.getAno()%>">
                Mes: <input type="text" name="mes" value="<%=age.getMes()%>">
                Dia: <input type="text" name="dia" value="<%=age.getDia()%>">
                Horario: <input type="text" name="horario" value="<%=age.getHorario()%>">
                Observacao: <input type="text" name="obs" value="<%=age.getObs()%>">
                </tr>
            </table>   

            <input type="HIDDEN" name="ID" value="<%=age.getIdReserva()%>"> <br>
            <input type="HIDDEN" name="PBUSCA" value="<%=pbusca%>"> <br>
            <input type="submit" name="Enviar" value="OK">
        </form>
        <div>
    </body>
</html>
