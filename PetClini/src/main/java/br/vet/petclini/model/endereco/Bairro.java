package br.vet.petclini.model.endereco;

import java.util.Objects;

/** Classe modelo que representa um bairro.
 * <br>
 * Essa classe é utilizada para armazenar informações relacionadas a um bairro,
 * incluindo seu ID, nome e a cidade à qual pertence.
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Bairro {

	private int id;
	private String bairro;
	private Cidade cidade;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Bairro vazio.
	 * <br>
	 * Cria uma instância de Bairro com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Bairro sem fornecer inicialmente nenhum valor para seus atributos.
	 * 
	 */
	public Bairro() { }
	
	/** Construtor personalizado para criar um objeto Bairro com o nome do bairro e a cidade associada.
	 * 
	 * @param bairro O nome do bairro.
	 * @param cidade A cidade à qual o bairro pertence.
	 */
	public Bairro(String bairro, Cidade cidade){
		this.bairro = bairro;
		this.cidade = cidade;
	}
	
	/** Construtor personalizado para criar um objeto Bairro com o ID, nome do bairro e a cidade associada.
	 * 
	 * @param id O ID do bairro.
	 * @param bairro O nome do bairro.
	 * @param cidade A cidade à qual o bairro pertence.
	 */
	public Bairro(int id, String bairro, Cidade cidade){
		this.id = id;
		this.bairro = bairro;
		this.cidade = cidade;
	}

		
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Bairro [id=" + id + ", bairro=" + bairro + ", cidade=" + cidade + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bairro, cidade, id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Bairro other = (Bairro) obj;
		return Objects.equals(bairro, other.bairro) && Objects.equals(cidade, other.cidade) && id == other.id;
	}
	
	/* Methods */
}
