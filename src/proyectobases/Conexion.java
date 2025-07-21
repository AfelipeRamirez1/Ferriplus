/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package proyectobases;

/**
 *
 * @author ramir
 */


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
public class Conexion {
    private static Connection conexion;
    private static final String bd="ferriplus";
    private static final String host="localhost";
    private static String Rol;
    private static final String server="jdbc:mysql://"+host+"/"+bd;
    private static String user;
    private static String pass;

    public static Connection getConexion() {
        return conexion;
    }

    public static void setConexion(Connection conexion) {
        Conexion.conexion = conexion;
    }
    private static int id;

    public static int getId() {
        return id;
    }

    public static void setId(int id) {
        Conexion.id = id;
    }
   
    public  Connection crearConexion(String usuario,String password){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            setUser(usuario);
            setPass(password);
            conexion = DriverManager.getConnection(server,usuario,pass);
            System.out.println("conexion ok");
            
      
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Usuario y/o contraseña incorrectos");
            
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conexion;
    }

    public static String getUser() {
        return user;
    }

    public static void setUser(String user) {
        Conexion.user = user;
    }

    public static String getPass() {
        return pass;
    }

    public static void setPass(String pass) {
        Conexion.pass = pass;
    }
 
    public String conseguirRol(String user) {
    PreparedStatement ps = null;
    ResultSet rs = null;
    String rol = null;
    String sql = "SELECT * FROM cliente JOIN persona ON cliente.Per_ID = persona.per_ID WHERE Per_Nombre = ?;";

    try {
        ps = conexion.prepareStatement("SELECT * FROM cliente JOIN persona ON cliente.Per_ID = persona.per_ID WHERE Per_Nombre = ?;");
        ps.setString(1, user);
        rs = ps.executeQuery();

    
        if (rs.next()) {
            Rol="Cliente";
            id=rs.getInt("Per_ID");
            System.out.println(getRol());
            System.out.println(getId());
        }else{
            try{
            ps = conexion.prepareStatement("SELECT * FROM empleado JOIN persona ON empleado.Per_ID = persona.per_ID WHERE Per_Nombre = ? and Emp_Tipo =\"Regular\";");
            ps.setString(1,user);
            rs = ps.executeQuery();
            if(rs.next()){
            Rol ="Empleado";
            id=rs.getInt("Per_ID");
            System.out.println(getRol());
            System.out.println(getId());
                     
            } else {
                try{
                ps = conexion.prepareStatement("SELECT * FROM empleado JOIN persona ON empleado.Per_ID = persona.per_ID WHERE Per_Nombre = ? and Emp_Tipo =\"Admin\";");
                ps.setString(1,user);
                rs = ps.executeQuery();
                if(rs.next()){
                Rol ="Administrador";
                id=rs.getInt("Per_ID");
                System.out.println(getRol());
                System.out.println(getId());
                }
                
                }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Error al ejecutar la consulta: " + ex.getMessage());
            }
            Rol="Administrador";
            
            }
            
  
            }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Error al ejecutar la consulta: " + ex.getMessage());
            }
            
        
        }
    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(null, "Error al ejecutar la consulta: " + ex.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    return Rol;
}




    public static String getRol() {
        return Rol;
    }

    public static void setRol(String Rol) {
        Conexion.Rol = Rol;
    }
        
        public static void main(String[] args) {
        Conexion conexion = new Conexion();
        conexion.crearConexion("administrador", "administrador");
        conexion.conseguirRol(user);
        
        
    }
 
    }

   