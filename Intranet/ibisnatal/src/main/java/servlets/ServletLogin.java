package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;

import java.io.IOException;

import dao.DAOLoginRepository;

@WebServlet(urlPatterns = {"/ServletLogin", "/principal/ServletLogin"})
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private DAOLoginRepository daoLogin = new DAOLoginRepository();
       

    public ServletLogin() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String url = request.getParameter("url");
			
			if(request.getParameter("login") != null && !request.getParameter("login").isEmpty()
				&& request.getParameter("pass") != null && !request.getParameter("pass").isEmpty()) {
				
				Usuario usuario = new Usuario(request.getParameter("login"), request.getParameter("pass"));
				
				if(daoLogin.autenticar(usuario)) {
					
					request.getSession().setAttribute("usuario", usuario.getLogin());
					
					if(url == null || url.equals("null")) {
						url = "principal/principal.jsp";
					}
					
					RequestDispatcher rediricionar = request.getRequestDispatcher(url);
					rediricionar.forward(request, response);
					
				} else {
					RequestDispatcher rediricionar = request.getRequestDispatcher("/index.jsp");
					request.setAttribute("msg", "Login/Senha Inválido!");
					rediricionar.forward(request, response);
				}
				
			} else {
				RequestDispatcher rediricionar = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Para acesso ao sistema informe o Login/Senha!");
				rediricionar.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher rediricionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			rediricionar.forward(request, response);
		}
		
	}

}
