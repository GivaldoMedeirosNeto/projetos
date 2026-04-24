package br.vet.petclini.services;

import java.net.URL;
import java.util.Iterator;

import javax.swing.JOptionPane;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import br.vet.petclini.model.endereco.Bairro;
import br.vet.petclini.model.endereco.Cidade;
import br.vet.petclini.model.endereco.Endereco;
import br.vet.petclini.model.endereco.Estado;

/** Webservice que pesquisa o endereço através do CEP fornecido
 * <br>
 * Utiliza a API <a href="http://viacep.com.br/">Via Cep</a> para buscar informações de endereço.
 * <br>
 * Esta classe é responsável por realizar uma requisição ao Webservice Via Cep com base em um CEP fornecido,
 * obter as informações de endereço associadas ao CEP e criar um objeto do tipo Endereco com essas informações.
 * 
 * @version 1.0
 * @since Criação: 24/05/23
 * @since Última modificação:
 * 
 * @see br.vet.petclini.model.endereco.Endereco
 * @see br.vet.petclini.model.endereco.Bairro
 * @see br.vet.petclini.model.endereco.Cidade
 * @see br.vet.petclini.model.endereco.Estado
 * 
 * @author Givaldo Medeiros Neto
 */
public class WebServiceBuscarCep {
	
	private URL url;
	private SAXReader xml = new SAXReader();
	private Document document;
	private Element root;
	private Endereco endereco;
	private StringBuilder saida = new StringBuilder();
	
	/** Método que busca o endereço através do CEP fornecido.
	 * 
	 * @param cep O CEP para o qual deseja-se obter informações de endereço.
	 * @return Um objeto do tipo Endereco contendo as informações do endereço associado ao CEP fornecido.
	 *         Caso o CEP seja inválido, retorna null.
	 * @throws Exception se ocorrer algum erro durante a busca do endereço.
	 *
	 * @version 1.0	 
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public Endereco buscar(String cep) {		
		
		try {
			viaCep(cep.replace("-", "").replace(".", ""));
		} catch (Exception e) {
			
			for (int i = 0; i < e.getStackTrace().length ; i++) {
				saida.append("Erro no WebServiceBuscarCep\n");
				saida.append("Class Error: " + e.getClass().getName());
				saida.append("Class Error System: " + e.getStackTrace()[i].getClassName());
				saida.append("Methods Error: " + e.getStackTrace()[i].getMethodName());
				saida.append("Line Error: " + e.getStackTrace()[i].getLineNumber());
			}
			
			JOptionPane.showMessageDialog(null, saida.toString());
			
		}
		
		return endereco;
	}
	
	/** Método privado para efetuar a pesquisa de endereço no webservice Via Cep a partir do CEP fornecido.
	 * <br>
	 * O método utiliza a API Via <a href="http://viacep.com.br/">Via Cep</a> para realizar uma requisição HTTP no webservice
	 * com o CEP informado. Em seguida, o XML de resposta é processado utilizando a biblioteca DOM4J para
	 * extrair as informações de endereço associadas ao CEP.
	 * 
	 * @param cep O CEP para o qual deseja-se obter informações de endereço.
	 * @throws Exception se ocorrer algum erro durante a busca do endereço ou no processamento da resposta XML.
	 * 
	* @version 1.0.0	 
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private void viaCep(String cep) throws Exception {
		url = new URL("http://viacep.com.br/ws/" + cep + "/xml/");
		document = xml.read(url);
		root = document.getRootElement();
		
		String logradouro="", bairro="", cidade="", uf="",
				ibge="", ddd="", siafi="";
		
		for(Iterator<Element> it = root.elementIterator(); it.hasNext();) {
			Element element = it.next();
			
			if(element.getQualifiedName().equals("erro")) {
				JOptionPane.showMessageDialog(null, "CEP Inválido");
				break;
			} else {				
				if(element.getQualifiedName().equals("logradouro")) {
	        		logradouro = element.getText();
				}
				
				if(element.getQualifiedName().equals("bairro")) {
	        		bairro = element.getText();
				}
				
				if(element.getQualifiedName().equals("localidade")) {
					cidade = element.getText();
				}
				
				if(element.getQualifiedName().equals("uf")) {
					uf = element.getText();
				}
				
				if(element.getQualifiedName().equals("ibge")) {
					ibge = element.getText();
				}
				
				if(element.getQualifiedName().equals("ddd")) {
					ddd = element.getText();
				}
				
				if(element.getQualifiedName().equals("siafi")) {
					siafi = element.getText();
				}
				
				endereco = 
					new Endereco(cep, logradouro,
						new Bairro(bairro,
							new Cidade(cidade,
								new Estado(uf)
							)
						)
					);
				endereco.setIbge(ibge);
				endereco.setDdd(ddd);
				endereco.setSiafi(siafi);
				
			}
			
		}
		
	}
	
}
