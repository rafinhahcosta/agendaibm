<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String nome = request.getParameter("NOME");
    String cpf = request.getParameter("cpf");
    String tipo = request.getParameter("tipo");
    String email = request.getParameter("email");
    
    PessoaFisica pes = new PessoaFisica(0, nome, cpf, tipo, email);
    PessoaControler pesCont = new PessoaControler();
    pes = pesCont.inserirPessoa(pes); 
    // REDIRECIONA PARA A PAG LOGIN.JSP
    String url = "inserirPessoa.jsp";
    response.sendRedirect(url);
%>
