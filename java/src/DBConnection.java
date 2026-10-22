import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Opens a connection to the MySQL database that XAMPP runs on this computer.
 * Every *Table.java program uses this class, so the settings live in one place.
 *
 * Change these values if your MySQL user, password or port are different.
 */
public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/bus_ticket_counter_management_system";
    private static final String USERNAME = "root";   // XAMPP default user
    private static final String PASSWORD = "";       // XAMPP default password is empty

    public static Connection connect() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver not found. Add java/lib/mysql-connector-java-8.0.30.jar to the classpath.", e);
        }
        Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        System.out.println("Connected to Database");
        return conn;
    }
}
