
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *      
	 *      THIS IS THE SECOND OPTION..
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username, password;
		username = request.getParameter("username");
		password = request.getParameter("password");

		RegisterDB registerDB = new RegisterDB(username, password);
		DBConnection dbConnection = new DBConnection();

		
//		String userRegistered = dbConnection.insert(registerDB);	
//        
//        if(userRegistered.equals("SUCCESS")){
//           request.getRequestDispatcher("/products.jsp").forward(request, response);
//        }
//        else{
//           request.setAttribute("errMessage", userRegistered);
//           request.getRequestDispatcher("/home.jsp").forward(request, response);
//        }

		if (username.equals("gorkem") && password.equals("123456")) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			response.sendRedirect("products.jsp");
		} else {
			response.getWriter().write("Error! Your username or password is invalid.");
		}

	}

}
