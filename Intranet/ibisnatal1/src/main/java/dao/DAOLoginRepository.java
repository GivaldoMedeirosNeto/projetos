package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCrypt;

import connection.SingleConnection;
import model.Usuario;


public class DAOLoginRepository {
	
	private Connection connection;
	
	public DAOLoginRepository() {
		connection = SingleConnection.getConnection();
	}
	
	
	public boolean autenticar(Usuario usuario) throws SQLException {
		
		String sql = "SELECT pass FROM usuarios WHERE login = ?;";

	    PreparedStatement statement = connection.prepareStatement(sql);
	    statement.setString(1, usuario.getLogin());

	    ResultSet resultado = statement.executeQuery();

	    if (resultado.next()) {
	        return BCrypt.checkpw(usuario.getPass(), resultado.getString("pass"));
	    }

	    return false;
		
	}
	
	public Usuario usuario(Usuario usuario) throws SQLException {
		
		String sql = "SELECT * FROM usuarios WHERE login = ?;";

	    try {
	    	PreparedStatement statement = connection.prepareStatement(sql);
		    statement.setString(1, usuario.getLogin());

		    ResultSet resultado = statement.executeQuery();
		    
		    while(resultado.next()) {
		    	usuario.setIdUsuario(resultado.getInt("idUsuario"));
		    	usuario.setNome(resultado.getString("nome"));
				usuario.setLogin(resultado.getString("login"));
				usuario.setPass("");
				usuario.setSetor(resultado.getString("setor"));
			}		    
			
		} catch (Exception e) {
			// TODO: handle exception
		}    

	    return usuario;
		
	}

}
