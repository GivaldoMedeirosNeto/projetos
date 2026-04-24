package br.vet.petclini.model.endereco;

import java.util.Objects;

import br.vet.petclini.dao.pessoa.EnderecoDAO;
import br.vet.petclini.interfaces.BuscarCep;

/** Classe modelo que representa um endereço.
 * <br>
 * Essa classe é utilizada para armazenar informações relacionadas a um endereço,
 * incluindo o CEP, logradouro, bairro, IBGE, DDD e SIAFI.
 * <br>
 * Ela também implementa a interface {@link BuscarCep}, permitindo pesquisar um endereço
 * na base de dados a partir de um CEP fornecido.
 * 
 * @see BuscarCep
 * @see EnderecoDAO
 * 
 * @version 1.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto
 * 
 */
public class Endereco implements BuscarCep {
	
	private String cep;
	private String logradouro;
	private Bairro bairro;
	private String ibge;
	private String ddd;
	private String siafi;

	/* Constructors */
	
	/** Construtor padrão para criar um objeto Endereço vazio.
	 * <br>
	 * Cria uma instância de Endereço com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto Endereço sem fornecer inicialmente nenhum valor para seus atributos.
	 * 
	 */
	public Endereco() {}
	
	/** Construtor personalizado para criar um objeto Endereco com os principais atributos preenchidos.
	 * 
	 * @param cep O CEP do endereço.
	 * @param logradouro O logradouro do endereço.
	 * @param bairro O bairro do endereço.
	 */
	public Endereco(String cep, String logradouro, Bairro bairro) {
		this.cep = cep;
		this.logradouro = logradouro;
		this.bairro = bairro;
	}
	
	/** Construtor personalizado para criar um objeto Endereco com todos os atributos preenchidos.
	 * 
	 * @param cep O CEP do endereço.
	 * @param logradouro O logradouro do endereço.
	 * @param bairro O bairro do endereço.
	 * @param ibge O código IBGE do endereço.
	 * @param ddd O código DDD do endereço.
	 * @param siafi O código SIAFI do endereço.
	 */
	public Endereco(String cep, String logradouro, Bairro bairro, String ibge, String ddd, String siafi) {
		this.cep = cep;
		this.logradouro = logradouro;
		this.bairro = bairro;
		this.ibge = ibge;
		this.ddd = ddd;
		this.siafi = siafi;
	}
	
	/* Getters and Setters */
	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public Bairro getBairro() {
		return bairro;
	}

	public void setBairro(Bairro bairro) {
		this.bairro = bairro;
	}

	public String getIbge() {
		return ibge;
	}

	public void setIbge(String ibge) {
		this.ibge = ibge;
	}

	public String getDdd() {
		return ddd;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getSiafi() {
		return siafi;
	}

	public void setSiafi(String siafi) {
		this.siafi = siafi;
	}
	
	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Endereco [cep=" + cep + ", logradouro=" + logradouro + ", bairro=" + bairro + ", ibge=" + ibge
				+ ", ddd=" + ddd + ", siafi=" + siafi + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(bairro, cep, ddd, ibge, logradouro, siafi);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Endereco other = (Endereco) obj;
		return Objects.equals(bairro, other.bairro) && Objects.equals(cep, other.cep) && Objects.equals(ddd, other.ddd)
				&& Objects.equals(ibge, other.ibge) && Objects.equals(logradouro, other.logradouro)
				&& Objects.equals(siafi, other.siafi);
	}

	/* Methods */
	
	/** Pesquisa um endereço na base de dados a partir de um CEP fornecido.
	 * <br>
	 * Esse método utiliza a classe {@link EnderecoDAO} para realizar a consulta
	 * na base de dados e retornar o endereço correspondente ao CEP fornecido.
	 * 
	 * @param cep O CEP do endereço a ser pesquisado.
	 * @return O objeto {@link Endereco} correspondente ao CEP fornecido, ou um objeto vazio se não encontrado.
	 * 
	 * @see EnderecoDAO#pesquisar(int, String)
	 * 
	 * @since Criação: 27/07/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Endereco buscar(String cep) {
		Endereco end = new Endereco();
		
		try {
			end = new EnderecoDAO().pesquisar(7, cep);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return end;
	}	
}
