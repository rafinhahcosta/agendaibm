package br.com.db;

import br.com.bean.UsuarioPessoa;
import br.com.util.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioPessoaDao {
    
    private final Connection c;
    
    public UsuarioPessoaDao() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    
    public UsuarioPessoa altera(UsuarioPessoa usuPes) throws SQLException{
        String sql = "UPDATE usuarios_pessoas SET idPessoa = ?, idUsuario = ?, observacao = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,usuPes.getIdPessoa());
        stmt.setInt(2,usuPes.getIdUsuario());
        stmt.setString(3,usuPes.getObs());
        stmt.setInt(4,usuPes.getIdUsuPes());

        // executa
        stmt.execute();
        stmt.close();
        return usuPes;
    }

    public UsuarioPessoa exclui(UsuarioPessoa usuPes) throws SQLException{
        String sql = "delete from usuarios_pessoas WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,usuPes.getIdUsuPes());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return usuPes;
    }


    public UsuarioPessoa inseri(UsuarioPessoa usuPes) throws SQLException{
        String sql = "insert into usuarios_pessoas" + " (idPessoa, idUsuario, observacao)" + " values (?,?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);

        // seta os valores
        stmt.setInt(1,usuPes.getIdPessoa());
        stmt.setInt(2,usuPes.getIdUsuario());
        stmt.setString(3,usuPes.getObs());

        // executa
        stmt.execute();
        stmt.close();
        return usuPes;
    }
    
    public UsuarioPessoa busca(UsuarioPessoa usuPes) throws SQLException{
        String sql = "select * from usuarios_pessoas WHERE id = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,usuPes.getIdUsuPes());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Usuario
                usuPes.setIdUsuPes(rs.getInt(1));
                usuPes.setIdPessoa(rs.getInt(2));
                usuPes.setIdUsuario(rs.getInt(3));
                usuPes.setObs(rs.getString(4));
                // adiciona o usu à lista de usus
            }
        return usuPes;
    }
    
    public List<UsuarioPessoa> lista(UsuarioPessoa usuPes) throws SQLException{

        List<UsuarioPessoa> usuPess = new ArrayList<>();
        
        String sql = "select * from usuarios_pessoas where observacao like ?";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,"%" + usuPes.getObs()+ "%");
        
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Usuario
            UsuarioPessoa usu = new UsuarioPessoa(
                rs.getInt(1),
                rs.getInt(2),
                rs.getInt(3),
                rs.getString(4)
            );
            // adiciona o usu à lista de usus
            usuPess.add(usu);
        }
        
        rs.close();
        stmt.close();
        return usuPess;
    }
    
}
