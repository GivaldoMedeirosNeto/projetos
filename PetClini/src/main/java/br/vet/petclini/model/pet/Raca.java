package br.vet.petclini.model.pet;

import java.util.Objects;

/** Classe modelo para representar uma Raca.
 * <br>

 * @version 1.0.0
 * @since Criação: 11/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class Raca {

	private int id;
	private String raca;
	private Especie especie;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Raca vazio.
	 * <br>
	 * Cria uma instância de Raca com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Raca sem fornecer inicialmente
	 * nenhum valor para seus atributos.
	 * 
	 */
	public Raca() {}
	
	/** Construtor personalizado para criar um objeto Raca com os atributos(ID e DESCRICAO) preenchidos.
	 * <br>
	 * Cria uma instância de Raca com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações(ID e DESCRICAO) necessárias para criar uma Raca.
	 * 
	 * @param id da Raca.
	 * @param descricao da Raca.
	 
	 */
	public Raca(int id, String raca) {
		this.id = id;
		this.raca = raca;
	}
	
	/** Construtor personalizado para criar um objeto Raca com todos atributos preenchidos.
	 * <br>
	 * Cria uma instância de Raca com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar uma Raca.
	 * 
	 * @param id da Raca.
	 * @param descricao da Raca.
	 * @param especie especie.
	 
	 */
	public Raca(int id, String raca, Especie especie) {
		this.id = id;
		this.raca = raca;
		this.especie = especie;
	}
	
	public Raca(int id) {
		this.id = id;
	}

	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRaca() {
		return raca;
	}

	public void setRaca(String raca) {
		this.raca = raca;
	}
	
	public Especie getEspecie() {
		return especie;
	}

	public void setEspecie(Especie especie) {
		this.especie = especie;
	}	

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Raca [id=" + id + ", raca=" + raca + ", especie=" + especie + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(especie, id, raca);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Raca other = (Raca) obj;
		return Objects.equals(especie, other.especie) && id == other.id && Objects.equals(raca, other.raca);
	}
	
	/* Methods */
}
