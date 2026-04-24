package br.vet.petclini.dao.pessoa;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.vet.petclini.connection.SingleConnection;
import br.vet.petclini.model.endereco.Bairro;
import br.vet.petclini.model.endereco.Cidade;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.endereco.Estado;
import br.vet.petclini.model.gerenic.Status;
import br.vet.petclini.model.pessoa.Contato;
import br.vet.petclini.model.pessoa.RedeSocial;
import br.vet.petclini.model.pessoa.Tutor;

/** Classe para manipulação de dados relacionados a Tutor.
 * <br>
 * Esta classe é responsável por consultar informações de tutores na base de dados
 * e retornar uma lista de tutor com base em critérios de pesquisa específicos.
 * 
 * @version 1.0.0
 * @since Criação: 08/08/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class TutorDAO {
	
	private Connection connection;
	
	private String sql;
	private CallableStatement call;
	private ResultSet resultSet;
	
	/* Constructors */
	
	/** Construtor padrão.
	 * Obtém a conexão única com o banco de dados através da classe SingleConnection.
	 */
	public TutorDAO() {
		connection = SingleConnection.getConnection();
	}

	/* Methods */
	
	/** Consulta o TUTOR pelo atributo CPF.
	 * 
	 * @param cpf
	 * @return tutor objeto contendo as informações do TUTOR.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 08/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Tutor consultarCpf(String cpf) throws SQLException {
		Tutor modelTutor = new Tutor();
		
		sql = "CALL sp_pes_vw_tutor(1, ?);";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf);
		
		resultSet = call.executeQuery();
		
		if(resultSet.next()) {
			modelTutor.setCpf(resultSet.getString("cpf_tutor"));
			modelTutor.setNome(resultSet.getString("nome"));
			modelTutor.setRg(resultSet.getString("rg"));
			modelTutor.setDt_nasc(resultSet.getString("dt_nasc"));
			modelTutor.setSexo(resultSet.getString("sexo"));
			modelTutor.setDt_cadastro(resultSet.getString("dt_cadastro"));
			modelTutor.setDt_alteracao(resultSet.getString("dt_alteracao"));
			modelTutor.setObservacao(resultSet.getString("observacao"));
			modelTutor.setStatus(
				new Status(
					resultSet.getString("id_status"),
					resultSet.getString("status"),
					resultSet.getString("cor_status"))
			);
			modelTutor.setCep(
				new Endereco(resultSet.getString("cep"), resultSet.getString("logradouro"),
					new Bairro(resultSet.getInt("id_bairro"), resultSet.getString("bairro"),
						new Cidade(resultSet.getInt("id_cidade"), resultSet.getString("cidade"),
							new Estado(resultSet.getString("uf"))
						)
					), resultSet.getString("ibge"), resultSet.getString("ddd"), resultSet.getString("siafi")
				)
			);
			modelTutor.setNum_end(resultSet.getString("num_end"));
			modelTutor.setCompl_end(resultSet.getString("compl_end"));
			modelTutor.setContato(
				new Contato(
					resultSet.getString("cpf_tutor"),
					resultSet.getString("email"),
					resultSet.getString("telefone"),
					resultSet.getString("whatsapp"))
			);
			modelTutor.setRedeSocial(
				new RedeSocial(
					resultSet.getString("instagram"),
					resultSet.getString("youtube"),
					resultSet.getString("tiktok"),
					resultSet.getString("twitter"),
					resultSet.getString("linkedin"),
					resultSet.getString("facebook"),
					resultSet.getString("snapchat"))
			);
			
		}
		
		return modelTutor;
	}
	
	/** Listar os Tutores na Base de Dados conforme a opção solicitada.
	 * 
	 * * @param opcao Um inteiro representando a opção de pesquisa (0 a 9)<br>
	 * * Opções disponíveis:<br>
	 * * 0: Pesquisa sem cláusula WHERE;<br>
	 * * 1: Pesquisa com cláusula WHERE por CPF do Tutor;<br>
	 * * 2: Pesquisa com cláusula WHERE por RG;<br>
	 * * 3: Pesquisa com cláusula WHERE por SEXO;<br>
	 * * 4: Pesquisa com cláusula WHERE por STATUS;<br>
	 * * 5: Pesquisa com cláusula WHERE por NOME;<br>
	 * * 6: Pesquisa com cláusula WHERE por UF;<br>
	 * * 7: Pesquisa com cláusula WHERE por ID CIDADE;<br>
	 * * 8: Pesquisa com cláusula WHERE por ID BAIRRO;<br>
	 * * 9: Pesquisa com cláusula WHERE por CEP;<br>
	 * 
	 * @return lista de todos os tutores encontrado na base de dados.
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public List<Tutor> listar(int opcao, String valor) throws SQLException {
		
		List<Tutor> list = new ArrayList<Tutor>();
 		
		if(opcao == 5) {
			valor = "%" + valor + "%";
		}
		
		sql = "CALL sp_pes_vw_tutor(?, ?)";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, valor);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			Tutor modelTutor = new Tutor();
			
			modelTutor.setCpf(resultSet.getString("cpf_tutor"));
			modelTutor.setNome(resultSet.getString("nome"));
			modelTutor.setRg(resultSet.getString("rg"));
			modelTutor.setDt_nasc(resultSet.getString("dt_nasc"));
			modelTutor.setSexo(resultSet.getString("sexo"));
			modelTutor.setDt_cadastro(resultSet.getString("dt_cadastro"));
			modelTutor.setDt_alteracao(resultSet.getString("dt_alteracao"));
			modelTutor.setObservacao(resultSet.getString("observacao"));
			modelTutor.setStatus(
				new Status(
					resultSet.getString("id_status"),
					resultSet.getString("status"),
					resultSet.getString("cor_status"))
			);
			modelTutor.setCep(
				new Endereco(resultSet.getString("cep"), resultSet.getString("logradouro"),
					new Bairro(resultSet.getInt("id_bairro"), resultSet.getString("bairro"),
						new Cidade(resultSet.getInt("id_cidade"), resultSet.getString("cidade"),
							new Estado(resultSet.getString("uf"))
						)
					), resultSet.getString("ibge"), resultSet.getString("ddd"), resultSet.getString("siafi")
				)
			);
			modelTutor.setNum_end(resultSet.getString("num_end"));
			modelTutor.setCompl_end(resultSet.getString("compl_end"));
			modelTutor.setContato(
				new Contato(
					resultSet.getString("cpf_tutor"),
					resultSet.getString("email"),
					resultSet.getString("telefone"),
					resultSet.getString("whatsapp"))
			);
			modelTutor.setRedeSocial(
				new RedeSocial(
					resultSet.getString("instagram"),
					resultSet.getString("youtube"),
					resultSet.getString("tiktok"),
					resultSet.getString("twitter"),
					resultSet.getString("linkedin"),
					resultSet.getString("facebook"),
					resultSet.getString("snapchat"))
			);
			
			list.add(modelTutor);
		}
		
		return list;
	}
	
	/** Desvincular PET do TUTOR pelo atributo CPFs.
	 * 
	 * @param cpfPet
	 * @param cpfTutor
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 09/09/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void desvincularPet(String cpfPet, String cpfTutor) throws SQLException {
		sql = "CALL sp_pet_del_pet_tutor(?, ?)";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpfPet);
		call.setString(2, cpfTutor);
		
		resultSet = call.executeQuery();		
	}
	
	/** Vincular PET do TUTOR pelo atributo CPFs.
	 * 
	 * @param cpfPet
	 * @param cpfTutor
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 09/09/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public String vincularPet(String cpfPet, String cpfTutor) throws SQLException {
		sql = "CALL sp_pet_vinc_pet_tutor(?, ?)";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpfPet);
		call.setString(2, cpfTutor);
		
		resultSet = call.executeQuery();
		
		while(resultSet.next()) {
			return resultSet.getString("resultado");
		}
		
		return "error";
		
	}
	
	public void migrarTutor(String cpf) throws SQLException {
		sql = "CALL sp_pes_migr_tutor(?)";
		
		call = connection.prepareCall(sql);
		call.setString(1, cpf);
		
		resultSet = call.executeQuery();
		
		connection.commit();
	}

	/** Adiciona ou alterar o Tutor.
	 * 
	 * @param opcao Um inteiro representando a opção de pesquisa (1 a 2) 
	 * * 1: Cadastrar<br>
	 * * 2: Alterar<br>
	 * @param tutor Um objeto tutor contendo as informações a ser adicionados ou alterados.
	 * 
	 * @throws SQLException se ocorrer algum erro durante a execução da consulta.
	 * 
	 * @version 1.0.0
	 * @since Criação: 27/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public void add_upd(int opcao, Tutor tutor) throws SQLException {
		sql = "CALL sp_pes_add_upd_tutor(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		
		call = connection.prepareCall(sql);
		call.setInt(1, opcao);
		call.setString(2, tutor.getCpf());
		call.setString(3, tutor.getNome().toUpperCase());
		call.setString(4, tutor.getRg());
		call.setString(5, tutor.getDt_nasc());
		call.setString(6, tutor.getSexo());
		call.setString(7, tutor.getCep().getCep());
		call.setString(8, tutor.getNum_end());
		call.setString(9, tutor.getCompl_end());
		call.setString(10, opcao == 1 ? tutor.getDt_cadastro() : tutor.getDt_alteracao());
		call.setString(11, tutor.getObservacao().toUpperCase());
		call.setString(12, tutor.getRedeSocial().getInstagram().toUpperCase());			
		call.setString(13, tutor.getRedeSocial().getYoutube().toUpperCase());			
		call.setString(14, tutor.getRedeSocial().getTiktok().toUpperCase());			
		call.setString(15, tutor.getRedeSocial().getTwitter().toUpperCase());			
		call.setString(16, tutor.getRedeSocial().getLinkedin().toUpperCase());			
		call.setString(17, tutor.getRedeSocial().getFacebook().toUpperCase());			
		call.setString(18, tutor.getRedeSocial().getSnapchat().toUpperCase());			
		call.setString(19, tutor.getContato().getTelefone());			
		call.setString(20, tutor.getContato().getWhatsapp().equalsIgnoreCase("-1") ? "" : tutor.getContato().getWhatsapp());			
		call.setString(21, tutor.getContato().getEmail().toUpperCase());			
		call.setString(22, tutor.getStatus().getId());			
		
		call.execute();
		
		connection.commit();
	}

	
}
