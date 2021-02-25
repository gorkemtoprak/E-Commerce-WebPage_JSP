

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username, password, re_password;
		username = request.getParameter("username");
		password = request.getParameter("password");
		String page = null;
		
		RegisterDB registerDB = new RegisterDB(username, password);
		DBConnection dbConnection = new DBConnection();
		
	
		String userRegistered = dbConnection.insert(registerDB);	
        
        if(userRegistered.equals("SUCCESS")){
           request.getRequestDispatcher("/products.jsp").forward(request, response);
        }
        else{
           request.setAttribute("errMessage", userRegistered);
           request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
//		response.sendRedirect("login.jsp");
//		request.getRequestDispatcher(page).forward(request, response);
	}

}
