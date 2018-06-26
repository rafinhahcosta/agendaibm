<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page import="br.com.controler.PessoaControler"%>

<%
    PessoaControler pesCont = new PessoaControler();
    List<PessoaFisica> pess = pesCont.listarTodos();

%>

<html>
    <%@include file="../../inc/materalizeWeb.inc" %>
    <title>INSERIR RESERVA</title>
    <body>
        <div class="container"/>
            <h1>Inserir Reserva</h1>
            <form name="inseriReserva" action="validaInserirReserva.jsp" method="POST">
                <table>
                    <tr>
                        <td>Pessoa:</td>
                        <td>
                            <select NAME ="ID_PESSOA" class="browser-default">
                                <% for (PessoaFisica pes : pess) { %>
                                    <option value="<%=pes.getIdPessoa()%>"><%=pes.getNome()%></option>
                                <% } %>
                            </select> 
                        </td>
                    </tr>
                    <tr>
                        <td>Ano:</td>
                        <td><input type="text" name="ano" value=""></td>
                        <td>Mes:</td>
                        <td><input type="text" name="mes" value=""></td>
                        <td>Dia:</td>
                        <td><input type="text" name="dia" value=""></td>
                    </tr>
                    <tr>
                     <td>Horário da reserva:</td>
                        <td><input type="text" name="horario" value=""></td>
                    </tr>
                    <tr>
                     <td>Observação:</td>
                        <td><input type="text" name="obs" value=""></td>
                    </tr>
                </table>    
                <input type="submit" name="Enviar" value="Enviar">  <br>
            </form>
        </div>                     
    </body>
</html>