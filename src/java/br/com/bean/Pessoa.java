package br.com.bean;

public class Pessoa {
    
    String nome;
    String tipo;
    String email;
    String Cpf;

    public Pessoa(String nome, String Cpf , String tipo, String email ) {
        this.nome = nome;
        this.tipo = tipo;
        this.email = email;
        this.Cpf = Cpf;
    }
    
    

    public String getCpf() {
        return Cpf;
    }

    public void setCpf(String Cpf) {
        this.Cpf = Cpf;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
