package br.com.controler;

import br.com.bean.Usuario;
import br.com.db.UsuarioDao;
import java.sql.SQLException;
import java.util.List;

public class UsuarioControler {
    
    public Usuario validaUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        UsuarioDao usuDao = new UsuarioDao();
        usu = usuDao.validaLogin(usu);
        return usu;
    }
    
    public Usuario inserirUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        UsuarioDao usuDao = new UsuarioDao();
        usu = usuDao.inseri(usu);
        return usu;
    }

    public Usuario excluirUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        UsuarioDao usuDao = new UsuarioDao();
        usu = usuDao.exclui(usu);
        return usu;
    }

    public Usuario buscarUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        UsuarioDao usuDao = new UsuarioDao();
        usu = usuDao.busca(usu);
        return usu;
    }

    public Usuario alterarUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        UsuarioDao usuDao = new UsuarioDao();
        usu = usuDao.altera(usu);
        return usu;
    }
    
    public List<Usuario> listarUsuario(Usuario usu) throws SQLException, ClassNotFoundException {
        List<Usuario>  usus ;
        UsuarioDao usuDao = new UsuarioDao();
        usus = usuDao.lista(usu);
        return usus;
    }

    public List<Usuario> listarTodosUsuario() throws SQLException, ClassNotFoundException {
        List<Usuario>  usus ;
        UsuarioDao usuDao = new UsuarioDao();
        usus = usuDao.listaTodos();
        return usus;
    }

    
}
