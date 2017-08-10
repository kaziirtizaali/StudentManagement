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
    public partial class allStudentMarksInfo : System.Web.UI.Page
    {
        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";


        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (Session["USERNAME"] != null)
            {
                //lblSuccess.Text = "Login Successful, Welcome " + Session["USERNAME"].ToString() + "";
            }
            else
            {
                Response.Redirect("~/adminLogin.aspx");
            }
            if (!IsPostBack)
            {
                //loadDatafromMarksInfo(DropDownListForCourseTitle.SelectedItem.Value);
                
            }
            
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/index.aspx");
        }

        private void BindCourseTitle(string year, string semester, string dept)
        {
            
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select distinct courseTitle from marksInfo where stdYear='" + year+"' and stdSemester='"+semester+"' and stdDepartment='"+dept+"'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    DropDownListForCourseTitle.DataSource = dt;
                    DropDownListForCourseTitle.DataTextField = "courseTitle";
                    DropDownListForCourseTitle.DataValueField = "courseTitle";
                    DropDownListForCourseTitle.DataBind();
                    DropDownListForCourseTitle.Items.Insert(0, new ListItem("Select Course Title...", "0"));
                }
                else
                {
                    DropDownListForCourseTitle.Items.Clear();
                    DropDownListForCourseTitle.Items.Add("Data Doesn't match");
                }
            }
        }

        private void loadDatafromMarksInfo(string course)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from marksInfo where courseTitle='"+course+"' ", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count != 0)
                        {
                            marksRepeater.DataSource = dt;
                            marksRepeater.DataBind();
                        }
                        
                    }
                }
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            int marks = Convert.ToInt32(marksTextBox.Text.Trim());
            string grade = DropDownListForGrade.SelectedItem.Value;
            int id = Convert.ToInt32(HiddenField1.Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set marks='"+marks+"', grade='"+grade+"' where id='"+id+"'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            marksTextBox.Text = string.Empty;
            DropDownListForGrade.SelectedValue = "none";
            loadDatafromMarksInfo(DropDownListForCourseTitle.SelectedItem.Value);
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField1.Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from marksInfo where id='" + id + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            loadDatafromMarksInfo(DropDownListForCourseTitle.SelectedItem.Value);

        }

        protected void DropDownListForSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCourseTitle(DropDownListForYear.SelectedItem.Text, DropDownListForSemester.SelectedItem.Text, DropDownListForDepartment.SelectedItem.Text);
        }

        protected void DropDownListForYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCourseTitle(DropDownListForYear.SelectedItem.Text, DropDownListForSemester.SelectedItem.Text, DropDownListForDepartment.SelectedItem.Text);
        }

        protected void DropDownListForDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCourseTitle(DropDownListForYear.SelectedItem.Text, DropDownListForSemester.SelectedItem.Text, DropDownListForDepartment.SelectedItem.Text);
        }

        protected void DropDownListForCourseTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDatafromMarksInfo(DropDownListForCourseTitle.SelectedItem.Value);
        }
    }
}