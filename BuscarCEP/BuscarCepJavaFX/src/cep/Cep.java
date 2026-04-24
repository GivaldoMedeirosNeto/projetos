package cep;

import java.awt.Cursor;
import java.awt.EventQueue;
import java.awt.SystemColor;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.Iterator;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import Atxy2k.CustomTextField.RestrictedTextField;

@SuppressWarnings("serial")
public class Cep extends JFrame {

	private JPanel contentPane;
	private JTextField txtCep;
	private JTextField txtEndereco;
	private JTextField txtBairro;
	private JTextField txtCidade;
	private JTextField txtUF;
	private JLabel lblStatus;

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Cep frame = new Cep();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public Cep() {
		setTitle("BuscarCep");
		setResizable(false);
		setIconImage(Toolkit.getDefaultToolkit().getImage(Cep.class.getResource("/img/Search 2 48x48.png")));
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 337, 293);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("CEP:");
		lblNewLabel.setBounds(25, 15, 46, 14);
		contentPane.add(lblNewLabel);
		
		txtCep = new JTextField();
		txtCep.setBounds(25, 29, 86, 20);
		contentPane.add(txtCep);
		txtCep.setColumns(10);
		
		JLabel lblEndereo = new JLabel("Endere\u00E7o:");
		lblEndereo.setBounds(25, 60, 57, 14);
		contentPane.add(lblEndereo);
		
		txtEndereco = new JTextField();
		txtEndereco.setColumns(10);
		txtEndereco.setBounds(25, 74, 276, 20);
		contentPane.add(txtEndereco);
		
		JLabel lblNewLabel_1_1 = new JLabel("Bairro:");
		lblNewLabel_1_1.setBounds(25, 101, 46, 14);
		contentPane.add(lblNewLabel_1_1);
		
		txtBairro = new JTextField();
		txtBairro.setColumns(10);
		txtBairro.setBounds(25, 116, 276, 20);
		contentPane.add(txtBairro);
		
		JLabel lblNewLabel_1_2 = new JLabel("Cidade:");
		lblNewLabel_1_2.setBounds(25, 147, 46, 14);
		contentPane.add(lblNewLabel_1_2);
		
		txtCidade = new JTextField();
		txtCidade.setColumns(10);
		txtCidade.setBounds(25, 163, 193, 20);
		contentPane.add(txtCidade);
		
		JLabel lblNewLabel_1_2_1 = new JLabel("UF:");
		lblNewLabel_1_2_1.setBounds(234, 147, 27, 14);
		contentPane.add(lblNewLabel_1_2_1);
		
		JButton btnBuscar = new JButton("");
		btnBuscar.setToolTipText("Pesquisar");
		btnBuscar.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnBuscar.setBorder(null);
		btnBuscar.setForeground(SystemColor.control);
		btnBuscar.setBackground(SystemColor.control);
		btnBuscar.setIcon(new ImageIcon(Cep.class.getResource("/img/search 48x48.png")));
		btnBuscar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(txtCep.getText().equals("")) {
					JOptionPane.showMessageDialog(null, "Informe um CEP");
					txtCep.requestFocus();
				} else {
					buscarCep();
				}
			}
		});
		btnBuscar.setBounds(114, 15, 48, 48);
		contentPane.add(btnBuscar);
		
		JButton btnSobre = new JButton("");
		btnSobre.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {				
				Sobre sobre = new Sobre();
				sobre.setVisible(true);				
			}
		});
		btnSobre.setToolTipText("Sobre");
		btnSobre.setIcon(new ImageIcon(Cep.class.getResource("/img/About 48x48.png")));
		btnSobre.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		btnSobre.setBorder(null);
		btnSobre.setBackground(SystemColor.control);
		btnSobre.setBounds(175, 194, 48, 48);
		contentPane.add(btnSobre);
		
		JButton btnLimpar = new JButton("");
		btnLimpar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {				
				limpar();				
			}
		});
		btnLimpar.setIcon(new ImageIcon(Cep.class.getResource("/img/Clean 48x48.png")));
		btnLimpar.setToolTipText("Limpar");
		btnLimpar.setForeground(SystemColor.menu);
		btnLimpar.setBorder(null);
		btnLimpar.setBackground(SystemColor.menu);
		btnLimpar.setBounds(85, 194, 48, 48);
		contentPane.add(btnLimpar);
		
		txtUF = new JTextField();
		txtUF.setColumns(10);
		txtUF.setBounds(235, 163, 66, 20);
		contentPane.add(txtUF);
		
		RestrictedTextField validar = new RestrictedTextField(txtCep);
		
		lblStatus = new JLabel("");
		lblStatus.setBounds(170, 15, 48, 48);
		contentPane.add(lblStatus);
		validar.setOnlyNums(true);
		validar.setLimit(8);
		
	}
	
	private void buscarCep() {
			
		try {
			//URL url = new URL("http://cep.republicavirtual.com.br/web_cep.php?cep=" + txtCep.getText() + "&formato=xml");
			URL url = new URL("http://viacep.com.br/ws/" + txtCep.getText() + "/xml/");
			SAXReader xml = new SAXReader();
			Document document = xml.read(url);
			Element root = document.getRootElement();
			
			for (Iterator<Element> it = root.elementIterator(); it.hasNext();) {
		        Element element = it.next();
		        
		        if(element.getQualifiedName().equals("erro")) {
		        	JOptionPane.showMessageDialog(null, "CEP n�o encontrado");
	        		lblStatus.setIcon(new javax.swing.ImageIcon(getClass().getResource("")));
		        	
		        }
		             
		        if(element.getQualifiedName().equals("logradouro")) {
		        	txtEndereco.setText(txtEndereco.getText() + " " + element.getText());
		        }
		        
		        if(element.getQualifiedName().equals("bairro")) {
		        	txtBairro.setText(element.getText());
		        }
		        
		        if(element.getQualifiedName().equals("localidade")) {
		        	txtCidade.setText(element.getText());
		        }
		        
		        if(element.getQualifiedName().equals("uf")) {
		        	txtUF.setText(element.getText());
		        }
		        
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	private void limpar() {
		txtCep.setText(null);
		txtEndereco.setText(null);
		txtBairro.setText(null);
		txtCidade.setText(null);
		txtUF.setText(null);
		lblStatus.setIcon(new javax.swing.ImageIcon(getClass().getResource("")));
	}
	
}
