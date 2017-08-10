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
    public partial class marksInfo : System.Web.UI.Page
    {

        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
        marksDAO marksDAO = new marksDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            stdNameLabel.Text = Request.QueryString["StudentName"];
            stdIdLabel.Text = Request.QueryString["StudentID"];
            stdEmailLabel.Text = Request.QueryString["StudentEmail"];
            stdDeptLabel.Text = Request.QueryString["StudentDept"];

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
                BindCourseTitle();
                //BindCourseNo();
                //BindCreditHour();
                loadDatafromMarksInfo();
            }
        }

        private void loadDatafromMarksInfo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from marksInfo where stdEmail='"+stdEmailLabel.Text+"'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        marksRepeater.DataSource = dt;
                        marksRepeater.DataBind();
                    }
                }
            }
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/index.aspx");
        }

        private void BindCourseTitle()
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select distinct courseTitle from courseInfo", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if(dt.Rows.Count != 0)
                {
                    DropDownListForCourseTitle.DataSource = dt;
                    DropDownListForCourseTitle.DataTextField = "courseTitle";
                    DropDownListForCourseTitle.DataValueField = "courseTitle";
                    DropDownListForCourseTitle.DataBind();
                    DropDownListForCourseTitle.Items.Insert(0, new ListItem("Select Course Title...", "0"));
                }
            }
        }
        /*private void BindCourseNo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select distinct courseNo from courseInfo", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    DropDownListForCourseNo.DataSource = dt;
                    DropDownListForCourseNo.DataTextField = "courseNo";
                    DropDownListForCourseNo.DataValueField = "courseNo";
                    DropDownListForCourseNo.DataBind();
                    DropDownListForCourseNo.Items.Insert(0, new ListItem("Select Course No...", "0"));
                }
            }
        }
        private void BindCreditHour()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select distinct creditHour from courseInfo", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    DropDownListForCreditHour.DataSource = dt;
                    DropDownListForCreditHour.DataTextField = "creditHour";
                    DropDownListForCreditHour.DataValueField = "creditHour";
                    DropDownListForCreditHour.DataBind();
                    DropDownListForCreditHour.Items.Insert(0, new ListItem("Select Credit Hour...", "0"));
                }
            }
        } */

        public void MessageBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language='javascript'>alert('" + msg + "')</script>");
        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            string stdName = stdNameLabel.Text;
            string stdId = stdIdLabel.Text;
            string email = stdEmailLabel.Text;
            string dept = stdDeptLabel.Text;
            string year = DropDownListForYear.Text;
            string semester = DropDownListForSemester.Text;
            string courseTitle = DropDownListForCourseTitle.SelectedItem.Value;
            string grade = DropDownListForGrade.SelectedItem.Value;
            int marks = Convert.ToInt32(marksTextBox.Text.Trim());

            marksDAO.createMarksInfo(new marksDTO(stdName, stdId, email, dept, year, semester, courseTitle,grade, marks));

            updateCourseNO();
            updateCredit();
            updateTeacher();

            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none";
            DropDownListForCourseTitle.ClearSelection();
            DropDownListForCourseTitle.Items.FindByValue("0").Selected = true;
            DropDownListForGrade.SelectedValue = "none";
            marksTextBox.Text = string.Empty;

            MessageBox("Successfully Data Recorded !!");
            loadDatafromMarksInfo();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField1.Value);
            marksDAO.deleteMarksInfo(id);

            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none";
            DropDownListForCourseTitle.ClearSelection();
            DropDownListForCourseTitle.Items.FindByValue("0").Selected = true;
            
            DropDownListForGrade.SelectedValue = "none";
            
            marksTextBox.Text = string.Empty;

            MessageBox("Successfully Data Deleted !!");
            loadDatafromMarksInfo();
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(HiddenField1.Value);
            
            string stdName = stdNameLabel.Text;
            string stdId = stdIdLabel.Text;
            string email = stdEmailLabel.Text;
            string dept = stdDeptLabel.Text;
            string year = DropDownListForYear.Text;
            string semester = DropDownListForSemester.Text;
            string courseTitle = DropDownListForCourseTitle.SelectedItem.Value;
            string grade = DropDownListForGrade.SelectedItem.Value;

            int marks = Convert.ToInt32(marksTextBox.Text.Trim());

            marksDAO.updateMarksInfo(new marksDTO(stdName, stdId, email, dept, year, semester, courseTitle,grade, marks), id);

            updateCourseNO();
            updateCredit();
            updateTeacher();

            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none";
            DropDownListForCourseTitle.ClearSelection();
            DropDownListForCourseTitle.Items.FindByValue("0").Selected = true;
           
            DropDownListForGrade.SelectedValue = "none";
            
            marksTextBox.Text = string.Empty;

            MessageBox("Successfully Data Updated !!");
            loadDatafromMarksInfo();
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none";
            DropDownListForCourseTitle.ClearSelection();
            DropDownListForCourseTitle.Items.FindByValue("0").Selected = true;
            
            DropDownListForGrade.SelectedValue = "none";
            
            marksTextBox.Text = string.Empty;
        }

        private void updateCourseNO()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set courseNo=(select courseNo from courseInfo where courseInfo.courseTitle=marksInfo.courseTitle)", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void updateCredit()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set creditHour=(select creditHour from courseInfo where courseInfo.courseTitle=marksInfo.courseTitle)", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void updateTeacher()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set teacher=(select courseTeacher from courseInfo where courseInfo.courseTitle=marksInfo.courseTitle)", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}