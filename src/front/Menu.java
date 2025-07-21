/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package front;
import java.sql.*;

import java.awt.BorderLayout;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import proyectobases.Conexion;

public class Menu extends javax.swing.JFrame {
    Conexion con;
   
  
    public Menu(Conexion con){
        initComponents();
        this.con= con;
        setLocationRelativeTo(null);
        if("Cliente".equals(con.getRol())){
        menuProveedores.setVisible(false);
        menuPedidos.setVisible(false);
        menuEmpleados.setVisible(false);
      
        }else if("Empleado".equals(con.getRol())){
        menuProveedores.setVisible(false);
        }
        
        Productos p = new Productos(con);     
        changePanel(p);
    }

   
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenu1 = new javax.swing.JPopupMenu();
        jMenuBar2 = new javax.swing.JMenuBar();
        jMenu3 = new javax.swing.JMenu();
        jMenu4 = new javax.swing.JMenu();
        jMenuBar3 = new javax.swing.JMenuBar();
        jMenu5 = new javax.swing.JMenu();
        jMenu6 = new javax.swing.JMenu();
        jMenuItem1 = new javax.swing.JMenuItem();
        jMenuItem2 = new javax.swing.JMenuItem();
        jCheckBoxMenuItem1 = new javax.swing.JCheckBoxMenuItem();
        jMenuItem3 = new javax.swing.JMenuItem();
        jMenuItem4 = new javax.swing.JMenuItem();
        background = new javax.swing.JPanel();
        jMenuBar4 = new javax.swing.JMenuBar();
        menuProductos = new javax.swing.JMenu();
        menuFacturas = new javax.swing.JMenu();
        menuClientes = new javax.swing.JMenu();
        menuEmpleados = new javax.swing.JMenu();
        menuPedidos = new javax.swing.JMenu();
        menuProveedores = new javax.swing.JMenu();

        jMenu3.setText("File");
        jMenuBar2.add(jMenu3);

        jMenu4.setText("Edit");
        jMenuBar2.add(jMenu4);

        jMenu5.setText("File");
        jMenuBar3.add(jMenu5);

        jMenu6.setText("Edit");
        jMenuBar3.add(jMenu6);

        jMenuItem1.setText("jMenuItem1");

        jMenuItem2.setText("jMenuItem2");

        jCheckBoxMenuItem1.setSelected(true);
        jCheckBoxMenuItem1.setText("jCheckBoxMenuItem1");

        jMenuItem3.setText("jMenuItem3");

        jMenuItem4.setText("jMenuItem4");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout backgroundLayout = new javax.swing.GroupLayout(background);
        background.setLayout(backgroundLayout);
        backgroundLayout.setHorizontalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 841, Short.MAX_VALUE)
        );
        backgroundLayout.setVerticalGroup(
            backgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 448, Short.MAX_VALUE)
        );

        jMenuBar4.setBackground(new java.awt.Color(153, 153, 255));
        jMenuBar4.setBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jMenuBar4.setForeground(new java.awt.Color(0, 102, 0));

        menuProductos.setText("Productos");
        menuProductos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuProductosMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuProductos);

        menuFacturas.setText("Facturas");
        menuFacturas.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuFacturasMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuFacturas);

        menuClientes.setText("Clientes");
        menuClientes.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuClientesMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuClientes);

        menuEmpleados.setText("Empleados");
        menuEmpleados.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuEmpleadosMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuEmpleados);

        menuPedidos.setText("Pedidos");
        menuPedidos.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuPedidosMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuPedidos);

        menuProveedores.setBackground(new java.awt.Color(0, 204, 255));
        menuProveedores.setText("Proveedores");
        menuProveedores.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                menuProveedoresMouseClicked(evt);
            }
        });
        jMenuBar4.add(menuProveedores);

        setJMenuBar(jMenuBar4);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void menuProductosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuProductosMouseClicked
 Productos p = new Productos(con);     
 changePanel(p);
    }//GEN-LAST:event_menuProductosMouseClicked

    private void menuFacturasMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuFacturasMouseClicked
        Facturas f = new Facturas(con);
        changePanel(f);
    }//GEN-LAST:event_menuFacturasMouseClicked

    private void menuClientesMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuClientesMouseClicked
     if(con.getRol()=="Cliente"){Cliente p = new Cliente(con);
     changePanel(p);}else{
     Cliente2 p = new Cliente2(con);
     changePanel(p);
     }
    }//GEN-LAST:event_menuClientesMouseClicked

    private void menuEmpleadosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuEmpleadosMouseClicked
Empleados e = new Empleados(con);
changePanel(e);
    }//GEN-LAST:event_menuEmpleadosMouseClicked

    private void menuPedidosMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuPedidosMouseClicked
Pedidos p = new Pedidos(con);
changePanel(p);// TODO add your handling code here:
    }//GEN-LAST:event_menuPedidosMouseClicked

    private void menuProveedoresMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_menuProveedoresMouseClicked
Proveedores p = new Proveedores();        // TODO add your handling code here:
changePanel(p);
    }//GEN-LAST:event_menuProveedoresMouseClicked
private void changePanel(JPanel p){
    p.setSize(841,453);
    p.setLocation(0,0);
    background.removeAll();
    background.add(p,BorderLayout.CENTER);
    background.revalidate();
    background.repaint();

}
    /**
     * @param args the command line arguments
     */


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel background;
    private javax.swing.JCheckBoxMenuItem jCheckBoxMenuItem1;
    private javax.swing.JMenu jMenu3;
    private javax.swing.JMenu jMenu4;
    private javax.swing.JMenu jMenu5;
    private javax.swing.JMenu jMenu6;
    private javax.swing.JMenuBar jMenuBar2;
    private javax.swing.JMenuBar jMenuBar3;
    private javax.swing.JMenuBar jMenuBar4;
    private javax.swing.JMenuItem jMenuItem1;
    private javax.swing.JMenuItem jMenuItem2;
    private javax.swing.JMenuItem jMenuItem3;
    private javax.swing.JMenuItem jMenuItem4;
    private javax.swing.JPopupMenu jPopupMenu1;
    private javax.swing.JMenu menuClientes;
    private javax.swing.JMenu menuEmpleados;
    private javax.swing.JMenu menuFacturas;
    private javax.swing.JMenu menuPedidos;
    private javax.swing.JMenu menuProductos;
    private javax.swing.JMenu menuProveedores;
    // End of variables declaration//GEN-END:variables
}
