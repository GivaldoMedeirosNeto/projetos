package br.vet.petclini.model.pessoa;

import java.sql.SQLException;
import java.util.Objects;

import br.vet.petclini.dao.pessoa.PessoaDAO;
import br.vet.petclini.model.acesso.Login;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.gerenic.Imagem;
import br.vet.petclini.model.gerenic.Status;

/** Classe modelo para representar um objeto PESSOA.
 * <br>
 * Classe modelo para representar um objeto PESSOA com os seus atributos:<br>
 * CPF - NOME - RG - DT_NASC - SEXO - ENDERECO(CEP) - NUM_END - COMPL_END
 * DT_CADASTRO - DT_ALTERACAO - OBSERVACAO - STATUS - REDESOCIAL - CONTATO
 * IMAGEM - ACESSO
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Pessoa {
	
	private String cpf;
	private String nome;
	private String rg;
	private String dt_nasc;
	private String sexo;
	private Endereco cep;
	private String num_end;
	private String compl_end;
	private String dt_cadastro;
	private String dt_alteracao;
	private String observacao;
	private Status status;
	private RedeSocial redeSocial;
	private Contato contato;
	private Imagem imagem;
	private Login acesso;	
	
	/* Constructors */
	
	/** Construtor padrão objeto PESSOA.
	 * Cria uma instância de PESSOA sem seus atributos preenchidos(vazio).
	 */
	public Pessoa() {}
	
	/** Construtor personalizado objeto PESSOA.
	 * Cria uma instância de PESSOA com alguns dos seus atributos preenchidos.<br>
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
    public Pessoa(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
		String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status) {
		this.cpf = cpf;
		this.nome = nome;
		this.rg = rg;
		this.dt_nasc = dt_nasc;
		this.sexo = sexo;
		this.cep = cep;
		this.num_end = num_end;
		this.compl_end = compl_end;
		this.dt_cadastro = dt_cadastro;
		this.dt_alteracao = dt_alteracao;
		this.observacao = observacao;
		this.status = status;
	}

    /** Construtor personalizado objeto PESSOA.
	 * Cria uma instância de PESSOA com alguns dos seus atributos preenchidos.<br>
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
    public Pessoa(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
		String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status, RedeSocial redeSocial,
		Contato contato, Imagem imagem) {
		this.cpf = cpf;
		this.nome = nome;
		this.rg = rg;
		this.dt_nasc = dt_nasc;
		this.sexo = sexo;
		this.cep = cep;
		this.num_end = num_end;
		this.compl_end = compl_end;
		this.dt_cadastro = dt_cadastro;
		this.dt_alteracao = dt_alteracao;
		this.observacao = observacao;
		this.status = status;
		this.redeSocial = redeSocial;
		this.contato = contato;
		this.imagem = imagem;
	}
    
    /** Construtor personalizado objeto PESSOA.
	 * Cria uma instância de PESSOA com alguns dos seus atributos preenchidos.<br>
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
    public Pessoa(String cpf, String nome, String rg, String dt_nasc, String sexo, Endereco cep, String num_end,
		String compl_end, String dt_cadastro, String dt_alteracao, String observacao, Status status, RedeSocial redeSocial,
		Contato contato, Imagem imagem, Login acesso) {
		this.cpf = cpf;
		this.nome = nome;
		this.rg = rg;
		this.dt_nasc = dt_nasc;
		this.sexo = sexo;
		this.cep = cep;
		this.num_end = num_end;
		this.compl_end = compl_end;
		this.dt_cadastro = dt_cadastro;
		this.dt_alteracao = dt_alteracao;
		this.observacao = observacao;
		this.status = status;
		this.redeSocial = redeSocial;
		this.contato = contato;
		this.imagem = imagem;
		this.acesso = acesso;
	}
    
	/* Getters and Setters */
	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getDt_nasc() {
		return dt_nasc;
	}

	public void setDt_nasc(String dt_nasc) {
		this.dt_nasc = dt_nasc;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Endereco getCep() {
		return cep;
	}

	public void setCep(Endereco cep) {
		this.cep = cep;
	}

	public String getNum_end() {
		return num_end;
	}

	public void setNum_end(String num_end) {
		this.num_end = num_end;
	}

	public String getCompl_end() {
		return compl_end;
	}

	public void setCompl_end(String compl_end) {
		this.compl_end = compl_end;
	}

	public String getDt_cadastro() {
		return dt_cadastro;
	}

	public void setDt_cadastro(String dt_cadastro) {
		this.dt_cadastro = dt_cadastro;
	}

	public String getDt_alteracao() {
		return dt_alteracao;
	}

	public void setDt_alteracao(String dt_alteracao) {
		this.dt_alteracao = dt_alteracao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	
	public RedeSocial getRedeSocial() {
		return redeSocial;
	}

	
	public void setRedeSocial(RedeSocial redeSocial) {
		this.redeSocial = redeSocial;
	}

	
	public Contato getContato() {
		return contato;
	}

	
	public void setContato(Contato contato) {
		this.contato = contato;
	}

	
	public Imagem getImagem() {
		return imagem;
	}

	
	public void setImagem(Imagem imagem) {
		this.imagem = imagem;
	}
			
    public Login getAcesso() {
		return acesso;
	}

	public void setAcesso(Login acesso) {
		this.acesso = acesso;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Pessoa [cpf=" + cpf + ", nome=" + nome + ", rg=" + rg + ", dt_nasc=" + dt_nasc + ", sexo=" + sexo
				+ ", cep=" + cep + ", num_end=" + num_end + ", compl_end=" + compl_end + ", dt_cadastro=" + dt_cadastro
				+ ", dt_alteracao=" + dt_alteracao + ", observacao=" + observacao + ", status=" + status
				+ ", redeSocial=" + redeSocial + ", contato=" + contato + ", imagem=" + imagem + ", acesso=" + acesso
				+ "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(cep, compl_end, contato, cpf, dt_alteracao, dt_cadastro, dt_nasc, nome, num_end, observacao,
				redeSocial, rg, sexo, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pessoa other = (Pessoa) obj;
		return Objects.equals(cep, other.cep) && Objects.equals(compl_end, other.compl_end)
				&& Objects.equals(contato, other.contato) && Objects.equals(cpf, other.cpf)
				&& Objects.equals(dt_alteracao, other.dt_alteracao) && Objects.equals(dt_cadastro, other.dt_cadastro)
				&& Objects.equals(dt_nasc, other.dt_nasc) && Objects.equals(nome, other.nome)
				&& Objects.equals(num_end, other.num_end) && Objects.equals(observacao, other.observacao)
				&& Objects.equals(redeSocial, other.redeSocial) && Objects.equals(rg, other.rg)
				&& Objects.equals(sexo, other.sexo) && Objects.equals(status, other.status);
	}
	
    /* Methods */
	
	/** Consulta um objeto PESSOA pelo seu atributo CPF.
	 * <br>
	 * Este método utiliza o DAO(PessoaDAO) para consultar na base de dados uma pessoa com o CPF fornecido.
	 * O CPF fornecido como parâmetro é tratado para remover caracteres especiais antes de realizar a consulta.
	 * 
	 * @param cpf
	 * @return objeto PESSOA correspondente ao CPF fornecido.<br>
	 * Caso não haja cadastro retorna NULL
	 * @throws SQLException se ocorrer um erro durante a consulta ao banco de dados.
	 * 
	 * @see PessoaDAO#consultarCpf(String)
	 * 
	 * @version 1.0.0
	 * @since Criação: 27/07/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Pessoa consultarCpf(String cpf) throws SQLException {
		cpf = cpf.replace(".", "").replace("-", "");
		return new PessoaDAO().consultarCpf(cpf);
	}
	
 }