package br.com.controler;

import br.com.bean.PessoaFisica;
import br.com.bean.Usuario;
import br.com.bean.UsuarioPessoa;
import br.com.db.UsuarioPessoaDao;
import java.sql.SQLException;
import java.util.List;

public class UsuarioPessoaControler {
    
    static UsuarioControler usucont = new UsuarioControler();
    static PessoaControler pescont = new PessoaControler();

    public UsuarioPessoa inserirUsuarioPessoa(UsuarioPessoa usupe) throws SQLException, ClassNotFoundException {
        UsuarioPessoaDao usupesDao = new UsuarioPessoaDao();
        usupe = usupesDao.inseri(usupe);
        return usupe;
    }
    
    public UsuarioPessoa buscarUsuarioPessoa(UsuarioPessoa usupe) throws SQLException, ClassNotFoundException {

        UsuarioPessoaDao usupesDao = new UsuarioPessoaDao();
        usupe = usupesDao.busca(usupe);

        Usuario usu = new Usuario(usupe.getIdUsuario(),"","","","","");
        usu = usucont.buscarUsuario(usu);
        usupe.setUsu(usu);

        PessoaFisica pesfis = new PessoaFisica(usupe.getIdPessoa(),"","","","");
        pesfis = pescont.buscarPessoa(pesfis);
        usupe.setPes(pesfis);

        return usupe;
    }
    
    public UsuarioPessoa excluirUsuarioPessoa(UsuarioPessoa usupe) throws SQLException, ClassNotFoundException {
        UsuarioPessoaDao usupesDao = new UsuarioPessoaDao();
        usupe = usupesDao.exclui(usupe);
        return usupe;
    }

    public UsuarioPessoa alterarUsuarioPessoa(UsuarioPessoa usupe) throws SQLException, ClassNotFoundException {
        UsuarioPessoaDao usupesDao = new UsuarioPessoaDao();
        usupe = usupesDao.altera(usupe);
        return usupe;
    }

    public List<UsuarioPessoa> listarUsuarioPessoa(UsuarioPessoa usupes) throws SQLException, ClassNotFoundException {

        UsuarioPessoaDao usupesDao = new UsuarioPessoaDao();
        List<UsuarioPessoa> ususpes = usupesDao.lista(usupes);

        for (UsuarioPessoa listaUsuarioPessoa : ususpes) {
            Usuario usu = new Usuario(listaUsuarioPessoa.getIdUsuario(),"","","","","");
            PessoaFisica pesfis = new PessoaFisica(listaUsuarioPessoa.getIdPessoa(),"","","","");
            listaUsuarioPessoa.setPes(pescont.buscarPessoa(pesfis));
            listaUsuarioPessoa.setUsu(usucont.buscarUsuario(usu));
        }

        return ususpes;
    }
}
