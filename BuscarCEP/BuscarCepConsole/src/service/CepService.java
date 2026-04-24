package service;

import java.net.URL;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import model.Cep;

public class CepService {
	
	URL url;
	SAXReader xml = new SAXReader();
	Document document;
	Element root;
	String retornoXML;
	Cep cepModel = new Cep();
	
	/* Removendo o '-' e o '.' do cep */
	public Cep buscarCep(String cep) {
		try {
			viaCep(cep.replace("-", "").replace(".", ""));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}		
		return cepModel;		
	}	

	/* Webservice Via Cep */
	private void viaCep(String cep) throws Exception {
		url = new URL("http://viacep.com.br/ws/" + cep + "/xml/");
		document = xml.read(url);
		root = document.getRootElement();
		
		for(Iterator<Element> it = root.elementIterator(); it.hasNext();) {				
			Element element = it.next();
			
			if(element.getQualifiedName().equals("erro")) {
	        	cepModel.setCepValido(false);
	        } else {
	        	cepModel.setCepValido(true);
	        	
	        	cepModel.setCep(cep);

	        	if(element.getQualifiedName().equals("logradouro")) {
	        		cepModel.setLogadouro(element.getText());
				}
	        	
	        	if(element.getQualifiedName().equals("bairro")) {
	        		cepModel.setBairro(element.getText());
				}
	        	
	        	if(element.getQualifiedName().equals("localidade")) {
	        		cepModel.setCidade(element.getText());
				}
	        	
	        	if(element.getQualifiedName().equals("uf")) {
	        		cepModel.setUf(element.getText());
				}
	        	
	        	if(element.getQualifiedName().equals("ibge")) {
	        		cepModel.setIbge(element.getText());
				}
	        	
	        	if(element.getQualifiedName().equals("ddd")) {
					cepModel.setDdd(element.getText());
				}
	        	
				if(element.getQualifiedName().equals("siafi")) {
					cepModel.setSiafi(element.getText());
				}		
			}	
			
		}
		
	}
	
}
