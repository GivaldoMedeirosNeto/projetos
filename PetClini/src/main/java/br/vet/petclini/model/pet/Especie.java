package br.vet.petclini.model.pet;

import java.util.List;
import java.util.Objects;

/** Classe modelo para representar uma Especie.
 * <br>

 * @version 1.0.0
 * @since Criação: 11/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class Especie {
	
	private int id;
	private String especie;
	private List<Raca> raca;
		
	/* Constructors */
	
	/** Construtor padrão para criar um objeto ESPECIE vazio.
	 * <br>
	 * Cria uma instância de ESPECIE com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto ESPECIE sem fornecer inicialmente
	 * nenhum valor para seus atributos.
	 * 
	 */
	public Especie() {}
	
	/** Construtor personalizado para criar um objeto Especie com os atributos(ID e DESCRICAO) preenchidos.
	 * <br>
	 * Cria uma instância de tutor com os atributos(ID e DESCRICAO) devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações básicas e necessárias para criar uma especie.
	 * 
	 * @param id da Especie.
	 * @param descricao da Especie.
	 
	 */
	public Especie(int id, String especie) {
		this.id = id;
		this.especie = especie;
	}
	
	/** Construtor personalizado para criar um objeto Especie com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de Especie com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui todas as informações necessárias para criar uma especie.
	 * 
	 * @param id da Especie.
	 * @param descricao da Especie.
	 * @param raca lista das raças de cada especie.
	 */
	public Especie(int id, String especie, List<Raca> raca) {
		this.id = id;
		this.especie = especie;
		this.raca = raca;
	}
	
	/* Getters and Setters */
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEspecie() {
		return especie;
	}
	
	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public List<Raca> getRaca() {
		return raca;
	}

	public void setRaca(List<Raca> raca) {
		this.raca = raca;
	}

	/* ToString and HasCod/Equals */	
	@Override
	public String toString() {
		return "Especie [id=" + id + ", especie=" + especie + ", raca=" + raca + "]";
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
		Especie other = (Especie) obj;
		return Objects.equals(especie, other.especie) && id == other.id && Objects.equals(raca, other.raca);
	}
	
	/* Methods */
	
}
