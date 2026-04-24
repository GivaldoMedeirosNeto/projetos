package br.vet.petclini.dao.pessoa;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.endereco.Bairro;
import br.vet.petclini.model.endereco.Cidade;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.endereco.Estado;
import br.vet.petclini.model.gerenic.Status;
import br.vet.petclini.model.pessoa.Pessoa;

/** Classe para manipulação de dados relacionados a Pessoa.
 * Esta classe é responsável por consultar e alterar informações de pessoas na base de dados.
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class PessoaDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Construtor padrão.
	 * Obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public PessoaDAO() {
		connection = SingleConnection.getConnection();
	}

	/* Methods */

	/** Consulta uma Pessoa pelo seu CPF.
	 * 
	 * @param cpf O CPF da pessoa a ser consultada.
	 * @return Um objeto Pessoa contendo as informações da pessoa encontrada na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 *
	 * @version 1.0.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Pessoa consultarCpf(String cpf) throws SQLException {
		Pessoa modelPes = new Pessoa();
		sql = "CALL sp_pes_vw_pessoa(1, ?);";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf);
		
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {
			modelPes.setCpf(resultSet.getString("cpf_pessoa"));
			modelPes.setNome(resultSet.getString("nome"));
			modelPes.setRg(resultSet.getString("rg"));
			modelPes.setDt_nasc(resultSet.getString("dt_nasc"));
			modelPes.setSexo(resultSet.getString("sexo"));
			modelPes.setDt_cadastro(resultSet.getString("dt_cadastro"));
			modelPes.setDt_alteracao(resultSet.getString("dt_alteracao"));
			modelPes.setObservacao(resultSet.getString("observacao"));
			modelPes.setStatus(
					new Status(
						resultSet.getString("id_status"),
						resultSet.getString("status"),
						resultSet.getString("cor_status"))
				);
			modelPes.setCep(
				new Endereco(resultSet.getString("cep"), resultSet.getString("logradouro"),
					new Bairro(resultSet.getInt("id_bairro"), resultSet.getString("bairro"),
						new Cidade(resultSet.getInt("id_cidade"), resultSet.getString("cidade"),
							new Estado(resultSet.getString("uf"))
						)
					), resultSet.getString("ibge"), resultSet.getString("ddd"), resultSet.getString("siafi")
				)
			);
			modelPes.setNum_end(resultSet.getString("num_end"));
			modelPes.setCompl_end(resultSet.getString("compl_end"));
		}
		
		return modelPes;
	}

	/** Altera o status de uma Pessoa.
	 * 
	 * @param cpf O CPF da pessoa a ter o status alterado.
	 * @param dt_alter A data de alteração do status.
	 * @param status O novo status da pessoa.
	 * @return true se a alteração for realizada com sucesso, false caso contrário.
	 * @throws SQLException se ocorrer algum erro durante a execução da atualização.
	 *
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public boolean alterarStatus(String cpf, String dt_alter, String status) throws SQLException {
		sql = "CALL sp_pes_upd_pes(?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf);
		call.setString(2, dt_alter);
		call.setString(3, status);
		call.executeUpdate();
		
		connection.commit();
		
		return true;
	}

}
