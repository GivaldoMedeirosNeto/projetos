package br.vet.petclini.model.pessoa;

import java.util.Objects;

/** Classe modelo para representar um objeto CONTATO.
 * <br>
 * Classe modelo para representar um objeto CONTATO com os seus atributos:<br>
 * CPF_PESSOA - EMAIL - TELEFONE - WHATAPP
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Contato {
	
	private String cpf_pessoa;
	private String email;
	private String telefone;
	private String whatsapp;
		
	/* Constructors */
	
/* Constructors */
	
	/** Construtor padrão objeto PESSOA.
	 * Cria uma instância de PESSOA sem seus atributos preenchidos(vazio).
	 */
	public Contato() {}
	
	/** Construtor personalizado objeto CONTATO.
	 * Cria uma instância de CONTATO com seus atributos preenchidos.<br>
	 * CPF_PESSOA - EMAIL - TELEFONE - WHATAPP
	 */
    public Contato(String cpf_pessoa, String email, String telefone, String whatsapp) {
		this.cpf_pessoa = cpf_pessoa;
		this.email = email;
		this.telefone = telefone;
		this.whatsapp = whatsapp;
	}

	/* Getters and Setters */
	public String getCpf_pessoa() {
		return cpf_pessoa;
	}
	
	public void setCpf_pessoa(String cpf_pessoa) {
		this.cpf_pessoa = cpf_pessoa;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTelefone() {
		return telefone;
	}
	
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public String getWhatsapp() {
		return whatsapp;
	}
	
	public void setWhatsapp(String whatsapp) {
		this.whatsapp = whatsapp;
	}

		
    /* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Contato [cpf_pessoa=" + cpf_pessoa + ", email=" + email + ", telefone=" + telefone + ", whatsapp="
				+ whatsapp + "]";
	}
    
	@Override
	public int hashCode() {
		return Objects.hash(cpf_pessoa, email, telefone, whatsapp);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Contato other = (Contato) obj;
		return Objects.equals(cpf_pessoa, other.cpf_pessoa) && Objects.equals(email, other.email)
				&& Objects.equals(telefone, other.telefone) && whatsapp == other.whatsapp;
	}
	
	/* Methods */

}
