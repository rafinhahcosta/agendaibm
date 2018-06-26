package br.com.controler;

import br.com.bean.PessoaFisica;
import br.com.db.PessoaDao;
import java.sql.SQLException;
import java.util.List;

public class PessoaControler {
    
    public List<PessoaFisica> listarTodosPessoa(PessoaFisica pesEnt) throws SQLException, ClassNotFoundException {
        List<PessoaFisica>  pess ;
        PessoaDao pesDao = new PessoaDao();
        pess = pesDao.lista(pesEnt);
        return pess;
    }
    
    public List<PessoaFisica> listarTodos() throws SQLException, ClassNotFoundException {
        List<PessoaFisica>  pess ;
        PessoaDao pesDao = new PessoaDao();
        pess = pesDao.listaTodos();
        return pess;
    }
    
    public PessoaFisica buscarPessoa(PessoaFisica pes) throws SQLException, ClassNotFoundException {
        PessoaDao pesDao = new PessoaDao();
        pes = pesDao.busca(pes);
        return pes;
    }
    
    public PessoaFisica inserirPessoa(PessoaFisica pes) throws SQLException, ClassNotFoundException {
        PessoaDao pesDao = new PessoaDao();
        pes = pesDao.inseri(pes);
        return pes;
    }
     
     public PessoaFisica alteraPessoaFisica (PessoaFisica pes) throws SQLException, ClassNotFoundException {
        PessoaDao pesDao = new PessoaDao();
        pes = pesDao.altera(pes);
        return pes;     
     }
     
     public PessoaFisica excluiPessoaFisica (PessoaFisica pes) throws SQLException, ClassNotFoundException {
        PessoaDao pesDao = new PessoaDao();
        pes = pesDao.exclui(pes);
        return pes;     
     }
    
        
}
