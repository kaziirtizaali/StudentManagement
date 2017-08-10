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
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                if (Request.Cookies["USERNAME"] != null && Request.Cookies["PASSWORD"] != null)
                {
                    UserName.Text = Request.Cookies["USERNAME"].Value;
                    Password.Attributes["value"] = Request.Cookies["PASSWORD"].Value;
                }
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("select * from Admin where Name='" + UserName.Text + "' and Password='" + Password.Text + "'", conn);
                conn.Open();
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlAdapter.Fill(dataTable);

                if(dataTable.Rows.Count != 0)
                {
                    if(CheckBox1.Checked)
                    {
                        Response.Cookies["USERNAME"].Value = UserName.Text;
                        Response.Cookies["PASSWORD"].Value = Password.Text;

                        Response.Cookies["USERNAME"].Expires = DateTime.Now.AddDays(14);
                        Response.Cookies["PASSWORD"].Expires = DateTime.Now.AddDays(14);       
                    }
                    else
                    {
                        Response.Cookies["USERNAME"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["PASSWORD"].Expires = DateTime.Now.AddDays(-1);
                    }

                    Session["USERNAME"] = UserName.Text;
                    Response.Redirect("~/studentInfo.aspx");
                }
                else
                {
                    lblError.Text = "Invalid username or password!!";
                }
            }
        }
    }


}