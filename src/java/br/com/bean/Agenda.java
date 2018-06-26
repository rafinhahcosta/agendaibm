package br.com.bean;

public class Agenda  {
    
    private int idReserva;
    private int ano;
    private int mes;
    private int dia;
    private String horario;
    private String obs;
    private int idPessoa;

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public Agenda(int idReserva, int ano, int mes, int dia, String horario, String obs, int idPessoa) {
        this.idReserva = idReserva;
        this.ano = ano;
        this.mes = mes;
        this.dia = dia;
        this.horario = horario;
        this.obs = obs;
        this.idPessoa = idPessoa;
    }
    
    

      public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }
    
}


