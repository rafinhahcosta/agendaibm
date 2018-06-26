package br.com.controler;

import br.com.bean.Agenda;
import br.com.db.AgendaDao;
import java.sql.SQLException;
import java.util.List;

public class AgendaControler {
    
    public List<Agenda> listarTodosAgenda(Agenda ageEnt) throws SQLException, ClassNotFoundException {
        List<Agenda>  age ;
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.lista(ageEnt);
        return age;
    }
    
    public List<Agenda> listarTodos() throws SQLException, ClassNotFoundException {
        List<Agenda> age ;
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.listaTodos();
        return age;
    }
    
    public Agenda buscarAgenda(Agenda age) throws SQLException, ClassNotFoundException {
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.busca(age);
        return age;
    }
    
     public Agenda inserirAgenda(Agenda age) throws SQLException, ClassNotFoundException {
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.inseri(age);
        return age;
    }
     
     public Agenda alteraAgenda (Agenda age) throws SQLException, ClassNotFoundException {
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.altera(age);
        return age;
     }
     
     public Agenda excluiAgenda (Agenda age) throws SQLException, ClassNotFoundException {
        AgendaDao ageDao = new AgendaDao();
        age = ageDao.exclui(age);
        return age;
     }
    
}
