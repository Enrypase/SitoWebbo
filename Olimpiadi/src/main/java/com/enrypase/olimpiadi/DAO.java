package com.enrypase.olimpiadi;

import java.sql.*;
import java.util.ArrayList;

public class DAO {
    
    public int checkUser(String user, String password) throws ClassNotFoundException, SQLException{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito?user=admin&password=1231234");
        
        String query = "SELECT username, passwd FROM sito.users WHERE username='" + user +"';";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        
        System.out.println("STO PER RITORNARE");
        while(rs.next()){
            if(rs.getString("username").equals(user) && rs.getString("passwd").equals(password)){
                return 0;
                //Tutto ok, username trovato
            }
            else if(rs.getString("username").equals(user)){
                System.out.println("1");
                return 1;
                //Wrong password
            }
        }
        System.out.println("-1");
        return -1;
    }
    
    public ArrayList<Atleta> getUserList() throws ClassNotFoundException, SQLException{
        ArrayList<Atleta> atleti = new ArrayList<Atleta>();
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito?user=admin&password=1231234");
        
        String query = "SELECT * FROM sito.atleti ORDER BY punti DESC;";
        PreparedStatement st = conn.prepareStatement(query);
        ResultSet rs = st.executeQuery();
        
        while(rs.next()){
            Atleta a = new Atleta(rs.getString("nome"), rs.getString("cognome"), rs.getInt("punti"));
            atleti.add(a);
        }
        
        return atleti;
    }
    
    public boolean update(String nome, String cognome, int punti) throws ClassNotFoundException, SQLException{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito?user=admin&password=1231234");
        
        String query = "UPDATE sito.atleti SET punti=" + punti + " where nome='" + nome +"' AND cognome='" + cognome +"';";
        PreparedStatement st = conn.prepareStatement(query);
        return st.execute();
                
    }
    
    public boolean insert(String nome, String cognome, int punti) throws ClassNotFoundException, SQLException{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito?user=admin&password=1231234");
        
        String query = "INSERT INTO sito.atleti VALUES('" + nome + "', '" + cognome + "', " + punti + ");";
        PreparedStatement st = conn.prepareStatement(query);
        return st.execute();
                
    }
    
    public boolean delete(String nome, String cognome) throws ClassNotFoundException, SQLException{
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sito?user=admin&password=1231234");
        
        String query = "DELETE FROM sito.atleti WHERE nome='" + nome +"' AND cognome='" + cognome + "';";
        PreparedStatement st = conn.prepareStatement(query);
        return st.execute();
                
    }
    
}