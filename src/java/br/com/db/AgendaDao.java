package br.com.db;

import br.com.util.ConexaoDB;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import br.com.bean.Agenda;
import java.sql.Statement;

public class AgendaDao {

    private final Connection c;

    public AgendaDao() throws SQLException, ClassNotFoundException {
        this.c = new ConexaoDB().getConnection();
    }

    public Agenda busca(Agenda age) throws SQLException {
        String sql = "select * from agenda WHERE id = ?";

        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, age.getIdReserva());
        // executa
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            // criando o objeto Agenda
            age.setIdReserva(rs.getInt(1));
            age.setAno(rs.getInt(2));
            age.setMes(rs.getInt(3));
            age.setDia(rs.getInt(4));
            age.setHorario(rs.getString(5));
            age.setObs(rs.getString(6));
            age.setIdPessoa(rs.getInt(7));
          
        }
        return age;
    }

    public Agenda altera(Agenda age) throws SQLException {
        String sql = "UPDATE agenda SET ano = ?, mes = ?, dia = ?, horario = ?, obs = ?, idPessoa = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, age.getAno());
        stmt.setInt(2, age.getMes());
        stmt.setInt(3, age.getDia());
        stmt.setString(4, age.getHorario());
        stmt.setString(5, age.getObs());
        stmt.setInt(6, age.getIdPessoa());
        stmt.setInt(7, age.getIdReserva());
        
        // executa
        stmt.execute();
        stmt.close();
        return age;
    }

    public Agenda exclui(Agenda age) throws SQLException {
        String sql = "delete from agenda WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, age.getIdReserva());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return age;
    }

    public List<Agenda> lista(Agenda ageEnt) throws SQLException {
        // funs: array armazena a lista de registros

        List<Agenda> ages = new ArrayList<>();

        String sql = "select * from agenda where ano = ? and mes = ? and dia = ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1, ageEnt.getAno());
        stmt.setInt(2, ageEnt.getMes());
        stmt.setInt(3, ageEnt.getDia());
        
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            // criando o objeto Agenda
            Agenda age = new Agenda(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getInt(7)
            );
            // adiciona o fun à lista de funs
            ages.add(age);
        }

        rs.close();
        stmt.close();
        return ages;

    }

    public List<Agenda> listaTodos() throws SQLException {
        // funs: array armazena a lista de registros

        List<Agenda> ages = new ArrayList<Agenda>();

        String sql = "select * from agenda";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            // criando o objeto Agenda
            Agenda age = new Agenda(
                    rs.getInt(1),
                    rs.getInt(2),
                    rs.getInt(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getInt(7)
            );
            // adiciona o fun à lista de funs
            ages.add(age);
        }

        rs.close();
        stmt.close();
        return ages;

    }

    public Agenda inseri(Agenda age) throws SQLException {
        String sql = "insert into agenda " + "(ano,mes,dia,horario,obs,idPessoa)" + "values (?,?,?,?,?,?)";

        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setInt(1, age.getAno());
        stmt.setInt(2, age.getMes());
        stmt.setInt(3, age.getDia());
        stmt.setString(4, age.getHorario());
        stmt.setString(5, age.getObs());
        stmt.setInt(6, age.getIdPessoa());
        
        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            age.setIdReserva(id);
        }
        stmt.close();
        return age;
    }

}
