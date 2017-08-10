using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Data.SqlTypes;

namespace StudentManagement
{
    public partial class teacherPanel : System.Web.UI.Page
    {
        OleDbConnection Econ;
        SqlConnection con;
        string constr, Query, sqlconn;
        String cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TEACHEREMAIL"] != null)
            {
                //lblSuccess.Text = "Login Successful, Welcome " + Session["TEACHEREMAIL"].ToString() + "";
            }
            else
            {
                Response.Redirect("~/teacherLogin.aspx");
            }
            if (!IsPostBack)
            {
                BindTeacherInfo();
                BindCourseTitle();
            }
        }

        private void BindCourseTitle()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select distinct courseTitle from marksInfo where teacherEmail='" + Session["TEACHEREMAIL"].ToString() + "'", con);
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
            }
        }

        protected void signOutbtn_Click(object sender, EventArgs e)
        {
            Session["TEACHEREMAIL"] = null;
            Response.Redirect("~/teacherLogin.aspx");
        }
        public void MessageBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language='javascript'>alert('" + msg + "')</script>");
        }

        private void BindTeacherInfo()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("select * from courseInfo where teacherEmail='" + Session["TEACHEREMAIL"].ToString() + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    teacherNameLabel.Text = dt.Rows[0]["courseTeacher"].ToString();
                    teacherEmailLabel.Text = Session["TEACHEREMAIL"].ToString();
                    teacherDeptLabel.Text = dt.Rows[0]["department"].ToString();
                }
            }
        }
        private void connection()
        {
            sqlconn = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";
            con = new SqlConnection(sqlconn);
        }

        private void ExcelConn(string FilePath)
        {

            constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", FilePath);
            Econ = new OleDbConnection(constr);

        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            uploadFile();
            DropDownListForYear.SelectedValue = "none";
            DropDownListForSemester.SelectedValue = "none";
            DropDownListForCourseTitle.ClearSelection();
            DropDownListForCourseTitle.Items.FindByValue("0").Selected = true;
            
        }

        private void InsertExcelRecords(string FilePath)
        {
            ExcelConn(FilePath);

            Query = string.Format("SELECT [stdName],[stdId],[stdEmail],[stdDepartment],[stdYear],[stdSemester],[courseTitle],[courseNo],[creditHour],[marks],[grade],[teacherEmail] FROM ["+sheetTextBox.Text+"$]");
        
            OleDbCommand Ecom = new OleDbCommand(Query, Econ);
            Econ.Open();

            DataSet ds = new DataSet();
            OleDbDataAdapter oda = new OleDbDataAdapter(Query, Econ);
            Econ.Close();
            oda.Fill(ds);
            DataTable Exceldt = ds.Tables[0];
            connection();
            //creating object of SqlBulkCopy    
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            //assigning Destination table name    
            objbulk.DestinationTableName = "marksInfo";
            //Mapping Table column    
            objbulk.ColumnMappings.Add("stdName", "stdname");
            objbulk.ColumnMappings.Add("stdId", "stdId");
            objbulk.ColumnMappings.Add("stdEmail", "stdEmail");
            objbulk.ColumnMappings.Add("stdDepartment", "stdDepartment");
            objbulk.ColumnMappings.Add("stdYear", "stdYear");
            objbulk.ColumnMappings.Add("stdSemester", "stdSemester");
            objbulk.ColumnMappings.Add("courseTitle", "courseTitle");
            objbulk.ColumnMappings.Add("courseNo", "courseNo");
            objbulk.ColumnMappings.Add("creditHour", "creditHour");
            objbulk.ColumnMappings.Add("marks", "marks");
            objbulk.ColumnMappings.Add("grade", "grade");
            objbulk.ColumnMappings.Add("teacherEmail", "teacherEmail");

            //inserting Datatable Records to DataBase    
            con.Open();
            objbulk.WriteToServer(Exceldt);
            con.Close();

        }

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string CurrentFilePath = Path.GetFullPath(FileUpload1.PostedFile.FileName);
            InsertExcelRecords(CurrentFilePath); 
            updatePoints();
            sheetTextBox.Text = string.Empty;
        }

        private void uploadFile()
        {
            FileInfo fi = new FileInfo(FileUpload2.FileName);
            byte[] documentContent = FileUpload2.FileBytes;

            string name = fi.Name;
            string extn = fi.Extension;

            string year = DropDownListForYear.Text;
            string semester = DropDownListForSemester.Text;
            string courseTitle = DropDownListForCourseTitle.SelectedItem.Value;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into Documents (Department,Year,Semester,TeacherEmail,Name,DocumentContent,Extension,courseTitle) values('" + teacherDeptLabel.Text + "', '"+year+"', '"+semester+"', '"+ Session["TEACHEREMAIL"].ToString() + "', '"+name+"', @byteValue, '"+GetFileTypeByExtension(fi.Extension)+"', '"+courseTitle+"')", con);
                cmd.Parameters.Add("@byteValue", SqlDbType.VarBinary, -1).Value = documentContent;
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private string GetFileTypeByExtension(string fileExtension)
        {
            switch (fileExtension.ToLower())
            {
                case ".docx":
                case ".doc":
                    return "Microsoft Word Document";
                case ".xlsx":
                case ".xls":
                    return "Microsoft Excel Document";
                case ".txt":
                    return "Text Document";
                case ".ppt":
                case ".pptx":
                    return "PowerPoint Document";
                case ".pdf":
                    return "PDF Document";
                case ".jpg":
                case ".png":
                    return "Image";
                default:
                    return "Unknown";
            }
        }

        private void updatePoints()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set points=(select points from pointsTable where marksInfo.grade=pointsTable.grade)", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}