package br.vet.petclini.model.pet;

import java.util.Objects;

/** Classe modelo para representar um objeto Coloracao.
 * <br>
 * Essa classe contém os atributos que definem o objeto Coloracao, tais como: ID e DESCRIÇÂO
 * 
 * @version 1.0.0
 * @since Criação: 17/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Coloracao {
	
	private int id;
	private String coloracao;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Coloração vazio.
     * <br>
     * Cria uma instância de Coloração com todos os atributos vazios ou com seus valores padrão.
     * Esse construtor é útil quando se deseja criar um objeto Coloração sem fornecer inicialmente
     * nenhum valor para seus atributos.
     * 
     */
	public Coloracao() { }
	
	/** Construtor personalizado para criar um objeto Coloração com todos os atributos preenchidos(ID e Descrição).
	 * <br>
	 * Cria uma instância de Coloração com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar uma objeto Coloração.
	 *
	 * @param id.
	 * @param coloracao.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Coloracao(int id, String coloracao) {
		this.id = id;
		this.coloracao = coloracao;
	}
	
	public Coloracao(int id) {
		this.id = id;
	}
	
	/* Getters and Setters */
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getColoracao() {
		return coloracao;
	}
	
	public void setColoracao(String coloracao) {
		this.coloracao = coloracao;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Coloracao [id=" + id + ", coloracao=" + coloracao + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(coloracao, id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Coloracao other = (Coloracao) obj;
		return Objects.equals(coloracao, other.coloracao) && id == other.id;
	}
	
	/* Methods */	

}
