package br.vet.petclini.dao.pet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.constants.DataHora;
import br.vet.petclini.model.gerenic.Status;
import br.vet.petclini.model.pet.Coloracao;
import br.vet.petclini.model.pet.Especie;
import br.vet.petclini.model.pet.Pet;
import br.vet.petclini.model.pet.Raca;

/** Classe para manipulação de dados relacionados ao PET.
 * <br>
 * Esta classe é responsável por consultar informações de PETs na base de dados
 * e retornar a pesquisa conforme solicitações específicos.
 * 
 * @version 1.0.0
 * @since Criação: 22/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class PetDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/**  Obtém a conexão única com o banco de dados através da classe SingleConnection. */
	public PetDAO() {
		connection = SingleConnection.getConnection();
	}
	
	/* Methods */
	
	/** Listar os Pets na Base de Dados conforme a opção solicitada.
	 * 
	 * * @param opcao Um inteiro representando a opção de pesquisa (0 a 9)<br>
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE por CPF do Pet;<br>
	 * * 2: Pesquisa com cláusula WHERE por NOME;<br>
	 * * 3: Pesquisa com cláusula WHERE por SEXO;<br>
	 * * 4: Pesquisa com cláusula WHERE por TUTOR;<br>
	 * * 5: Pesquisa com cláusula WHERE por CPF do Tutor;<br>
	 * * 6: Pesquisa com cláusula WHERE por ESPECIE;<br>
	 * * 7: Pesquisa com cláusula WHERE por RACA;<br>
	 * * 8: Pesquisa com cláusula WHERE por COLORACAO;<br>
	 * * 9: Pesquisa com cláusula WHERE por STATUS;<br>
	 * 
	 * @return lista de todos os Pets encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Pet> listar(int opcao, String valor) throws SQLException {
		List<Pet> list = new ArrayList<Pet>();
		
		if(opcao == 2 || opcao == 4) {
			valor = "%" + valor + "%";
		}

		sql = "CALL sp_pet_vw_pet(?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, valor);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			list.add( new Pet(
				resultSet.getString("cpf_pet"),
				resultSet.getString("nome"),
				resultSet.getString("dt_nasc"),
				new Raca(
					resultSet.getInt("id_raca"),
					resultSet.getString("raca"),
					new Especie(
						resultSet.getInt("id_especie"),
						resultSet.getString("especie"))),
				new Coloracao(
					resultSet.getInt("id_coloracao"),
					resultSet.getString("coloracao")),
				resultSet.getString("sexo"),
				resultSet.getString("convivio"),
				resultSet.getString("castrado"),
				resultSet.getString("dt_cadastro"),
				resultSet.getString("dt_alteracao"),
				resultSet.getString("dt_falecimento"),
				resultSet.getString("observacao"),
				new Status(
					resultSet.getString("id_status"),
					resultSet.getString("status"),
					resultSet.getString("cor_status")),
				resultSet.getString("cpf_tutor"),
				resultSet.getString("tutor")));
		}
		return list;
	}
	
	/** Consultar o Pet na Base de Dados pelo CPF PET.
	 * 
	 * * @param cpf_pet
	 * 
	 * @return pet encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Pet consultar(String cpf_pet) throws SQLException {
		Pet modelPet = new Pet();
		
		sql = "CALL sp_pet_vw_pet(1, ?);";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf_pet);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			modelPet = new Pet(
				resultSet.getString("cpf_pet"),
				resultSet.getString("nome"),
				resultSet.getString("dt_nasc"),
				new Raca(
					resultSet.getInt("id_raca"),
					resultSet.getString("raca"),
					new Especie(
						resultSet.getInt("id_especie"),
						resultSet.getString("especie"))),
				new Coloracao(
					resultSet.getInt("id_coloracao"),
					resultSet.getString("coloracao")),
				resultSet.getString("sexo"),
				resultSet.getString("convivio"),
				resultSet.getString("castrado"),
				resultSet.getString("dt_cadastro"),
				resultSet.getString("dt_alteracao"),
				resultSet.getString("dt_falecimento"),
				resultSet.getString("observacao"),
				new Status(
					resultSet.getString("id_status"),
					resultSet.getString("status"),
					resultSet.getString("cor_status")),
				resultSet.getString("cpf_tutor"),
				resultSet.getString("tutor"));
		}
		return modelPet;
	}

	/** Adiciona ou alterar o Pet.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastrar<br>
	 * * 2: Alterar<br>
	 * @param pet Um objeto pet contendo as informações a ser adicionados ou alterados.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 27/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void add_upd (int opcao, Pet pet) throws SQLException {
		sql = "CALL sp_pet_add_upd_pet(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, opcao ==1 ? new Pet().gerar_cpf_pet(pet) : pet.getCpf_pet());
		call.setString(3, pet.getCpf_tutor());
		call.setString(4, pet.getNome().toUpperCase());
		call.setInt(5, pet.getRaca().getId());
		call.setInt(6, pet.getColoracao().getId());
		call.setString(7, pet.getSexo());
		call.setString(8, pet.getDt_nasc());
		call.setString(9, pet.getConvivio());
		call.setString(10, pet.getCastrado());
		call.setString(11, pet.getObservacao());
		call.setString(12, opcao ==1 ? pet.getDt_cadastro() : pet.getDt_alteracao());
		call.setString(13, pet.getStatus().getId());
		
		call.execute();
		
		connection.commit();
		
	}

	/** Altera o Status do PET.
	 * 
	 * @param cpfPet
	 * @param statusPet.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 30/08/2023
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void alt_st(String cpfPet, String statusPet) throws SQLException {
		sql = "CALL sp_pet_alt_st_pet(?, ?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, statusPet.equalsIgnoreCase("FA") ? 1 : 2);
		call.setString(2, cpfPet);
		call.setString(3, new DataHora().dataAtual());
		call.setString(4, statusPet);		
		
		call.execute();
		
		connection.commit();
	}
}
