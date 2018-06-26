<%@page import="br.com.controler.AgendaControler"%>
<%@page import="br.com.bean.Agenda"%>
<%@page import="br.com.controler.UsuarioPessoaControler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.UsuarioPessoa"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    int idPessoa = Integer.parseInt(request.getParameter("ID_PESSOA"));
    int ano = Integer.parseInt(request.getParameter("ano"));
    int mes = Integer.parseInt(request.getParameter("mes"));
    int dia = Integer.parseInt(request.getParameter("dia"));
    String horario = request.getParameter("horario");
    String obs = request.getParameter("obs");
    
    
    Agenda age = new Agenda(0, ano, mes, dia, horario, obs, idPessoa);
    AgendaControler ageCont = new AgendaControler();
    age = ageCont.inserirAgenda(age);

    String url = "inserirReserva.jsp";
    response.sendRedirect(url);

%>