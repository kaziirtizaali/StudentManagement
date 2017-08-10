using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagement
{
    public class studentDAO
    {
        private string cs = "Data Source=.\\sqlexpress;Initial Catalog=StudentManagement;Integrated Security=True;Pooling=False";

        public void createStudentInfo(studentDTO studentDto)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into studentData (stdName,fatherName,stdId,dateOfBirth,department,email,contact,address) values('"+studentDto.STUDENTNAME+"', '"+studentDto.FATHERNAME+"', '"+studentDto.STUDENTID+"', '"+studentDto.DATEOFBIRTH+"', '"+studentDto.DEPARTMENT+"', '"+studentDto.EMAIL+"', '"+studentDto.CONTACT+"', '"+studentDto.ADDRESS+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();                                         
            }
        }

        public void deleteStudentInfo(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("delete from studentData where id='"+id+"'", con);
                con.Open();
                cmd.ExecuteNonQuery();     
            }
        }

        public void updateStudentInfo(studentDTO studentDto, int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update studentData set stdName='"+studentDto.STUDENTNAME+"', fatherName='"+studentDto.FATHERNAME+"', stdId='"+studentDto.STUDENTID+"', dateOfBirth='"+studentDto.DATEOFBIRTH+"', department='"+studentDto.DEPARTMENT+"', email='"+studentDto.EMAIL+"', contact='"+studentDto.CONTACT+"', address='"+studentDto.ADDRESS+"' where id='"+id+"' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        } 

    }
}