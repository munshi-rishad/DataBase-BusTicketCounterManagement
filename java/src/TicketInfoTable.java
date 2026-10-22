import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/** Prints every row of the ticket_info table. */
public class TicketInfoTable {

    public static void main(String[] args) {
        try (Connection conn = DBConnection.connect();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM ticket_info")) {

            while (rs.next()) {
                System.out.println("Ticket ID     : " + rs.getInt("ticket_id"));
                System.out.println("Amount        : " + rs.getInt("amount"));
                System.out.println("Price         : " + rs.getInt("price"));
                System.out.println("Travel Date   : " + rs.getDate("travel_date"));
                System.out.println("Pickup Point  : " + rs.getString("pickup_point"));
                System.out.println("Dropoff Point : " + rs.getString("dropoff_point"));
                System.out.println("Agent ID      : " + rs.getInt("agent_id"));
                System.out.println();
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
}
