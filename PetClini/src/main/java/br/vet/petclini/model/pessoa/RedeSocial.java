package br.vet.petclini.model.pessoa;

import java.util.Objects;

/** Classe modelo para representar uma Rede Social da Pessoa.
 * <br>
 * Essa classe contém os atributos que definem uma rede social da pessoa, como Instagram, Youtube, TikTok
 * Twitter, Linkedin, Faceboook, Snapacht.
 * 
 * @version 1.0
 * @since Criação: 07/08/23
 * @since Modificação:
 * 
 * @author Givaldo Medeiros Neto 
 */
public class RedeSocial {
	
	private String instagram;
	private String youtube;
	private String tiktok;
	private String twitter;
	private String linkedin;
	private String facebook;
	private String snapchat;
	
	/* Constructors */
	
	/** Construtor padrão para criar um objeto RedeSocial vazio.
	 * <br>
	 * Cria uma instância de RedeSocial com todos os atributos vazios ou com seus valores padrão.
	 * Esse construtor é útil quando se deseja criar um objeto RedeSocial sem fornecer inicialmente
	 * nenhum valor para seus atributos.
	 * 
	 */
	public RedeSocial() { }

	/** Construtor personalizado para criar um objeto RedeSocial vazio.
	 * <br>
	 * Cria uma instância de RedeSocial com todos os atributos devidamente preenchidos.
	 * Esse construtor é útil quando já se possui todas as informações necessárias para criar uma RedeSocial.
	 * 
	 */
	public RedeSocial(String instagram, String youtube, String tiktok, String twitter, String linkedin, String facebook,
			String snapchat) {
		this.instagram = instagram;
		this.youtube = youtube;
		this.tiktok = tiktok;
		this.twitter = twitter;
		this.linkedin = linkedin;
		this.facebook = facebook;
		this.snapchat = snapchat;
	}

	
	/* Getters and Setters */
	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getTiktok() {
		return tiktok;
	}

	public void setTiktok(String tiktok) {
		this.tiktok = tiktok;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getLinkedin() {
		return linkedin;
	}

	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getSnapchat() {
		return snapchat;
	}

	public void setSnpachat(String snapchat) {
		this.snapchat = snapchat;
	}

	/* ToString and HasCod/Equals */
	@Override
	public String toString() {
		return "RedeSocial [instagram=" + instagram + ", youtube=" + youtube + ", tiktok=" + tiktok + ", twitter="
				+ twitter + ", linkedin=" + linkedin + ", facebook=" + facebook + ", snapchat=" + snapchat + "]";
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(facebook, instagram, linkedin, snapchat, tiktok, twitter, youtube);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RedeSocial other = (RedeSocial) obj;
		return Objects.equals(facebook, other.facebook) && Objects.equals(instagram, other.instagram)
				&& Objects.equals(linkedin, other.linkedin) && Objects.equals(snapchat, other.snapchat)
				&& Objects.equals(tiktok, other.tiktok) && Objects.equals(twitter, other.twitter)
				&& Objects.equals(youtube, other.youtube);
	}
	
	/* Methods */

	

}
