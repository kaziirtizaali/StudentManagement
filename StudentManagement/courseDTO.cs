using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentManagement
{
    public class courseDTO
    {
        private string courseTitle, courseNo, creditHour, department, teacher, teacherEmail;

        public courseDTO(string courseTitle, string courseNo, string creditHour, string department, string teacher, string teacherEmail)
        {
            this.courseTitle = courseTitle;
            this.courseNo = courseNo;
            this.creditHour = creditHour;
            this.department = department;
            this.teacher = teacher;
            this.teacherEmail = teacherEmail;
        }

        public string COURSETITLE
        {
            get { return courseTitle; }
            set { courseTitle = value; }
        }

        public string COURSENO
        {
            get { return courseNo; }
            set { courseNo = value; }
        }

        public string CREDITHOUR
        {
            get { return creditHour; }
            set { creditHour = value; }
        }

        public string DEPARTMENT
        {
            get { return department; }
            set { department = value; }
        }

        public string TEACHER
        {
            get { return teacher; }
            set { teacher = value; }
        }

        public string TEACHEREMAIL
        {
            get { return teacherEmail; }
            set { teacherEmail = value; }
        }
    }
}