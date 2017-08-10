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
    public partial class courseInfo : System.Web.UI.Page
    {
        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
        courseDAO courseDAO = new courseDAO();

        public void MessageBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language='javascript'>alert('" + msg + "')</script>");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                loadDatafromCourseInfo();
            }

            if (Session["USERNAME"] != null)
            {
                //lblSuccess.Text="Login Successful, Welcome " + Session["USERNAME"].ToString() + "";
            }
            else
            {
                Response.Redirect("~/adminLogin.aspx");
            }

            idTextBox.Attributes.Add("readonly", "readonly");

        }

        private void loadDatafromCourseInfo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from courseInfo", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        courseRepeater.DataSource = dt;
                        courseRepeater.DataBind();
                    }
                }
            }
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            string title = courseTitleTextBox.Text.Trim();
            string courseNo = courseNoTextBox.Text.Trim();
            string credit = creditHourTextBox.Text.Trim();
            string dept = DropDownListForDepartment.Text;
            string teacher = teacherTextBox.Text.Trim();
            string teacherEmail = teacherEmailTextBox.Text.Trim();

            courseDAO.createCourseInfo(new courseDTO(title, courseNo, credit, dept, teacher, teacherEmail));

            idTextBox.Text = string.Empty;
            courseTitleTextBox.Text = string.Empty;
            courseNoTextBox.Text = string.Empty;
            creditHourTextBox.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            teacherTextBox.Text = string.Empty;
            teacherEmailTextBox.Text = string.Empty;

            MessageBox("Successfully Data Recorded !!");

            loadDatafromCourseInfo();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(idTextBox.Text);
            courseDAO.deleteCourseInfo(id);

            idTextBox.Text = string.Empty;
            courseTitleTextBox.Text = string.Empty;
            courseNoTextBox.Text = string.Empty;
            creditHourTextBox.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";

            MessageBox("Successfully Data Deleted !!");

            loadDatafromCourseInfo();
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            idTextBox.Text = string.Empty;
            courseTitleTextBox.Text = string.Empty;
            courseNoTextBox.Text = string.Empty;
            creditHourTextBox.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            string title = courseTitleTextBox.Text.Trim();
            string courseNo = courseNoTextBox.Text.Trim();
            string credit = creditHourTextBox.Text.Trim();
            string dept = DropDownListForDepartment.Text;
            string teacher = teacherTextBox.Text.Trim();
            string teacherEmail = teacherEmailTextBox.Text.Trim();
            int id = Convert.ToInt32(idTextBox.Text);

            courseDAO.updateCourseInfo(new courseDTO(title, courseNo, credit, dept, teacher, teacherEmail), id);

            idTextBox.Text = string.Empty;
            courseTitleTextBox.Text = string.Empty;
            courseNoTextBox.Text = string.Empty;
            creditHourTextBox.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            teacherTextBox.Text = string.Empty;
            teacherEmailTextBox.Text = string.Empty;

            MessageBox("Successfully Data Updated !!");

            loadDatafromCourseInfo();
        }
    }
}