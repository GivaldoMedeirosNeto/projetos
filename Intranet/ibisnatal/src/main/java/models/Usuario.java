package models;

import java.util.Objects;

public class Usuario {
	
	private int idUsuario;
	private String nome, login, pass, setor;
	
	public Usuario() {}
	
	public Usuario(String login, String pass) {
		this.login = login;
		this.pass = pass;
	}
	
	public Usuario(String nome, String login, String pass, String setor) {
		this.nome = nome;
		this.login = login;
		this.pass = pass;
		this.setor = setor;
	}
	
	public Usuario(int idUsuario, String nome, String login, String pass, String setor) {
		this.idUsuario = idUsuario;
		this.nome = nome;
		this.login = login;
		this.pass = pass;
		this.setor = setor;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSetor() {
		return setor;
	}

	public void setSetor(String setor) {
		this.setor = setor;
	}

	@Override
	public String toString() {
		return "Usuario [idUsuario=" + idUsuario + ", nome=" + nome + ", login=" + login + ", pass=" + pass + ", setor="
				+ setor + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idUsuario, login, nome, pass, setor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		return idUsuario == other.idUsuario && Objects.equals(login, other.login) && Objects.equals(nome, other.nome)
				&& Objects.equals(pass, other.pass) && Objects.equals(setor, other.setor);
	}

}
