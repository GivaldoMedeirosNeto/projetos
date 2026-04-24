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
import br.vet.petclini.services.WebServiceBuscarCep;

/** Classe para manipulação de dados relacionados a Endereços.
 * <br>
 * Esta classe é responsável por pesquisar e adicionar informações de endereços
 * na base de dados. Caso um CEP não esteja na base de dados, será adicionado
 * através de um serviço de WebService (viacep).
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class EnderecoDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Construtor padrão.
	 * <br>
	 * Obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public EnderecoDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Pesquisa o endereço associado a um determinado CEP.
	 * <br>
	 * Caso o CEP não esteja na base de dados, será adicionado através do WebService viacep.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (0 a 7).
	 * * 0: Pesquisa sem a calsula Where<br>
	 * * 1: Pesquisa com a calsula WHERE por UF<br>
	 * * 2: Pesquisa com a calsula WHERE por ID CIDADE<br>
	 * * 3: Pesquisa com a calsula WHERE por NOME CIDADE<br>
	 * * 4: Pesquisa com a calsula WHERE por ID BAIRRO<br>
	 * * 5: Pesquisa com a calsula WHERE por NOME BAIRRO<br>
	 * * 6: Pesquisa com a calsula WHERE por LOGADOURO<br>
	 * * 7: Pesquisa com a calsula WHERE por CEP;
	 * @param cep O CEP a ser pesquisado no formato "xxxxxxxx".
	 * 
	 * @return Um objeto Endereco contendo as informações do endereço encontrado.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 *
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Endereco pesquisar(int opcao, String cep) throws SQLException {
		Endereco modelEnd = new Endereco();
		
		sql = "CALL sp_end_vw_endereco('" + opcao +"','" + cep + "');";
		
		call = connection.prepareCall(sql);
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {
			modelEnd.setCep(resultSet.getString("cep"));
			modelEnd.setLogradouro(resultSet.getString("logradouro"));
			modelEnd.setIbge(resultSet.getString("ibge"));
			modelEnd.setDdd(resultSet.getString("ddd"));
			modelEnd.setSiafi(resultSet.getString("siafi"));
			modelEnd.setBairro(
				new Bairro(resultSet.getInt("id_bairro"), resultSet.getString("bairro"),
					new Cidade( resultSet.getInt("id_cidade"), resultSet.getString("cidade"),
						new Estado(resultSet.getString("uf"))
					)
				)
			);
			modelEnd.setIbge(resultSet.getString("ibge"));
			modelEnd.setDdd(resultSet.getString("ddd"));
			modelEnd.setSiafi(resultSet.getString("siafi"));
		} else {
			modelEnd = adicionar(new WebServiceBuscarCep().buscar(cep));
		}
		
		return modelEnd;
	}
	
	/** Adiciona um endereço na base de dados.
	 * <br>
	 * Este método é chamado caso o CEP não esteja presente na base de dados.
	 * 
	 * @param end Um objeto Endereco contendo as informações do endereço a ser adicionado.
	 * @return Um objeto Endereco contendo as informações do endereço adicionado.
	 * @throws SQLException se ocorrer algum erro durante a execução das stored procedures.
	 *
	 * @version 1.0
	 * @since Criação: 27/07/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private Endereco adicionar(Endereco end) throws SQLException {
		sql = "CALL sp_end_add_cidade(?,?)";		
		
		call = connection.prepareCall(sql);
		call.setString(1, end.getBairro().getCidade().getCidade().toUpperCase());
		call.setString(2, end.getBairro().getCidade().getEstado().getUf());
		
		resultSet = call.executeQuery();
		
		connection.commit();
		
		if(resultSet.next()){
			sql = "CALL sp_end_add_bairro(?,?)";
			call = connection.prepareCall(sql);
			call.setString(1, end.getBairro().getBairro().toUpperCase());
			call.setInt(2, resultSet.getInt("idCidade"));
			
			resultSet = call.executeQuery();
			
			connection.commit();
			
			if(resultSet.next()) {
				sql = "CALL sp_end_add_endereco(?,?,?,?,?,?)";
				
				call = connection.prepareCall(sql);
				call.setString(1, end.getCep());
				call.setString(2, end.getLogradouro().toUpperCase());
				call.setString(3, end.getIbge());
				call.setString(4, end.getDdd());
				call.setString(5, end.getSiafi());
				call.setInt(6, resultSet.getInt("idBairro"));
				
				resultSet = call.executeQuery();
				
				if(resultSet.next()) {
					return new Endereco(resultSet.getString("cep"), resultSet.getString("logradouro"),
						new Bairro(resultSet.getInt("id_bairro"), resultSet.getString("bairro"),
							new Cidade(resultSet.getInt("id_cidade"), resultSet.getString("cidade"),
								new Estado(resultSet.getString("uf"))
							)	
						), resultSet.getString("ibge"), resultSet.getString("ddd"), resultSet.getString("siafi")
					);
				}
			}
			
		}		
		
		connection.commit();
		
		return end;
		
	}

}
