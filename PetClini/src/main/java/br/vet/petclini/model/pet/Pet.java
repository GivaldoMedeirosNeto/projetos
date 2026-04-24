package br.vet.petclini.model.pet;

import java.util.Objects;

import br.vet.petclini.model.gerenic.Status;

/** Classe modelo para representar um objeto Pet.
 * <br>
 * Essa classe contém os atributos que definem o objeto Pet, tais como:<br>
 * Cpf Pet, Nome, Raca, Coloracao, Sexo, Convivio, Castrado,
 * Data/Hora de Cadastro/Alteração, Data e Hora de Falecimento(Caso seja necessário),
 * Observação e Status
 * 
 * @version 1.0.0
 * @since Criação: 22/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Pet {
	
	private String cpf_pet;
	private String nome;
	private String dt_nasc;
	private Raca raca;
	private Coloracao coloracao;
	private String sexo;
	private String convivio;
	private String castrado;
	private String dt_cadastro;
	private String dt_alteracao;
	private String dt_falecimento;
	private String observacao;
	private Status status;
	private String cpf_tutor;
	private String tutor;
	
	/* Constructors */
	
	 /** Construtor padrão para criar um objeto NOME DA CLASSE vazio.
     * <br>
     * Cria uma instância de NOME DA CLASSE com todos os atributos vazios ou com seus valores padrão.
     * Esse construtor é útil quando se deseja criar um objeto NOME DA CLASSE sem fornecer inicialmente
     * nenhum valor para seus atributos.
     * 
     */
	public Pet() {}
	
	/** Construtor personalizado para criar um objeto PET com todos os atributos preenchidos.
	 * <br>
	 * Cria uma instância de PET com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui as informações necessárias para criar o objeto.
	 *
	 * @param cpf
	 * @param nome
	 * @param dt_nasc
	 * @param raca
	 * @param colocarao
	 * @param sexo
	 * @param convivio
	 * @param castrado
	 * @param dt_cadastro
	 * @param dt_alteracao
	 * @param dt_falecimento
	 * @param observacao
	 * @param status
	 * 
	 * @version 1.0.0
	 * @since Criação: 22/08/23
	 * @since Modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Pet(String cpf_pet, String nome, String dt_nasc, Raca raca, Coloracao coloracao, String sexo, String convivio, String castrado,
			String dt_cadastro, String dt_alteracao, String dt_falecimento, String observacao, Status status, String cpf_tutor,
			String tutor) {
		this.cpf_pet = cpf_pet;
		this.nome = nome;
		this.dt_nasc = dt_nasc;
		this.raca = raca;
		this.coloracao = coloracao;
		this.sexo = sexo;
		this.convivio = convivio;
		this.castrado = castrado;
		this.dt_cadastro = dt_cadastro;
		this.dt_alteracao = dt_alteracao;
		this.dt_falecimento = dt_falecimento;
		this.observacao = observacao;
		this.status = status;
		this.cpf_tutor = cpf_tutor;
		this.tutor = tutor;
	}

    /* Getters and Setters */
	public String getCpf_pet() {
		return cpf_pet;
	}

	public void setCpf_pet(String cpf_pet) {
		this.cpf_pet = cpf_pet;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getDt_nasc() {
		return dt_nasc;
	}

	public void setDt_nasc(String dt_nasc) {
		this.dt_nasc = dt_nasc;
	}

	public Raca getRaca() {
		return raca;
	}

	public void setRaca(Raca raca) {
		this.raca = raca;
	}

	public Coloracao getColoracao() {
		return coloracao;
	}

	public void setColoracao(Coloracao coloracao) {
		this.coloracao = coloracao;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getConvivio() {
		return convivio;
	}

	public void setConvivio(String convivio) {
		this.convivio = convivio;
	}

	public String getCastrado() {
		return castrado;
	}

	public void setCastrado(String castrado) {
		this.castrado = castrado;
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

	public String getDt_falecimento() {
		return dt_falecimento;
	}

	public void setDt_falecimento(String dt_falecimento) {
		this.dt_falecimento = dt_falecimento;
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
	
	public String getCpf_tutor() {
		return cpf_tutor;
	}

	public void setCpf_tutor(String cpf_tutor) {
		this.cpf_tutor = cpf_tutor;
	}

	public String getTutor() {
		return tutor;
	}

	public void setTutor(String tutor) {
		this.tutor = tutor;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "Pet [cpf_pet=" + cpf_pet + ", nome=" + nome + ", dt_nasc=" + dt_nasc + ", raca=" + raca + ", coloracao="
				+ coloracao + ", sexo=" + sexo + ", convivio=" + convivio + ", castrado=" + castrado + ", dt_cadastro="
				+ dt_cadastro + ", dt_alteracao=" + dt_alteracao + ", dt_falecimento=" + dt_falecimento
				+ ", observacao=" + observacao + ", status=" + status + ", cpf_tutor=" + cpf_tutor + ", tutor=" + tutor
				+ "]";
	}
    
	@Override
	public int hashCode() {
		return Objects.hash(castrado, coloracao, convivio, cpf_pet, cpf_tutor, dt_alteracao, dt_cadastro,
				dt_falecimento, dt_nasc, nome, observacao, raca, sexo, status, tutor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pet other = (Pet) obj;
		return castrado == other.castrado && Objects.equals(coloracao, other.coloracao) && convivio == other.convivio
				&& Objects.equals(cpf_pet, other.cpf_pet) && Objects.equals(cpf_tutor, other.cpf_tutor)
				&& Objects.equals(dt_alteracao, other.dt_alteracao) && Objects.equals(dt_cadastro, other.dt_cadastro)
				&& Objects.equals(dt_falecimento, other.dt_falecimento) && Objects.equals(dt_nasc, other.dt_nasc)
				&& Objects.equals(nome, other.nome) && Objects.equals(observacao, other.observacao)
				&& Objects.equals(raca, other.raca) && Objects.equals(sexo, other.sexo)
				&& Objects.equals(status, other.status) && Objects.equals(tutor, other.tutor);
	}
	
	/* Methods */
	
	/** Gerador de CPF para Pet.
	 * <br>
	 * Gera um CPF para o PET utilizando as informações relevantes
	 * em sua criação, exemplo(XXMMYYSSMM).
	 * <br>
	 * XX = Representam o ano de cadastro.<br>
	 * MMYY = Representam o mês e o ano de nascimento do pet.<br>
	 * SS = Representam o segundo das horas no ato do cadastro.<br>
	 * MM = Representam o minuto das horas no ato do cadastro.<br>
	 * 
	 * @param pet O Objeto PET contendo informações relevantes.
	 * @return string sequência XXMMYYSSMM gerado.
	 * 
	 * @version 1.0.0
	 * @since Criação: 28/08/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public String gerar_cpf_pet(Pet pet) {
		String[] dataTime = pet.getDt_cadastro().split("[ /:]");
		String[] dataNasc = pet.getDt_nasc().split("[/]");
		
		return dataTime[2].substring(dataTime[2].length() -2) + dataNasc[1] +
			dataNasc[2].substring(dataTime[2].length() -2) + dataTime[5] + dataTime[4];
	}
	
}
