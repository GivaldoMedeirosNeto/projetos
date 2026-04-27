package model;

import java.io.Serializable;
import java.util.Objects;

public class Usuario implements Serializable {

	/**
	 * Compilação das classes 
	 */
	private static final long serialVersionUID = 1L;
	
	private int idUsuario;
	private String login, pass;
	
	public Usuario() { }
	
	public Usuario(String login, String pass) {
		this.login = login;
		this.pass = pass;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	@Override
	public String toString() {
		return "usuario [idUsuario=" + idUsuario + ", login=" + login + ", pass=" + pass + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idUsuario, login, pass);
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
		return idUsuario == other.idUsuario && Objects.equals(login, other.login) && Objects.equals(pass, other.pass);
	}
	
}
