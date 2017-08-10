using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace StudentManagement
{
    public partial class teacherLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                if (Request.Cookies["TEACHEREMAIL"] != null && Request.Cookies["TEACHERPASSWORD"] != null)
                {
                    emailTextBox.Text = Request.Cookies["TEACHEREMAIL"].Value;
                    passwordTextBox.Attributes["value"] = Request.Cookies["TEACHERPASSWORD"].Value;
                }
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("select * from teacherLogin where email='" + emailTextBox.Text + "' and password='" + passwordTextBox.Text + "'", conn);
                conn.Open();
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlAdapter.Fill(dataTable);

                if (dataTable.Rows.Count != 0)
                {
                    if (CheckBox1.Checked)
                    {
                        Response.Cookies["TEACHEREMAIL"].Value = emailTextBox.Text;
                        Response.Cookies["TEACHERPASSWORD"].Value = passwordTextBox.Text;

                        Response.Cookies["TEACHEREMAIL"].Expires = DateTime.Now.AddDays(14);
                        Response.Cookies["TEACHERPASSWORD"].Expires = DateTime.Now.AddDays(14);
                    }
                    else
                    {
                        Response.Cookies["TEACHEREMAIL"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["TEACHERPASSWORD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    Session["TEACHEREMAIL"] = emailTextBox.Text;
                    Response.Redirect("~/teacherPanel.aspx");
                }
                else
                {
                    lblError.Text = "Invalid email or password!!";
                }
            }
        }
    }
}