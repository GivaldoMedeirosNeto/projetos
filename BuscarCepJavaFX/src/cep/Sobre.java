package cep;

import java.awt.EventQueue;

import javax.swing.JDialog;
import java.awt.Toolkit;
import java.net.URI;

import javax.swing.JLabel;
import java.awt.SystemColor;
import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

@SuppressWarnings("serial")
public class Sobre extends JDialog {
	
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Sobre dialog = new Sobre();
					dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					dialog.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public Sobre() {
		setModal(true);
		setResizable(false);
		setTitle("Sobre");
		setIconImage(Toolkit.getDefaultToolkit().getImage(Sobre.class.getResource("/img/Home 48x48.png")));
		setBounds(115, 150, 309, 219);
		getContentPane().setLayout(null);
		
		JLabel lblVersao = new JLabel("Versão: ");
		lblVersao.setBounds(37, 90, 69, 14);
		getContentPane().add(lblVersao);
		
		JLabel lblVersaoNumero = new JLabel("1.0");
		lblVersaoNumero.setBounds(37, 105, 69, 14);
		getContentPane().add(lblVersaoNumero);
		
		JLabel lblDesenvolvido = new JLabel("Desenvilvido por: ");
		lblDesenvolvido.setBounds(37, 38, 200, 23);
		getContentPane().add(lblDesenvolvido);
		
		JLabel lblNome = new JLabel("Givaldo Medeiros Neto");
		lblNome.setBounds(37, 56, 200, 23);
		getContentPane().add(lblNome);
		
		JLabel lblWebService = new JLabel("Web Service: ");
		lblWebService.setBounds(133, 90, 83, 14);
		getContentPane().add(lblWebService);
		
		JLabel lblLink = new JLabel("viacep.com.br");
		lblLink.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				link("http://viacep.com.br");
			}
		});
		
		lblLink.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lblLink.setForeground(SystemColor.textHighlight);
		lblLink.setBounds(133, 105, 160, 14);
		getContentPane().add(lblLink);	

	}
	
	private void link (String link) {
		Desktop desktop = Desktop.getDesktop();
		try {
			URI uri = new URI(link);
			desktop.browse(uri);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
