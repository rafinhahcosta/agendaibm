<%@page import="br.com.controler.AgendaControler"%>
<%@page import="br.com.bean.Agenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int idReserva = Integer.parseInt(cod);
    
    Agenda age = new Agenda(idReserva, 0, 0, 0, "", "", 0);
    AgendaControler ageCont = new AgendaControler();
    age = ageCont.excluiAgenda(age);
    String pbusca = request.getParameter("PBUSCA");

    String url = "validaConsultarReserva.jsp?ano=0&mes=0&dia=0";
    response.sendRedirect(url);
%>