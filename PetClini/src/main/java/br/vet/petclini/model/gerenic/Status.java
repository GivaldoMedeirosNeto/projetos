package br.vet.petclini.model.gerenic;

import java.util.Objects;

/** Classe modelo para representar um objeto Status.
 * <br>
 * Essa classe contém os atributos que definem o objeto Status, tais como:<br>
 * ID, Descrição e Cor
 * Classe utilizada para definir os status dos outros objetos no sistema
 * 
 * @version 1.0.0
 * @since Criação: 22/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Status {
	
	private String id;
	private String status;
	private String cor;
	
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Status vazio.
	 * <br>
	 * Cria uma instância de Status com todos os atributos vazios ou com seus valores padrão.
     * Esse construtor é útil quando se deseja criar um objeto Status sem fornecer inicialmente
     * nenhum valor para seus atributos.
	 *
	 * @param id
	 * @param status
	 * @param cor
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Status() { }
	
	/** Construtor personalizado para criar um objeto Status com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de Status com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar uma objeto Status.
	 *
	 * @param id
	 * @param status
	 * @param cor
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Status(String id, String status, String cor) {
		this.id = id;
		this.status = status;
		this.cor = cor;
	}

	public Status(String id) {
		this.id = id;
	}
	
    /* Getters and Setters */
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

		
    /* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Status [id=" + id + ", status=" + status + ", cor=" + cor + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cor, id, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Status other = (Status) obj;
		return Objects.equals(cor, other.cor) && Objects.equals(id, other.id) && Objects.equals(status, other.status);
	}
	
    /* Methods */

}
