package br.vet.petclini.constants;

/** Classe para tratar os caracteres do CPF<br>
 * Esta classe oferece métodos para remover e inserir os caracteres "." e "-" do CPF.
 * 
 * @version 1.0
 * @since Criação: 30/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class CPF {
		
	/* Methods */
	
	/** Remove os caracteres do CPF informando.
	 * 
	 * @return
	 * @throws
	 * 
	 * @version 1.0
	 * @since Criação: 30/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public String remover(String cpf) {
		return cpf.replace(".", "").replace("-", "");
	}

}
