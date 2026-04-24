package executavel;
import org.mindrot.jbcrypt.BCrypt;

import javax.swing.*;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;

public class BcryptGeneratorApp extends JFrame {

    private JTextField senhaField;
    private JTextArea resultadoArea;

    public BcryptGeneratorApp() {
        setTitle("Gerador de Hash BCrypt");
        setSize(400, 220);
        setResizable(false);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        JPanel panel = new JPanel(new BorderLayout(8, 8));

        // Topo
        JPanel topPanel = new JPanel(new BorderLayout(5, 5));
        JLabel label = new JLabel("Digite a senha:");
        senhaField = new JTextField();

        topPanel.add(label, BorderLayout.NORTH);
        topPanel.add(senhaField, BorderLayout.CENTER);

        // Botões
        JButton gerarButton = new JButton("Gerar Hash");
        gerarButton.setPreferredSize(new Dimension(120, 30));
        gerarButton.addActionListener(this::gerarHash);

        JButton copiarButton = new JButton("Copiar");
        copiarButton.setPreferredSize(new Dimension(100, 30));
        copiarButton.addActionListener(e -> copiarHash());

        JPanel buttonPanel = new JPanel();
        buttonPanel.add(gerarButton);
        buttonPanel.add(copiarButton);

        // Resultado
        resultadoArea = new JTextArea(3, 25);
        resultadoArea.setLineWrap(true);
        resultadoArea.setWrapStyleWord(true);
        resultadoArea.setEditable(false);

        JScrollPane scrollPane = new JScrollPane(resultadoArea);

        panel.add(topPanel, BorderLayout.NORTH);
        panel.add(buttonPanel, BorderLayout.CENTER);
        panel.add(scrollPane, BorderLayout.SOUTH);

        add(panel);
    }

    private void gerarHash(ActionEvent e) {
        String senha = senhaField.getText();

        if (senha.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Digite uma senha!");
            return;
        }

        String hash = BCrypt.hashpw(senha, BCrypt.gensalt(10));
        resultadoArea.setText(hash);
    }

    private void copiarHash() {
        String hash = resultadoArea.getText();

        if (hash.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Nada para copiar!");
            return;
        }

        StringSelection selection = new StringSelection(hash);
        Toolkit.getDefaultToolkit().getSystemClipboard().setContents(selection, null);

        JOptionPane.showMessageDialog(this, "Hash copiado!");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new BcryptGeneratorApp().setVisible(true));
    }
}

