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
            // Clear previous validation errors
            ClearValidationStyles();

            // Retrieve values from the form
            string pno = txtPno.Text.Trim();
            string name = txtName.Text.Trim();
            string level = txtLevel.Text.Trim();
            string switchOption = ddlSwitchOption.SelectedValue;

            // Validate inputs
            bool isValid = true;

            // Validate Pno
            if (string.IsNullOrEmpty(pno) || !int.TryParse(pno, out _))
            {
                isValid = false;
                txtPno.CssClass += " error-field";  // Add 'error-field' class to highlight
            }

            // Validate Name
            if (string.IsNullOrEmpty(name))
            {
                isValid = false;
                txtName.CssClass += " error-field";
            }

            // Validate Level
            if (string.IsNullOrEmpty(level))
            {
                isValid = false;
                txtLevel.CssClass += " error-field";
            }

            // Validate checkbox
            if (!chkReadDocs.Checked)
            {
                isValid = false;
                lblMessage.Text = "You must read the enclosed documents.";
            }

            // If the form is invalid, show the error message
            if (!isValid)
            {
                lblMessage.Text = "Please correct the highlighted fields.";
                return;
            }

            // If validation passes, insert data into the database
            string connString = ConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Table_tax_regime (Pno, Name, Level, Created_On, Option) VALUES (@Pno, @Name, @Level, @Created_On, @Option)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Pno", pno);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Level", level);
                cmd.Parameters.AddWithValue("@Created_On", DateTime.Now);  // Automatically insert current date
                cmd.Parameters.AddWithValue("@Option", switchOption);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Form submitted successfully!";
                    // Redirect to another page if necessary
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        private void ClearValidationStyles()
        {
            // Remove error class from all fields
            txtPno.CssClass = txtPno.CssClass.Replace(" error-field", "");
            txtName.CssClass = txtName.CssClass.Replace(" error-field", "");
            txtLevel.CssClass = txtLevel.CssClass.Replace(" error-field", "");
        }
    }
}
