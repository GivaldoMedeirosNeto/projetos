package br.vet.petclini.model.pessoa;

import java.sql.SQLException;

import br.vet.petclini.dao.pessoa.TutorDAO;
import br.vet.petclini.model.acesso.Login;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.gerenic.Imagem;
import br.vet.petclini.model.gerenic.Status;

/** Classe modelo para representar um objeto TUTOR.
 * <br>
 * Classe modelo para representar um objeto TUTOR com os atributos:<br>
 * CPF - NOME - RG - DT_NASC - SEXO - ENDERECO(CEP) - NUM_END - COMPL_END
 * DT_CADASTRO - DT_ALTERACAO - OBSERVACAO - STATUS - REDESOCIAL - CONTATO
 * IMAGEM
 * 
 * @see Tutor
 * 
 * @version 1.0.0
 * @since Criação: 08/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class Tutor extends Pessoa {
	
	/* Constructors */
	
	/** Construtor padrão objeto TUTOR.
	 * Cria uma instância de TUTOR sem seus atributos preenchidos(vazio).
	 */
	public Tutor() {
		super();
	}
	
	/** Construtor personalizado objeto TUTOR.
	 * Cria uma instância de TUTOR com alguns dos seus atributos preenchidos.<br>
	 * @param cpf
	 * @param nome
	 * @param rg
	 * @param dt_nasc
	 * @param sexo
	 * @param cep
	 * @param num_end
	 * @param compl_end
	 * @param dt_cadastro
	 * @param dt_alteracao
	 * @param observacao
	 * @param status
	 */
	public Tutor(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
			String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status) {
		super(cpf, nome, rg, dt_nasc, sexo, cep, num_end, compl_end, dt_cadastro, dt_alteracao, observacao, status);
	}
	
	/** Construtor personalizado objeto TUTOR.
	 * Cria uma instância de TUTOR com alguns dos seus atributos preenchidos.<br>
	 * @param cpf
	 * @param nome
	 * @param rg
	 * @param dt_nasc
	 * @param sexo
	 * @param cep
	 * @param num_end
	 * @param compl_end
	 * @param dt_cadastro
	 * @param dt_alteracao
	 * @param observacao
	 * @param status
	 * @param redeSocial
	 * @param contato
	 * @param imagem
	 */
	public Tutor(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
			String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status,
			RedeSocial redeSocial, Contato contato, Imagem imagem) {
		super(cpf, nome, rg, dt_nasc, sexo, cep, num_end, compl_end, dt_cadastro, dt_alteracao, observacao, status, redeSocial,
				contato, imagem);
	}
	
	/** Construtor personalizado objeto TUTOR.
	 * Cria uma instância de TUTOR com alguns dos seus atributos preenchidos.<br>
	 * @param cpf
	 * @param nome
	 * @param rg
	 * @param dt_nasc
	 * @param sexo
	 * @param cep
	 * @param num_end
	 * @param compl_end
	 * @param dt_cadastro
	 * @param dt_alteracao
	 * @param observacao
	 * @param status
	 * @param redeSocial
	 * @param contato
	 * @param imagem
	 * @param acesso
	 */
	public Tutor(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
			String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status,
			RedeSocial redeSocial, Contato contato, Imagem imagem, Login acesso) {
		super(cpf, nome, rg, dt_nasc, sexo, cep, num_end, compl_end, dt_cadastro, dt_alteracao, observacao, status, redeSocial,
				contato, imagem, acesso);
	}
	
	/* Getters and Setters */	
	/* ToString and HasCod/Equals */
	
	/* Methods */
	
	/** Consulta um objeto TUTOR pelo seu atributo CPF.
	 * <br>
	 * Este método utiliza o DAO(TutorDAO) para consultar na base de dados uma pessoa com o CPF fornecido.
	 * O CPF fornecido como parâmetro é tratado para remover caracteres especiais antes de realizar a consulta.
	 * 
	 * @param cpf
	 * @return objeto TUTOR correspondente ao CPF fornecido.<br>
	 * Caso não haja cadastro retorna NULL
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see TutorDAO#consultarCpf(String)
	 * 
	 * @version 1.0.0
	 * @since Criação: 27/07/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	@Override
	public Pessoa consultarCpf(String cpf) throws SQLException {
		cpf = cpf.replace(".", "").replace("-", "");
		return new TutorDAO().consultarCpf(cpf);
	}
}
