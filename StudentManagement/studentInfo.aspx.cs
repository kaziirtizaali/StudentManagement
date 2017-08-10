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
    public partial class studentInfo : System.Web.UI.Page
    {
        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
        studentDAO studentDAO = new studentDAO();

        public void MessageBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language='javascript'>alert('" + msg + "')</script>");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["USERNAME"] != null)
            {
                //lblSuccess.Text="Login Successful, Welcome " + Session["USERNAME"].ToString() + "";
            }
            else
            {
                Response.Redirect("~/adminLogin.aspx");
            }
            if (!IsPostBack)
            {
                loadDatafromStudentInfo();
            }
            idTextBox.Attributes.Add("readonly", "readonly");
        }

        private void loadDatafromStudentInfo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("select * from studentData", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        studentRepeater.DataSource = dt;
                        studentRepeater.DataBind();
                    }
                }
            }
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["USERNAME"] = null;
            Response.Redirect("~/index.aspx");
        }

        protected void insertBtn_Click(object sender, EventArgs e)
        {
            string stdNAME = stdName.Text;
            string fatherNAME = fatherName.Text;
            string stdID = stdId.Text;
            string DOB = dateOfBirth.Text;
            string dept = DropDownListForDepartment.Text;
            string mail = email.Text;
            string cont = contact.Text;
            string add = address.Text;

            studentDAO.createStudentInfo(new studentDTO(stdNAME, fatherNAME, stdID, DOB, dept, mail, cont, add));

            idTextBox.Text = string.Empty;
            stdName.Text = string.Empty;
            fatherName.Text = string.Empty;
            stdId.Text = string.Empty;
            dateOfBirth.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            email.Text = string.Empty;
            contact.Text = string.Empty;
            address.Text = string.Empty;
            stdName.Text = string.Empty;

            MessageBox("Successfully Data Recorded !!");

            loadDatafromStudentInfo();
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(idTextBox.Text);
            string stdNAME = stdName.Text;
            string fatherNAME = fatherName.Text;
            string stdID = stdId.Text;
            string DOB = dateOfBirth.Text;
            string dept = DropDownListForDepartment.Text;
            string mail = email.Text;
            string cont = contact.Text;
            string add = address.Text;

            studentDAO.updateStudentInfo(new studentDTO(stdNAME, fatherNAME, stdID, DOB, dept, mail, cont, add), id);

            idTextBox.Text = string.Empty;
            stdName.Text = string.Empty;
            fatherName.Text = string.Empty;
            stdId.Text = string.Empty;
            dateOfBirth.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            email.Text = string.Empty;
            contact.Text = string.Empty;
            address.Text = string.Empty;
            stdName.Text = string.Empty;

            MessageBox("Successfully Data Updated !!");
            
            loadDatafromStudentInfo();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(idTextBox.Text);
            studentDAO.deleteStudentInfo(id);

            idTextBox.Text = string.Empty;
            stdName.Text = string.Empty;
            fatherName.Text = string.Empty;
            stdId.Text = string.Empty;
            dateOfBirth.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            email.Text = string.Empty;
            contact.Text = string.Empty;
            address.Text = string.Empty;
            stdName.Text = string.Empty;

            MessageBox("Successfully Deleted !!");
            
            loadDatafromStudentInfo();
        }

        protected void displayBtn_Click(object sender, EventArgs e)
        {
            loadDatafromStudentInfo();
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            idTextBox.Text = string.Empty;
            stdName.Text = string.Empty;
            fatherName.Text = string.Empty;
            stdId.Text = string.Empty;
            dateOfBirth.Text = string.Empty;
            DropDownListForDepartment.SelectedValue = "none";
            email.Text = string.Empty;
            contact.Text = string.Empty;
            address.Text = string.Empty;
            stdName.Text = string.Empty;
        }

        protected void calenderBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void marksBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/marksInfo.aspx?StudentName=" + Server.UrlEncode(stdName.Text) + "&StudentID=" + Server.UrlEncode(stdId.Text) + "&StudentEmail=" + Server.UrlEncode(email.Text) + "&StudentDept=" + Server.UrlEncode(DropDownListForDepartment.Text));
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(cs))
            {
                using(SqlCommand cmd = new SqlCommand("select * from studentData where (stdName like '%"+searchTextBox.Text+ "%') or (fatherName like '%" + searchTextBox.Text + "%') or (stdId like '%" + searchTextBox.Text + "%') or (department like '%" + searchTextBox.Text + "%') or (email like '%" + searchTextBox.Text + "%') or (address like '%" + searchTextBox.Text + "%')", con))
                {
                    using(SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        studentRepeater.DataSource = dt;
                        studentRepeater.DataBind();
                    }
                }
            }
        }

        protected void searchTextBox_TextChanged(object sender, EventArgs e)
        {
            if (searchTextBox.Text != null)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from studentData where (stdName like '%" + searchTextBox.Text + "%') or (fatherName like '%" + searchTextBox.Text + "%') or (stdId like '%" + searchTextBox.Text + "%') or (department like '%" + searchTextBox.Text + "%') or (email like '%" + searchTextBox.Text + "%') or (address like '%" + searchTextBox.Text + "%')", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            studentRepeater.DataSource = dt;
                            studentRepeater.DataBind();
                        }
                    }
                }
            }
        }
    }
}