package view;

import model.Cep;
import service.CepService;

public class TesteView {
	
	public static void main(String[] args) {
		
		Cep cep = new Cep();
		cep = new CepService().buscarCep("00000000");
		
		if(cep.getCepValido()) {
			
			System.out.println(
				cep.getCep() + ", " + 
				cep.getLogadouro() + ", " + 
				cep.getBairro() + ", " + 
				cep.getCidade() + ", " + 
				cep.getUf() + ", " + 
				cep.getIbge() + ", " + 
				cep.getDdd() + ", " + 
				cep.getSiafi() + ";"
			);
			
		} else {
			System.out.println("Cep não encontrado na base de dados.");
		}
	}

}
