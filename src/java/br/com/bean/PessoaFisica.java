
package br.com.bean;

public class PessoaFisica extends Pessoa{
    
    private int idPessoa;
    

    public PessoaFisica(int idPessoa, String nome, String Cpf ,String tipo, String email) {
        super(nome, Cpf, tipo, email);
        this.idPessoa = idPessoa;
        
    }



    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }


    
    
    
}
