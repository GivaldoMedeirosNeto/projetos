package br.vet.petclini.model.gerenic;

/** Classe modelo para representar um objeto IMAGEM.
 * <br>
 * Classe modelo para representar um objeto IMAGEM dos objetos(PESSOA, PET) com os seus atributos:<br>
 * ID - CPF_PESSOA - CPF_PET - IMAGEM - EXTENSAO
 * 
 * @version 1.0.0
 * @since Criação: 27/07/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class Imagem {
	
	private int id;
	private String cpf_pessoa;
	private String cpf_pet;
	private String img;
	private String extensao_img;
		
	/* Constructors */
	
	/** Construtor padrão objeto IMAGEM.
	 * Cria uma instância de IMAGEM sem seus atributos preenchidos(vazio).
	 */
	public Imagem() {}
	
	/** Construtor personalizado objeto IMAGEM.
	 * Cria uma instância de IMAGEM com seus atributos preenchidos.<br>
	 * ID - VINCULO - CPF - IMAGEM - EXTENSAO<br>
	 * VINCULO(1: PESSOA | 2: PET)
	 */
	public Imagem(int id, int vinculo, String cpf, String img, String extensao_img) {
		this.id = id;
		if(vinculo == 1) {
			this.cpf_pessoa = cpf;			
		} else {
			this.cpf_pet = cpf;			
		}
		this.img = img;
		this.extensao_img = extensao_img;
	}
	
	
    /* Getters and Setters */
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCpf_pessoa() {
		return cpf_pessoa;
	}
	
	public void setCpf_pessoa(String cpf_pessoa) {
		this.cpf_pessoa = cpf_pessoa;
	}
	
	public String getCpf_pet() {
		return cpf_pet;
	}
	
	public void setCpf_pet(String cpf_pet) {
		this.cpf_pet = cpf_pet;
	}
	
	public String getImg() {
		return img;
	}
	
	public void setImg(String img) {
		this.img = img;
	}
	
	public String getExtensao_img() {
		return extensao_img;
	}
	
	public void setExtensao_img(String extensao_img) {
		this.extensao_img = extensao_img;
	}
	
    /* ToString and HasCod/Equals */
    /* Methods */

}