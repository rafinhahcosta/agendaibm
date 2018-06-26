<%@page import="br.com.controler.AgendaControler"%>
<%@page import="br.com.bean.Agenda"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int idReserva = Integer.parseInt(cod);
    int idPessoa = Integer.parseInt(request.getParameter("ID_PESSOA"));
    String pbusca = request.getParameter("PBUSCA");
    String an = request.getParameter("ano");
    int ano = Integer.parseInt(an);
    String me = request.getParameter("mes");
    int mes = Integer.parseInt(me);
    String di = request.getParameter("dia");
    int dia = Integer.parseInt(di);
    String horario = request.getParameter("horario");
    String obs = request.getParameter("obs");
    
    Agenda age = new Agenda(idReserva, ano, mes, dia, horario, obs, idPessoa);
    AgendaControler ageCont = new AgendaControler();
    age = ageCont.alteraAgenda(age);
    
    String url = "validaConsultarReserva.jsp?ano=0&mes=0&dia=0";
    response.sendRedirect(url);
%>