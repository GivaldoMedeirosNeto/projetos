package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

@WebServlet(urlPatterns = {"/ServletEscala", "/menu/ServletEscala"})
public class ServletEscala extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServletEscala() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		URL url = new URL("https://ibisnatal.com.br/intranet/pdfs/escala.pdf");
		InputStream input = url.openStream();
		
		response.setContentType("application/pdf");
		OutputStream out = response.getOutputStream();

		byte[] buffer = new byte[1024];
		int bytesRead;

		while ((bytesRead = input.read(buffer)) != -1) {
		    out.write(buffer, 0, bytesRead);
		}

		input.close();
		out.flush();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
