package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Usuario;

import java.io.IOException;
import java.sql.SQLException;

import dao.DAOLogin;

@WebServlet(urlPatterns = {"/ServletLogin", "/menu/ServletLogin"})
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private DAOLogin login = new DAOLogin();
	
    public ServletLogin() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario usuario = new Usuario(request.getParameter("login"), request.getParameter("senha"));
		String url = request.getParameter("url");
		
		try {
			
			if(request.getParameter("codHotel").equalsIgnoreCase("nat0526")) {
				if(request.getParameter("login") != null && !request.getParameter("login").isEmpty()
					&& request.getParameter("senha") != null && !request.getParameter("senha").isEmpty()) {
					if(login.autenticar(usuario)) {
						
						usuario = login.usuario(request.getParameter("login"));
						request.getSession().setAttribute("sysUsuario", usuario.getNome());
						
						if(url == null || url.equalsIgnoreCase("null")) {
							url = "principal.jsp";
						}
						
						request.setAttribute("msg", "Usuário/Senha inválido!");
						request.getRequestDispatcher(url).forward(request, response);
						
					} else {
						request.setAttribute("msg", "Usuário/Senha inválido!");
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
					
				} else {
					request.setAttribute("msg", "Para acesso ao sistema, informe o Usuário/Senha!");
					request.getRequestDispatcher("idnex.jsp").forward(request, response);
				}
				
			} else {
				request.setAttribute("msg", "Código do Hotel não encontrado!");
				request.getRequestDispatcher("idnex.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher(url).forward(request, response);
		}
		
		
	}

}
