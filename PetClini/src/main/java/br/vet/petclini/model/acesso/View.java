package br.vet.petclini.model.acesso;

import java.io.Serializable;
import java.util.Objects;

/** Classe Modelo View Sistema
 * <br>
 * Essa classe representa uma visualização (view) específica do sistema,
 * como uma página ou recurso acessível para o usuário. Cada instância de
 * View contém um ID único, uma descrição e um sinalizador booleano indicando
 * se a visualização está disponível para o usuário.
 * 
 * @version 1.0
 * @since Criação: 25/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 * 
 */
public class View implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String descricao;
	private boolean view;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto View vazio.
	 * <br>
	 * Cria uma instância de View com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto View sem fornecer inicialmente
	 * nenhum valor para seus atributos.
	 */
	public View(){}
	
	/* Getters and Setters */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}	
	
	public boolean isView() {
		return view;
	}

	public void setView(boolean view) {
		this.view = view;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "View [id=" + id + ", descricao=" + descricao + ", view=" + view + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(descricao, id);
	}	

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		View other = (View) obj;
		return Objects.equals(descricao, other.descricao) && id == other.id;
	}
	
	
	/* Methods */

}
