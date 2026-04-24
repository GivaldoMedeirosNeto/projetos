package br.vet.petclini.model.endereco;

import java.util.Objects;

/** Classe modelo que representa uma cidade.
 * <br>
 * Essa classe é utilizada para armazenar informações relacionadas a uma cidade,
 * incluindo seu ID, nome e o estado ao qual pertence.
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class Cidade {
	
	private int id;
	private String cidade;
	private Estado estado;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Cidade vazio.
	 * <br>
	 * Cria uma instância de Cidade com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Cidade sem fornecer inicialmente nenhum valor para seus atributos.
	 * 
	 */
	public Cidade() {}
	
	/** Construtor personalizado para criar um objeto Cidade com o nome da cidade e o estado associado.
	 * 
	 * @param cidade O nome da cidade.
	 * @param estado O estado ao qual a cidade pertence.
	 */
	public Cidade(String cidade, Estado estado){
		this.cidade = cidade;
		this.estado = estado;
	}
	
	/** Construtor personalizado para criar um objeto Cidade com o ID, nome da cidade e o estado associado.
	 * 
	 * @param id O ID da cidade.
	 * @param cidade O nome da cidade.
	 * @param estado O estado ao qual a cidade pertence.
	 */
	public Cidade(int id, String cidade, Estado estado){
		this.id = id;
		this.cidade = cidade;
		this.estado = estado;
	}

		
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Cidade [id=" + id + ", cidade=" + cidade + ", estado=" + estado + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cidade, estado, id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cidade other = (Cidade) obj;
		return Objects.equals(cidade, other.cidade) && Objects.equals(estado, other.estado) && id == other.id;
	}
	
	/* Methods */

}
