import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/** Prints every row of the manager table. */
public class ManagerTable {

    public static void main(String[] args) {
        try (Connection conn = DBConnection.connect();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM manager")) {

            while (rs.next()) {
                System.out.println(
                        "manager_id: " + rs.getInt("manager_id")
                        + ", manager_name: " + rs.getString("manager_name")
                        + ", manager_phone: " + rs.getString("manager_phone")
                        + ", manager_salary: " + rs.getInt("manager_salary")
                        + ", manager_hire_date: " + rs.getDate("manager_hire_date"));
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
}
