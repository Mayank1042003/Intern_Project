using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load any necessary data if needed
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            // Getting the current date (without time) for ddate
            string currentDate = DateTime.Now.ToString("yyyy-MM-dd");

            string connString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // SQL query to insert data into Table_tax_regime, including ddate as a DATE type
                string query = "INSERT INTO Table_tax_regime (Pno, Name, Level, Created_On, ddate, Option) " +
                               "VALUES (@Pno, @Name, @Level, @CreatedOn, @ddate, @Option)";

                SqlCommand cmd = new SqlCommand(query, conn);

                // Adding parameters to avoid SQL injection
                cmd.Parameters.AddWithValue("@Pno", txtPno.Text);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Level", txtLevel.Text);

                // Created_On will include both the date and time
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);

                // ddate will store only the date without time
                cmd.Parameters.AddWithValue("@ddate", currentDate);

                // Option (like 'yes') from a dropdown list or any other input
                cmd.Parameters.AddWithValue("@Option", ddlSwitchOption.SelectedValue);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    // Redirect to a different page or show success message
                    Response.Redirect("~/Reportaspx.aspx");
                }
                catch (Exception ex)
                {
                    // Handle exception and display error message
                    lblMessage.Text = "Error: " + ex.Message; // Ensure lblMessage control is present on the form
                }
            }
        }
    }
}
