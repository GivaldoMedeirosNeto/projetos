package br.vet.petclini.model.endereco;

import java.util.Objects;

/** Classe modelo que representa um estado.
 * <br>
 * Essa classe é utilizada para armazenar informações relacionadas a um estado,
 * incluindo a UF (Unidade Federativa) e o nome do estado.
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 * 
 */
public class Estado {
	
	private String uf;
	private String estado;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Estado vazio.
	 * <br>
	 * Cria uma instância de Estado com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Estado sem fornecer inicialmente nenhum valor para seus atributos.
	 */
	public Estado() {}
	
	/** Construtor personalizado para criar um objeto Estado com a UF (Unidade Federativa) preenchida.
	 * <br>
	 * Cria uma instância de Estado com a UF (Unidade Federativa) especificada.
	 * Esse construtor é útil quando já se possui a UF do estado e deseja-se criar um objeto com essa informação.
	 * 
	 * @param uf A UF (Unidade Federativa) do estado.
	 */
	public Estado(String uf) {
		this.uf = uf;
	}
	
	/** Construtor personalizado para criar um objeto Estado com a UF e o nome do estado preenchidos.
	 * <br>
	 * Cria uma instância de Estado com a UF (Unidade Federativa) e o nome do estado especificados.
	 * Esse construtor é útil quando já se possui a UF e o nome do estado e deseja-se criar um objeto com essas informações.
	 * 
	 * @param uf A UF (Unidade Federativa) do estado.
	 * @param estado O nome do estado.
	 */
	public Estado(String uf, String estado) {
		this.uf = uf;
		this.estado = estado;
	}
	
	/* Getters and Setters */
	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Estado [uf=" + uf + ", estado=" + estado + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(estado, uf);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Estado other = (Estado) obj;
		return Objects.equals(estado, other.estado) && Objects.equals(uf, other.uf);
	}
	
	/* Methods */

	

}
