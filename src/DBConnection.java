import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;

public class DBConnection {

	private String username = "root";
	private String password = "159753sas";

	private String dbName = "webdb";

	private String host = "localhost";

	private int port = 3306;

	private String dbDriver = "com.mysql.cj.jdbc.Driver";

	private Statement statement = null;

	private String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName + "?useUnicode=true&characterEncoding=utf8";

	DBConnection() {
	};

	public Connection getConnection() {

		Connection connection = null;

		try {
			DriverManager.getConnection(url, username, password);
			System.out.println("Connection Succesfull...");
		} catch (SQLException e) {
			System.out.println("Connection Unsuccesfull...");
			e.printStackTrace();
		}

		try {
			connection = DriverManager.getConnection(url, username, password);

		} catch (SQLException ex) {
			// ex.printStackTrace();
		}
		return connection;
	}

	public void getDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

// 	 (username, password, re_password)

	public String insert(RegisterDB register) {
		String result;
		getDriver(dbDriver);
		Connection con = getConnection();
		String sql = "INSERT INTO webdb.member VALUES(?, ?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, register.getUsername());
			ps.setString(2, register.getPassword());
//	 		ps.setString(3, register.getRepassword());
			result = "User succesfully entered";
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "User not entered";
		}
		return result;
	}

	//Second option for the retrieving data from mysql
	public ProductsDB get(int id) throws SQLException, IOException {
		ProductsDB products = null;

		String sql = "SELECT * FROM webdb.products WHERE id = ?";

		try (Connection connection = DriverManager.getConnection(url, username, password)) {
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();

			if (result.next()) {
				products = new ProductsDB();
				String model = result.getString("model");
				String type = result.getString("type");
				int torque = result.getInt("torque");
				int cc = result.getInt("cc");
				int price = result.getInt("price");
				String desc = result.getString("desc");
				int count = result.getInt("count");
				Blob blob = result.getBlob("image");

				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();

				products.setModel(model);
				products.setType(type);
				products.setTorque(torque);
				products.setCc(cc);
				products.setPrice(price);
				products.setDesc(desc);
				products.setCount(count);

				products.setBase64Image(base64Image);
			}

		} catch (SQLException | IOException ex) {
			ex.printStackTrace();
			throw ex;
		}

		return products;
	}

}
