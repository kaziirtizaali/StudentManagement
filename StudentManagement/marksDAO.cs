using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagement
{
    public class marksDAO
    {
        private string cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";

        public void createMarksInfo(marksDTO marksDto)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into marksInfo (stdname,stdId,stdEmail,stdDepartment,stdYear,stdSemester,courseTitle,grade,marks) values('"+marksDto.STUDENTNAME+"', '"+marksDto.STUDENTID+"', '"+marksDto.STUDENTEMAIL+"', '"+marksDto.DEPARTMENT+"', '"+marksDto.YEAR+"', '"+marksDto.SEMESTER+"', '"+marksDto.COURSETITLE+"', '"+marksDto.GRADE+"', '"+marksDto.MARKS+"')", con);                                                                                
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void deleteMarksInfo(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from marksInfo where id='" + id + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        public void updateMarksInfo(marksDTO marksDto, int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update marksInfo set courseTitle='"+marksDto.COURSETITLE+"', stdYear='"+marksDto.YEAR+"', stdSemester='"+marksDto.SEMESTER+"', grade='"+marksDto.GRADE+"', marks='"+marksDto.MARKS+"' where id='" + id + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}