using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagement
{
    public class courseDAO
    {
        private string cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";

        public void createCourseInfo(courseDTO courseDto)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into courseInfo (courseTitle, courseNo, creditHour, department, courseTeacher, teacherEmail) values('"+courseDto.COURSETITLE+"', '"+courseDto.COURSENO+"', '"+courseDto.CREDITHOUR+"', '"+courseDto.DEPARTMENT+"', '"+courseDto.TEACHER+"', '"+courseDto.TEACHEREMAIL+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }

        public void deleteCourseInfo(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from courseInfo where id='" + id + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();

            }
        }

        public void updateCourseInfo(courseDTO courseDto, int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update courseInfo set courseTitle='" + courseDto.COURSETITLE + "', courseNo='" + courseDto.COURSENO + "', creditHour='" + courseDto.CREDITHOUR + "', department='" + courseDto.DEPARTMENT + "', courseTeacher='" + courseDto.TEACHER + "', teacherEmail='" + courseDto.TEACHEREMAIL + "' where id='" + id + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}