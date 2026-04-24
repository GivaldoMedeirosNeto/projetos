package br.vet.petclini.interfaces;

import br.vet.petclini.model.endereco.Endereco;

/** Interface para buscar informações de endereço com base em um CEP.
 * <br>
 * Esta interface define o contrato para classes que serão responsáveis por buscar informações de endereço
 * através de um CEP fornecido como entrada.
 * 
 * @version 1.0
 * @since Criação: 24/05/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public interface BuscarCep {
	
	/** Busca informações de endereço com base em um CEP.
	 * <br>
	 * Este método é responsável por receber um CEP como entrada e retornar um objeto do tipo Endereco contendo
	 * as informações relacionadas ao endereço correspondente ao CEP.
	 * 
	 * @param cep O CEP que será usado para buscar as informações do endereço.
	 * @return Um objeto do tipo Endereco contendo as informações do endereço relacionado ao CEP.
	 */
	public Endereco buscar(String cep);

}
