package br.vet.petclini.connection;

import java.sql.Connection;
import java.sql.DriverManager;

/** Classe SingleConnection - Acesso ao banco de dados utilizando uma conexão única.
 * <br>
 * Essa classe é responsável por fornecer uma conexão única ao banco de dados MySQL.
 * A conexão é estabelecida usando o driver JDBC do MySQL e a configuração padrão de URL,
 * nome de usuário e senha fornecidos nesta classe.
 * <br>
 * Utilização:
 * 1. Certifique-se de que o servidor MySQL está em execução e acessível através da URL fornecida.
 * 2. Inclua o driver JDBC do MySQL (por exemplo, "mysql-connector-java") em seu projeto.
 * 3. Chame o método "conectar()" para obter a conexão com o banco de dados.
 * 4. Após concluir as operações no banco de dados, não se esqueça de fechar a conexão
 *    utilizando o método "fecharConexao()" para liberar os recursos adequadamente.
 * <br>
 * Exemplo:
 * SingleConnection.conectar();
 * // Realizar operações no banco de dados usando a conexão obtida
 * SingleConnection.fecharConexao();
 * 
 * @throws ClassNotFoundException se a classe do driver do MySQL não for encontrada.
 * @throws SQLException se ocorrer algum erro ao estabelecer a conexão.
 * 
 * @version 1.0
 * @since Criação: 04/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class SingleConnection {
	
	private static String url =
			"jdbc:mysql://15.235.55.109:3306/gival3008_petclini_homologacao?noAccessToProcedureBodies=true";
	private static String user = "gival3008_teste";
	private static String pass = "T3st3@p3tcl1n1";
	private static Connection connection = null;
	
	static {
		conectar();
	}
	
	/* Constructors */
	public SingleConnection() {
		conectar();
	}
	
	/* Methods */
	
	/** Estabelece uma conexão com o banco de dados MySQL.
	 * 
	 * Esse método é responsável por criar uma conexão com o banco de dados utilizando
	 * o driver JDBC do MySQL. A conexão será configurada para desativar o modo de
	 * confirmação automática de transações.
	 * 
	 * @throws ClassNotFoundException se a classe do driver do MySQL não for encontrada.
	 * @throws SQLException se ocorrer algum erro ao estabelecer a conexão.
	 * 
	 * @version 1.0
	 * @author Givaldo Medeiros Neto
	 * 
	 * @since Criação: 04/07/23
	 * @since Última modificação:
	 */
	private static void conectar() {		
		try {			
			if(connection == null || connection.isClosed()) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, user, pass);
				connection.setAutoCommit(false);				
				System.out.println("Conectado");
			} else {
				connection.close();
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, user, pass);
				connection.setAutoCommit(false);				
				System.out.println("Conectado");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	/* Getters and Setters */
	public static Connection getConnection() {
		return connection;
	}

}
