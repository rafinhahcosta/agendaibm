<%@page import="br.com.controler.PessoaControler"%>
<%@page import="br.com.bean.PessoaFisica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.bean.Usuario"%>
<%@page import="br.com.controler.UsuarioControler"%>

<%
    String cod = request.getParameter("ID");
    int id = Integer.parseInt(cod);
    PessoaFisica pes = new PessoaFisica(id, "", "", "", "");
    PessoaControler pesCont = new PessoaControler();
    pes = pesCont.excluiPessoaFisica(pes);
    String pbusca = request.getParameter("PBUSCA");
    
    // REDIRECIONA PARA A PAG DE CONSULTA PESSOA
    String url = "validaConsultarPessoa.jsp?NOME=" + pbusca;
   response.sendRedirect(url);
%>
