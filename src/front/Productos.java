
package front;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import proyectobases.Conexion;

public class Productos extends javax.swing.JPanel {
    Conexion con;
   
   
    public Productos(Conexion con) {
        initComponents();
        Productosbg.setVisible(true);
        this.con = con;
        datosProductos();
    }
    private void datosGra(){
    Connection conexion=con.getConexion();
    PreparedStatement ps = null;
    ResultSet rs = null;
    DefaultTableModel model = new DefaultTableModel();
    model.addColumn("Tipo");
    model.addColumn("Nombre");
    model.addColumn("Stock");
    model.addColumn("Precio Gramo");
    model.addColumn("Peso Descuento");   
    TablaPro.setModel(model);
    String[] datos = new String[5];
      try {
        ps = conexion.prepareStatement("SELECT * FROM vw_gramaje");
        rs = ps.executeQuery();
        while(rs.next()){
            datos[0]=rs.getString(1);
            datos[1]=rs.getString(2);
            datos[2]=rs.getString(7);
            datos[3]=rs.getString(4);
            datos[4]=rs.getString(5);
            model.addRow(datos);
        }
      } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Error al ejecutar la consulta: " + ex.getMessage());
            }
    
    
    
    
    }
     private void datosProductos(){
    Connection conexion=con.getConexion();
    PreparedStatement ps = null;
    ResultSet rs = null;
    DefaultTableModel model = new DefaultTableModel();
    model.addColumn("Tipo");
    model.addColumn("Nombre");
    model.addColumn("Stock");
    model.addColumn("Precio");
    model.addColumn("Cantidad por mayor");
    model.addColumn("Precio Por mayor");
    TablaPro.setModel(model);
    String[] datos = new String[6];
      try {
        ps = conexion.prepareStatement("SELECT * FROM vw_cantidad");
        rs = ps.executeQuery();
        while(rs.next()){
            datos[0]=rs.getString(1);
            datos[1]=rs.getString(2);
            datos[2]=rs.getString(3);
            datos[3]=rs.getString(4);
            datos[4]=rs.getString(5);
            datos[5]=rs.getString(6);
            model.addRow(datos);
        }
      } catch(SQLException ex){
            JOptionPane.showMessageDialog(null, "Error al ejecutar la consulta: " + ex.getMessage());
            }
    
    }
    
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        Productosbg = new javax.swing.JPanel();
        cantidad = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        TablaPro = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();

        setBackground(new java.awt.Color(204, 255, 204));

        jLabel1.setBackground(new java.awt.Color(0, 102, 0));
        jLabel1.setFont(new java.awt.Font("Segoe UI", 2, 36)); // NOI18N
        jLabel1.setText("Productos");

        Productosbg.setBackground(new java.awt.Color(204, 255, 204));

        javax.swing.GroupLayout ProductosbgLayout = new javax.swing.GroupLayout(Productosbg);
        Productosbg.setLayout(ProductosbgLayout);
        ProductosbgLayout.setHorizontalGroup(
            ProductosbgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 159, Short.MAX_VALUE)
        );
        ProductosbgLayout.setVerticalGroup(
            ProductosbgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 439, Short.MAX_VALUE)
        );

        cantidad.setText("Cantidad");
        cantidad.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cantidadActionPerformed(evt);
            }
        });

        TablaPro.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(TablaPro);

        jButton1.setText("Gramaje");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(Productosbg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 586, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(155, 155, 155))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(320, 320, 320)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(87, 87, 87)
                        .addComponent(cantidad, javax.swing.GroupLayout.PREFERRED_SIZE, 181, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(258, 258, 258)
                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(37, 37, 37)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cantidad, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Productosbg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 255, javax.swing.GroupLayout.PREFERRED_SIZE))))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cantidadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cantidadActionPerformed
datosProductos();        // TODO add your handling code here:
    }//GEN-LAST:event_cantidadActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
datosGra();        // TODO add your handling code here:
    }//GEN-LAST:event_jButton1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel Productosbg;
    private javax.swing.JTable TablaPro;
    private javax.swing.JButton cantidad;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    // End of variables declaration//GEN-END:variables
}
