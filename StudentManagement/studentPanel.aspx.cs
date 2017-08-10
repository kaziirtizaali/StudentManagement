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
    public partial class studentPanel : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                BindStudentInfo();
            }
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["STUDENTEMAIL"] = null;
            Response.Redirect("~/studentLogin.aspx");
        }

        private void BindStudentInfo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from studentData where email='"+ Session["STUDENTEMAIL"].ToString() + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    stdNameLabel.Text = dt.Rows[0]["stdName"].ToString();
                    stdIdLabel.Text = dt.Rows[0]["stdId"].ToString();
                    stdEmailLabel.Text = dt.Rows[0]["email"].ToString();
                    stdDeptLabel.Text = dt.Rows[0]["department"].ToString();
                    Session["STUDENTDEPT"] = stdDeptLabel.Text;
                }
            }
        }

        private void loadMarksFromMarksInfo()
        {
            string year = DropDownListForYear.Text;
            string semester = DropDownListForSemester.Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from marksInfo where stdEmail='" + Session["STUDENTEMAIL"].ToString() + "' and stdYear='"+year+"' and stdSemester='"+semester+"'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0) {
                            marksDisplayRepeater.DataSource = dt;
                            marksDisplayRepeater.DataBind();
                        }
                        else
                        {
                            marksDisplayRepeater.DataSource = null;
                            marksDisplayRepeater.DataBind();
                        }
                    }
                }
            }
        }

        protected void displayBtn_Click(object sender, EventArgs e)
        {
            loadMarksFromMarksInfo();
            cgpaLabel.Text = string.Empty;
        }

        protected void cgpaButton_Click(object sender, EventArgs e)
        {
            calculateCGPA(stdNameLabel.Text, stdEmailLabel.Text, DropDownListForYear.Text, DropDownListForSemester.Text);
        }

        private void calculateCGPA(string name, string email, string year, string semester)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select cast((SUM(creditHour*points))/(SUM(creditHour)) as decimal(10,2)) as cgpa from marksInfo where stdname='"+name+"' and stdEmail='"+email+"' and stdYear='"+year+"' and stdSemester='"+semester+"'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    cgpaLabel.Text = "Your CGPA is " + dt.Rows[0]["cgpa"].ToString() + "";
                }
                else
                {
                    cgpaLabel.Text = string.Empty;
                }
            }
        }
    }
}