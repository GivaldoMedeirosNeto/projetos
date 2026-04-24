package br.vet.petclini.model.pessoa;


/** Classe modelo para representar um Veterinário.
 * <br>
 * Esta classe é uma subclasse de Pessoa e representa um veterinário no sistema.
 * O Veterinário possui informações específicas, como CRMV (registro profissional), MEI (Microempreendedor Individual),
 * IE (Inscrição Estadual) e IM (Inscrição Municipal).
 * 
 * @see Pessoa
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class Veterinario extends Pessoa {
	
	private String crmv;
	private String mei;
	private String ie;
	private String im;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto Veterinario vazio.
	 * <br>
	 * Cria uma instância de Veterinario com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Veterinario sem fornecer inicialmente
	 * nenhum valor para seus atributos.
	 * 
	 */
	public Veterinario() {
		super();
	}

	
}
