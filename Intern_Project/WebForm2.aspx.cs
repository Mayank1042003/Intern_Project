using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Retrieve values from the form
            string userId = txtUserId.Text;
            string username = txtUsername.Text;
            string email = txtEmail.Text;
            string contactNo = txtContactNo.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // Validate passwords
            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            // Insert data into the database
            
            string connString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO [Table_1signup] (User_id, Username, Email, Contact_No, Password, Confirm_password) VALUES (@User_id, @Username, @Email, @Contact_No, @Password, @Confirm_password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@User_id", userId);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Contact_No", contactNo);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Confirm_Password", confirmPassword);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Sign up successful!";
                    // Redirect to the login page
                    Response.Redirect("WebForm1.aspx");
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
