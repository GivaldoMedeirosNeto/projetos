package constantes;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

public class DataHora {
	
	LocalDateTime dataHora = LocalDateTime.now();
	
	public String mes() {		
		return dataHora.getMonth().getDisplayName(TextStyle.FULL, new Locale("pt", "BR"));    
	}
	
	public String dataCompleta() {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yy HH:mm:ss"));
	}

}
