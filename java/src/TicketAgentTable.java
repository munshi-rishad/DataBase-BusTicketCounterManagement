import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/** Prints every row of the ticket_agent table. */
public class TicketAgentTable {

    public static void main(String[] args) {
        try (Connection conn = DBConnection.connect();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM ticket_agent")) {

            while (rs.next()) {
                System.out.println(
                        "Agent_ID: " + rs.getInt("agent_id")
                        + ", Agent_Name: " + rs.getString("agent_name")
                        + ", Agent_Phone: " + rs.getString("agent_phone")
                        + ", Agent_Salary: " + rs.getInt("agent_salary")
                        + ", Ticket_Agent_Hire_Date: " + rs.getDate("ticket_agent_hire_date")
                        + ", Manager_ID: " + rs.getInt("manager_id"));
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
        }
    }
}
