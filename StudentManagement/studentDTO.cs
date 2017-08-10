using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentManagement
{
    public class studentDTO
    {
        private string stdName, fatherName, stdID, dateOfBirth, department, email, contact, address;

        public studentDTO(string stdName, string fatherName, string stdID, string dateOfBirth, string department, string email, string contact, string address)
        {
            this.stdName = stdName;
            this.fatherName = fatherName;
            this.stdID = stdID;
            this.dateOfBirth = dateOfBirth;
            this.department = department;
            this.email = email;
            this.contact = contact;
            this.address = address;
        }

        public string STUDENTNAME
        {
            get { return stdName; }
            set { stdName = value; }
        }

        public string FATHERNAME
        {
            get { return fatherName; }
            set { fatherName = value; }
        }

        public string STUDENTID
        {
            get { return stdID; }
            set { stdID = value; }
        }

        public string DATEOFBIRTH
        {
            get { return dateOfBirth; }
            set { dateOfBirth = value; }
        }

        public string DEPARTMENT
        {
            get { return department; }
            set { department = value; }
        }

        public string EMAIL
        {
            get { return email; }
            set { email = value; }
        }

        public string CONTACT
        {
            get { return contact; }
            set { contact = value; }
        }

        public string ADDRESS
        {
            get { return address; }
            set { address = value; }
        }
    }
}