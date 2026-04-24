package br.vet.petclini.dao.atendimento;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.atendimento.Exame;
import br.vet.petclini.model.gerenic.Status;

/** Classe para manipulação de dados relacionados a Exame.
 * <br>
 * Esta classe é responsável por consultar informações da Exame na base de dados
 * e retornar as informações necessárias referente ao objeto Exame conforme os
 * critérios de pesquisa específicados.
 * 
 * @version 1.0.0
 * @since Criação: 17/09/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class ExameDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public ExameDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Métodos */
	
	/** Consulta as Exame na Base de Dados conforme a opção solicitada.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (0 e 1)<br>
	 * * 0: Pesquisa Todos;<br>
	 * * 1: Pesquisa pela DESCRIÇÃO;<br>
	 * 
	 * @return lista dos Exames encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/09/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Exame> listar(int opcao, String valor) throws SQLException {
		List<Exame> list = new ArrayList<Exame>();
		
		sql = "CALL sp_cons_vw_exame(?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		if(opcao == 1) {
			call.setString(2, ("%" + valor + "%").toUpperCase());			
		} else {
			call.setString(2, valor);
		}
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			list.add(
				new Exame(
					resultSet.getInt("id_exame"),
					resultSet.getString("exame"),
					new Status(
						resultSet.getString("id_status"),
						resultSet.getString("status"),
						resultSet.getString("cor_status")
					)
				)
			);
		}
		
		return list;
	}

	/** Adicionar ou alterar a Exame.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastrar<br>
	 * * 2: Alterar<br>
	 * @param exame descrição do exame para ser adicionada ou alterada conforme a
	 * opcao informada.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 17/098/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void add_upd (int opcao, Exame exame) throws SQLException {
		sql = "CALL sp_cons_add_upd_exame(?, ?, ?, ?)";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setInt(2, exame.getId());
		call.setString(3, exame.getExame().toUpperCase());
		call.setString(4, exame.getStatus().getId());
		
		call.execute();
		
		connection.commit();
		
	}
	
}
