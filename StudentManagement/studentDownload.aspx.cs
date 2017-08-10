using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace StudentManagement
{
    public partial class studentDownload : System.Web.UI.Page
    {
        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["STUDENTEMAIL"] != null)
            {
                //lblSuccess.Text = "Login Successful, Welcome " + Session["STUDENTEMAIL"].ToString() + "";
            }
            else
            {
                Response.Redirect("~/studentLogin.aspx");
            }
        }

        private void getDocuments()
        {
            string year = DropDownListForYear.Text;
            string semester = DropDownListForSemester.Text;

            /*DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Documents where Year='"+year+"' and Semester='"+semester+"' and Department='"+ Session["STUDENTDEPT"].ToString() + "'", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }
            if(dt.Rows.Count > 0)
            {
                downloadRepeater.DataSource = dt;
                downloadRepeater.DataBind();
            }
            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none"; */
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Documents where Year='" + year + "' and Semester='" + semester + "' and Department='" + Session["STUDENTDEPT"].ToString() + "'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        downloadRepeater.DataSource = dt;
                        downloadRepeater.DataBind();
                    }
                }
            }
            //DropDownListForYear.SelectedValue = "none";
            //DropDownListForSemester.SelectedValue = "none";
        }

        private void downloadDocuments(int id)
        {
            DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from Documents where id=@ID", con);
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
            }

            string name = dt.Rows[0]["Name"].ToString();
            byte[] documentBytes = (byte[])dt.Rows[0]["DocumentContent"];

            Response.ClearContent();
            Response.ContentType = "application/octetstream";
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", name));
            Response.AddHeader("Content-Length", documentBytes.Length.ToString());

            Response.BinaryWrite(documentBytes);
            Response.Flush();
            Response.Close();

        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["STUDENTEMAIL"] = null;
            Response.Redirect("~/studentLogin.aspx");
            
        }

        protected void displayButton_Click(object sender, EventArgs e)
        {
            getDocuments();
        }

        protected void downloadLinkButton_Click(object sender, EventArgs e)
        {

        }

        protected void downloadRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "something")
            {
                RepeaterItem rItem = (RepeaterItem)((LinkButton)e.CommandSource).NamingContainer;
                Label lbl = (Label)(rItem.FindControl("myLabel"));
                string s1 = lbl.Text;
                //Label2.Text = lbl.Text;
                int id = Convert.ToInt32(s1);
                downloadDocuments(id);
            }
        }
    }
}