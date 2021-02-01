package com.enrypase.olimpiadi;

public class Atleta {
    
    private String nome, cognome;
    private int punteggio;
    
    public Atleta(String nome, String cognome, int punteggio){
        this.nome = nome;
        this.cognome = cognome;
        this.punteggio = punteggio;
    }
    
    public void setNome(String nome){
        this.nome = nome;
    }
    public void setCognome(String cognome){
        this.cognome = cognome;
    }
    public void setPunteggio(int punteggio){
        this.punteggio = punteggio;
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public int getPunteggio() {
        return punteggio;
    }
    
    public String toString(){
        String oggetto = "Atleta: " + nome + ", " + cognome;
        return oggetto;
    }
}
