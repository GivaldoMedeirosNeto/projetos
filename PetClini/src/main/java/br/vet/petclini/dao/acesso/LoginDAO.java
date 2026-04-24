package br.vet.petclini.dao.acesso;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.acesso.Login;
import br.vet.petclini.model.acesso.View;

/** Classe para manipulação de dados relacionados à autenticação de acesso ao sistema.
 * <br>
 * Esta classe é responsável por autenticar os usuários e obter informações sobre suas
 * permissões de acesso a diferentes visualizações (views) do sistema.
 * 
 * @version 1.0.0
 * @since Criação: 12/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class LoginDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	private Login modelLogin = new Login();
	
	/* Constructors */

	/** Construtor padrão.
	 * Obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public LoginDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Autentica o acesso ao sistema para um determinado login.
	 * 
	 * @param login Um objeto Login contendo o login e a senha a serem autenticados.
	 * @return Um objeto Login contendo as informações do usuário autenticado, incluindo
	 *         seu perfil e permissões de acesso às visualizações (views).
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 25/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Login autenticar(Login login) throws SQLException {
		
		sql = "CALL sp_petclini_vw_validar_acesso(?, ?)";
		
		call = connection.prepareCall(sql);
		call.setString(1, login.getLogin());
		call.setString(2, login.getPassword());
		
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {
			modelLogin.setId(resultSet.getInt("id_login"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setPassword(resultSet.getString("password"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			
			sql = "CALL sp_petclini_vw_views_logins (?)";
			
			call = connection.prepareCall(sql);
			call.setInt(1, modelLogin.getId());
			
			resultSet = call.executeQuery();
			
			List<View> listView = new ArrayList<View>();
			
			while (resultSet.next()) {				
				View modelView = new View();				
				modelView.setId(resultSet.getInt("id_view"));
				modelView.setDescricao(resultSet.getString("descricao"));
				modelView.setView(resultSet.getBoolean("view"));
				
				listView.add(modelView);				
			}
			
			modelLogin.setListView(listView);			
			
		}
		
		return modelLogin;
	}
	
	/** Verifica se o LOGIN já está em uso.
	 * 
	 * @param login
	 * @return boolean Caso o login já esteja sendo usado retorna TRUE, se não FALSE.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 04/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public boolean verificar(String login) throws SQLException {
		sql = "CALL sp_petclini_validar_login(?)";
		
		call = connection.prepareCall(sql);
		call.setString(1, login);
		
		resultSet = call.executeQuery();
		
		return resultSet.next();
	}
	
	/** (Ainda em manutenção)Adiciona ou Altera o LOGIN de acesso da Pessoa.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastra<br>
	 * * 2: Altera os dados<br>
	 * @param login Um objeto login contendo as informações a ser adicionados ou alterados.
	 * @return Um objeto login contendo as informações do login encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0
	 * @since Criação: 04/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Login add_upd_login(int opcao, Login login) throws SQLException {
		Login modelLogin = new Login();
		sql = "CALL sp_petclini_add_upd_acesso(?, ?, ?, ?, ?, ?)";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, login.getLogin());
		call.setString(3, login.getPassword());
		call.setString(4, login.getPerfil());
		call.setString(5, login.getCpf());
		call.setString(6, login.getLoginAdd());
		
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {
			modelLogin.setId(resultSet.getInt("id_login"));
			modelLogin.setLogin(resultSet.getString("login"));
			modelLogin.setPassword(resultSet.getString("password"));
			modelLogin.setPerfil(resultSet.getString("perfil"));
			modelLogin.setCpf(resultSet.getString("cpf_pessoa"));
			modelLogin.setLoginAdd(resultSet.getString("loginAdd"));
			
		}
		
		return modelLogin;
	}
	
}
