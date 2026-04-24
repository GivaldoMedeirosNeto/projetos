package br.vet.petclini.constants;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/** Classe para manipulação de data e hora.<br>
 * Esta classe oferece métodos para trabalhar com data e hora no sistema, incluindo
 * obtenção da data e hora atual, verificação de datas passadas, e cálculo de dias
 * de expiração em relação à data atual.
 * 
 * @version 1.0
 * @since Criação: 24/05/23
 * @since Última modificação:
 * 
 * @author Givaldo Medeiros Neto
 */
public class DataHora {

	/** Obtém a data e hora atual do sistema.
	 * 
	 * @return Data e hora atual no formato "dd/MM/yyyy HH:mm:ss".
	 * @throws
	 * 
	 * @version 1.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public String dataAtual() {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
	}
	
	/** Verifica se a data é anterior à data atual do sistema.
	 * 
	 * @param data Uma string que representa a data a ser verificada no formato "dd/MM/yyyy HH:mm:ss".
	 * @return True se a data fornecida for anterior à data atual, False caso contrário.
	 * @throws ParseException se ocorrer um erro ao analisar a data fornecida.
	 * 
	 * @version 1.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public boolean dataAnteriorAtual(String data) throws ParseException{
		if(formatacaoData().parse(data).before(formatacaoData().parse(dataAtual()))){
			return true;
		} else {
			return false;
		}
	}
	
	/** Calcula o número de dias entre a data fornecida e a data atual do sistema.
	 * 
	 * @param data Uma string que representa a data a ser comparada no formato "dd/MM/yyyy HH:mm:ss".
	 * @return O número de dias entre a data fornecida e a data atual.
	 * @throws ParseException se ocorrer um erro ao analisar a data fornecida.
	 * 
	 * @version 1.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	public long expiracao(String data) throws ParseException {		
		return ChronoUnit.DAYS.between(LocalDate.now(), LocalDate.parse(dataConvertida(data)));
	}
	
	/** Formata a Data/Hora no formato "dd/MM/yyyy HH:mm:ss".
	 * 
	 * @return Um objeto DateFormat configurado para o formato "dd/MM/yyyy HH:mm:ss".
	 * 
	 * @version 1.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private DateFormat formatacaoData() {
		return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	}
	
	/** Formata a Datayyyy-MM-dd e formata em  dd/MM/yyyy.
	 * 
	 * @return data em formato "dd/MM/yyyy".
	 * 
	 * @version 1.0.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 * @throws ParseException 
	 */
	public String formatacaoData(String data) throws ParseException {
		data += " 00:00:00";
		LocalDateTime localDateTime = LocalDateTime.parse(data, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));		
		return localDateTime.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
	}
	
	/** Converte a Data/Hora fornecida para o formato "yyyy-MM-dd".
	 * 
	 * @param data Uma string que representa a data a ser convertida no formato "dd/MM/yyyy HH:mm:ss".
	 * @return A data convertida no formato "yyyy-MM-dd".
	 * 
	 * @version 1.0
	 * @since Criação: 24/05/23
	 * @since Última modificação:
	 * 
	 * @author Givaldo Medeiros Neto
	 */
	private String dataConvertida(String data) {
		LocalDateTime localDateTime = LocalDateTime.parse(data, DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));		
		return localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	}
	
}