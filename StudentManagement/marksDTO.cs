using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentManagement
{
    public class marksDTO
    {
        private int marks;
        private string stdName, stdId, stdEmail, stdDepartment, stdYear, stdSemester, courseTitle, courseNo, creditHour, grade, teacher;

        public marksDTO(string stdName, string stdId, string stdEmail, string stdDepartment, string stdYear, string stdSemester, string courseTitle, string grade, int marks)
        {
            this.stdName = stdName;
            this.stdId = stdId;
            this.stdEmail = stdEmail;
            this.stdDepartment = stdDepartment;
            this.stdYear = stdYear;
            this.stdSemester = stdSemester;
            this.courseTitle = courseTitle;
            
            this.grade = grade;
            
            this.marks = marks;
        }
        public string STUDENTNAME
        {
            get { return stdName; }
            set { stdName = value; }
        }
        public string STUDENTID
        {
            get { return stdId; }
            set { stdId = value; }
        }
        public string DEPARTMENT
        {
            get { return stdDepartment; }
            set { stdDepartment = value; }
        }
        public string STUDENTEMAIL
        {
            get { return stdEmail; }
            set { stdEmail = value; }
        }
        public string YEAR
        {
            get { return stdYear; }
            set { stdYear = value; }
        }
        public string SEMESTER
        {
            get { return stdSemester; }
            set { stdSemester = value; }
        }
        public string COURSETITLE
        {
            get { return courseTitle; }
            set { courseTitle = value; }
        }
        
        public string GRADE
        {
            get { return grade; }
            set { grade = value; }
        }
        
        public int MARKS
        {
            get { return marks; }
            set { marks = value; }
        }
    }
}