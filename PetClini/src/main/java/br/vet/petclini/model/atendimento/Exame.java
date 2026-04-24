package br.vet.petclini.model.atendimento;

import java.util.Objects;

import br.vet.petclini.model.gerenic.Status;

/** Classe modelo para representar um objeto Exame.
 * <br>
 * Essa classe contém os atributos que definem o objeto Exame, tais como: Id, Exame e Status
 * 
 * @version 1.0.0
 * @since Criação: 17/09/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Exame {
	
	private int id;
	private String exame;
	private Status status;
		
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Exame vazio.
     * <br>
     * Cria uma instância de Exame com todos os atributos vazios ou com seus valores padrão.
     * Esse construtor é útil quando se deseja criar um objeto Exame sem fornecer inicialmente
     * nenhum valor para seus atributos.
     * 
     */
	public Exame() { }
	
	/** Construtor personalizado para criar um objeto Exame com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de Exame com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar uma objeto Exame.
	 *
	 * @param id
	 * @param exame
	 * @param status
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/09/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Exame(int id, String exame, Status status) {
		super();
		this.id = id;
		this.exame = exame;
		this.status = status;
	}

		
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getExame() {
		return exame;
	}

	public void setExame(String exame) {
		this.exame = exame;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

		
	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Exame [id=" + id + ", exame=" + exame + ", status=" + status + "]";
	}
	

	@Override
	public int hashCode() {
		return Objects.hash(exame, id, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Exame other = (Exame) obj;
		return Objects.equals(exame, other.exame) && id == other.id && Objects.equals(status, other.status);
	}
		
	/* Methods */

}
