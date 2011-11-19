
package interfaz;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import logica.Asistente;
import logica.Datosbd;
import logica.Universidad;

public class DiaInscripcion extends javax.swing.JDialog {
    private Datosbd bd;
    private List<Universidad> universidad;
    /** Creates new form DiaInscripcion */
    public DiaInscripcion( JFrame parent, Datosbd bdx) {
        super(parent);
        initComponents();
        this.setTitle( App.NAME );
        bd = bdx;
        universidad = new ArrayList();
        this.cargarUniversidad();
    }
    
    private boolean validar(){
        boolean correcto = false;
        if( !txtApellidos.getText().isEmpty() &&
            !txtCorreo.getText().isEmpty() && 
            !txtNombre.getText().isEmpty() &&
            !txtDni.getText().isEmpty() )
        {
            correcto = true;
        }else{
            JOptionPane.showMessageDialog(this,"Debe llenar todos los campos",App.NAME 
                    , JOptionPane.INFORMATION_MESSAGE);
        }
        return correcto;
    }
  
    private void guardar()
    {
        String dni = "" ,nombre = "",apellidos = "",correo= "",tipo = "";
        Universidad   uni;
         dni = txtDni.getText();
         nombre = txtNombre.getText();
         apellidos = txtApellidos.getText();
         correo = txtCorreo.getText();
         tipo += cmbTipo.getSelectedItem().toString().charAt(0);
         uni =  (Universidad) cmbUniversidades.getSelectedItem();
         
      Asistente asistente = new Asistente();   
         asistente.setDni(dni);
         asistente.setNombres(nombre);
         asistente.setApellidos(apellidos);
         asistente.setCorreo(correo);
         asistente.setTipo(tipo);
         asistente.setUniversidad(uni);
        try {
            bd.addAsistente(asistente);
            JOptionPane.showMessageDialog(this,"Inscripcion Existosa",App.NAME 
                    , JOptionPane.INFORMATION_MESSAGE);
            this.dispose();
        }
        catch (ClassNotFoundException ex)
        {
           JOptionPane.showMessageDialog(this, ex.getMessage(),
                   App.NAME,JOptionPane.ERROR_MESSAGE);
        } 
        catch (SQLException ex) 
        {
           JOptionPane.showMessageDialog(this, ex.getMessage() ,
                  App.NAME,JOptionPane.ERROR_MESSAGE);
        }
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        java.awt.GridBagConstraints gridBagConstraints;

        jPanel1 = new javax.swing.JPanel();
        cmdAceptar = new javax.swing.JButton();
        jLabel6 = new javax.swing.JLabel();
        txtDni = new javax.swing.JTextField();
        cmdNuevaUniversidad = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        txtApellidos = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txtCorreo = new javax.swing.JTextField();
        cmbUniversidades = new javax.swing.JComboBox();
        jLabel2 = new javax.swing.JLabel();
        cmbTipo = new javax.swing.JComboBox();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);

        jPanel1.setBackground(new java.awt.Color(204, 255, 204));
        jPanel1.setLayout(new java.awt.GridBagLayout());

        cmdAceptar.setFont(new java.awt.Font("Tahoma", 1, 18)); // NOI18N
        cmdAceptar.setText("Guardar");
        cmdAceptar.setPreferredSize(new java.awt.Dimension(107, 50));
        cmdAceptar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdAceptarActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 6;
        gridBagConstraints.gridwidth = 3;
        gridBagConstraints.fill = java.awt.GridBagConstraints.BOTH;
        jPanel1.add(cmdAceptar, gridBagConstraints);

        jLabel6.setText("Nombre:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 1;
        jPanel1.add(jLabel6, gridBagConstraints);

        txtDni.setPreferredSize(new java.awt.Dimension(200, 30));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 0;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(txtDni, gridBagConstraints);

        cmdNuevaUniversidad.setText("Nuevo...");
        cmdNuevaUniversidad.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdNuevaUniversidadActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 2;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.insets = new java.awt.Insets(0, 20, 0, 0);
        jPanel1.add(cmdNuevaUniversidad, gridBagConstraints);

        jLabel1.setText("Dni:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 0;
        jPanel1.add(jLabel1, gridBagConstraints);

        txtApellidos.setPreferredSize(new java.awt.Dimension(200, 30));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 2;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(txtApellidos, gridBagConstraints);

        jLabel9.setText("Tipo:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 4;
        jPanel1.add(jLabel9, gridBagConstraints);

        txtNombre.setPreferredSize(new java.awt.Dimension(200, 30));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 1;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(txtNombre, gridBagConstraints);

        jLabel7.setText("Apellidos:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 2;
        jPanel1.add(jLabel7, gridBagConstraints);

        txtCorreo.setPreferredSize(new java.awt.Dimension(200, 30));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 3;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(txtCorreo, gridBagConstraints);

        cmbUniversidades.setModel(new javax.swing.DefaultComboBoxModel(new String[] { " " }));
        cmbUniversidades.setPreferredSize(new java.awt.Dimension(200, 30));
        cmbUniversidades.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbUniversidadesActionPerformed(evt);
            }
        });
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 5;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(cmbUniversidades, gridBagConstraints);

        jLabel2.setText("Universidad:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 5;
        jPanel1.add(jLabel2, gridBagConstraints);

        cmbTipo.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Estudiante", "Profesional" }));
        cmbTipo.setPreferredSize(new java.awt.Dimension(200, 30));
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 1;
        gridBagConstraints.gridy = 4;
        gridBagConstraints.insets = new java.awt.Insets(5, 5, 5, 0);
        jPanel1.add(cmbTipo, gridBagConstraints);

        jLabel8.setText("Correo:");
        gridBagConstraints = new java.awt.GridBagConstraints();
        gridBagConstraints.gridx = 0;
        gridBagConstraints.gridy = 3;
        jPanel1.add(jLabel8, gridBagConstraints);

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-399)/2, (screenSize.height-350)/2, 399, 350);
    }// </editor-fold>//GEN-END:initComponents
 
    private void cargarUniversidad(){
        try {
            universidad = bd.allUniversidades();
            this.cmbUniversidades.removeAllItems();
            for( Object obj :universidad){
                cmbUniversidades.addItem(obj);
            }
        }catch (ClassNotFoundException ex) {
            //Logger.getLogger(DiaInscripcion.class.getName()).log(Level.SEVERE, null, ex);
        }catch (SQLException ex){
            //Logger.getLogger(MainFrame.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
private void cmdAceptarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdAceptarActionPerformed
    if( this.validar())
        guardar();
}//GEN-LAST:event_cmdAceptarActionPerformed

private void cmdNuevaUniversidadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdNuevaUniversidadActionPerformed
    DiaUniversidad frm = new DiaUniversidad(null,true,bd);
    frm.setVisible(true);
    this.cargarUniversidad();
}//GEN-LAST:event_cmdNuevaUniversidadActionPerformed

private void cmbUniversidadesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbUniversidadesActionPerformed
    
}//GEN-LAST:event_cmbUniversidadesActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox cmbTipo;
    private javax.swing.JComboBox cmbUniversidades;
    private javax.swing.JButton cmdAceptar;
    private javax.swing.JButton cmdNuevaUniversidad;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField txtApellidos;
    private javax.swing.JTextField txtCorreo;
    private javax.swing.JTextField txtDni;
    private javax.swing.JTextField txtNombre;
    // End of variables declaration//GEN-END:variables
}
