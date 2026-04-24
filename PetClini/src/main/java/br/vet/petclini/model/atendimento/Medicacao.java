package br.vet.petclini.model.atendimento;

import java.util.Objects;

import br.vet.petclini.model.gerenic.Status;

/** Classe modelo para representar um objeto Medicamento.
 * <br>
 * Essa classe contém os atributos que definem o objeto Medicamento, tais como: Id, Medicamento e Status
 * 
 * @version 1.0.0
 * @since Criação: 18/09/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Medicacao {
	
	private int id;
	private String medicacao;
	private Status status;
		
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Medicação vazio.
     * <br>
     * Cria uma instância de Medicação com todos os atributos vazios ou com seus valores padrão.
     * Esse construtor é útil quando se deseja criar um objeto Medicação sem fornecer inicialmente
     * nenhum valor para seus atributos.
     * 
     */
	public Medicacao() { }
	
	/** Construtor personalizado para criar um objeto Medicação com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de Medicação com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar uma objeto Medicação.
	 *
	 * @param id
	 * @param medicacao
	 * @param status
	 * 
	 * @version 1.0.0
	 * @since Criação: 18/09/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Medicacao(int id, String medicacao, Status status) {
		super();
		this.id = id;
		this.medicacao = medicacao;
		this.status = status;
	}

		
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMedicacao() {
		return medicacao;
	}

	public void setMedicacao(String medicacao) {
		this.medicacao = medicacao;
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
		return "Exame [id=" + id + ", medicação=" + medicacao + ", status=" + status + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, medicacao, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Medicacao other = (Medicacao) obj;
		return id == other.id && Objects.equals(medicacao, other.medicacao) && Objects.equals(status, other.status);
	}
		
	/* Methods */

}
