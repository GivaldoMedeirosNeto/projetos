package connection;

import java.sql.Connection;
import java.sql.DriverManager;

import constantes.DataHora;

public class SingleConnection {
	
	private static String url = "jdbc:mysql://localhost:3306/ibisnatal?noAccessToProcedureBodies=true";
	private static String user = "ibisnat";
	private static String pass = "T9@vL#7qZ!mP4$Ks";
	private static Connection connection = null;
	
	static {
		conectar();
	}
	
	public SingleConnection() {
		conectar();
	}
	
	private static void conectar() {
		
		try {
			
			if(connection == null) {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, user, pass);
				connection.setAutoCommit(false);
				System.out.println("conexão realizada. ("+new DataHora().dataCompleta()+")");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static Connection getConnection() {
		return connection;
	}

}
