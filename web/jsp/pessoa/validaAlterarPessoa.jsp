<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    String nome = request.getParameter("NOME");
    String cpf = request.getParameter("cpf");
    String tipo = request.getParameter("tipo");
    String email = request.getParameter("email");
    String pbusca = request.getParameter("PBUSCA");

    PessoaFisica pes = new PessoaFisica(id, nome, cpf, tipo, email);
    PessoaControler pesCont = new PessoaControler();
    pes = pesCont.alteraPessoaFisica(pes); 
    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "validaConsultarPessoa.jsp?NOME=" + pbusca;
    response.sendRedirect(url);
%>