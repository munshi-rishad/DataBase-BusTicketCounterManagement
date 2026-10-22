import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/** Prints every row of the customer_info table. */
public class CustomerInfoTable {

    public static void main(String[] args) {
        try (Connection conn = DBConnection.connect();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM customer_info")) {

            while (rs.next()) {
                System.out.println(
                        "CUSTOMER_ID: " + rs.getInt("customer_id")
                        + ", CUSTOMER_NAME: " + rs.getString("customer_name")
                        + ", CUSTOMER_ADDRESS: " + rs.getString("customer_address")
                        + ", CUSTOMER_AGE: " + rs.getInt("customer_age")
                        + ", CUSTOMER_PHONE: " + rs.getString("customer_phone")
                        + ", CATEGORY: " + rs.getString("category")
                        + ", PAYMENT_HISTORY: " + rs.getString("payment_history")
                        + ", TICKET_ID: " + rs.getInt("ticket_id"));
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
}
