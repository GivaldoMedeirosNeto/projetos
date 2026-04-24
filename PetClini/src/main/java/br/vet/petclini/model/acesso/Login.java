package br.vet.petclini.model.acesso;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

/** Classe Modelo Login.
 * <br>
 * Essa classe representa as informações de login de um usuário no sistema.
 * Ela inclui o ID do usuário, o nome de login, a senha, o perfil de acesso e uma lista de visualizações
 * (views) disponíveis para o usuário.
 * 
 * @version 1.1.0
 * @since Criação: 12/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 * 
 */
public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String login;
	private String password;
	private String perfil;
	private String cpf;
	private String loginAdd;
	private List<View> listView;

	/* Constructors */
	
	/** Construtor padrão para criar um objeto Login vazio.
	 * <br>
	 * Cria uma instância de Login com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Login sem fornecer inicialmente nenhum
	 * valor para seus atributos.
	 */
	public Login() {}
	
	/** Construtor personalizado para criar um objeto Login com o login e a senha.
	 * <br>
	 * Cria uma instância de Login com o nome de login e a senha fornecidos.
	 * Esse construtor é útil quando já se possui o nome de login e a senha do usuário e
	 * deseja-se criar um objeto com essas informações.
	 * 
	 * @param login O nome de login do usuário.
	 * @param password A senha do usuário.
	 */
	public Login(String login, String password) {
		this.login = login;
		this.password = password;
	}
	
	/** Construtor personalizado para criar um objeto Login sem a lista de visualizações para o login.
	 * <br>
	 * Cria uma instância de Login com todos os atributos devidamente preenchidos.
	 * Esse construtor sem uma lista de visualização, somente as informação para acesso.
	 * 
	 * @param login O nome de login do usuário.
	 * @param password A senha do usuário.
	 * @param perfil O perfil de acesso do usuário.
	 * @param cpf O cpf da pessoa.
	 * @param loginAdd O loginAdd é o usuário que está cadastrando ou alterando o login.
	 */
	public Login(String login, String password, String perfil, String cpf, String loginAdd) {

		this.login = login;
		this.password = password;
		this.perfil = perfil;
		this.cpf = cpf;
		this.loginAdd = loginAdd;
	}
	
	/** Construtor personalizado para criar um objeto Login com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de Login com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui todas as informações necessárias
	 * para criar um objeto Login.
	 * 
	 * @param id O ID do usuário.
	 * @param login O nome de login do usuário.
	 * @param password A senha do usuário.
	 * @param perfil O perfil de acesso do usuário.
	 * @param listView A lista de visualizações (views) disponíveis para o usuário.
	 */
	public Login(int id, String login, String password, String perfil, List<View> listView) {
		this.id = id;
		this.login = login;
		this.password = password;
		this.perfil = perfil;
		this.listView = listView;
	}
	
	
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public List<View> getListView() {
		return listView;
	}

	public void setListView(List<View> listView) {
		this.listView = listView;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getLoginAdd() {
		return loginAdd;
	}

	public void setLoginAdd(String loginAdd) {
		this.loginAdd = loginAdd;
	}

	/* ToString and HasCod/Equals */
	
	@Override
	public String toString() {
		return "Login [id=" + id + ", login=" + login + ", password=" + password + ", perfil=" + perfil + ", cpf=" + cpf
				+ ", loginAdd=" + loginAdd + ", listView=" + listView + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cpf, id, listView, login, loginAdd, password, perfil);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Login other = (Login) obj;
		return Objects.equals(cpf, other.cpf) && id == other.id && Objects.equals(listView, other.listView)
				&& Objects.equals(login, other.login) && Objects.equals(loginAdd, other.loginAdd)
				&& Objects.equals(password, other.password) && Objects.equals(perfil, other.perfil);
	}
	
	
	/* Methods */
	
}
