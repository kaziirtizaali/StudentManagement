<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="StudentManagement.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    
    <div>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.aspx"><span>
                            <img alt="Logo" src="Images/logo1.png" height="40" /></span>Student Management System</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="index.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="adminLogin.aspx">Admin Panel</a></li>
                            <li><a href="teacherLogin.aspx">Teacher's Panel</a></li>
                            <li><a href="studentLogin.aspx">Student's Corner</a></li>                       
                        </ul>
                    </div>
                </div>
            </div>  
    </div>
    
        <div class="pimg1">
            <div class="ptext">
                <span class="border">STUDENT MANAGEMENT SYSTEM
                </span>
            </div>
        </div>

        <section class="section section-dark">
            <h2>Admin Panel</h2>
            <p>
                Admin can manage students, add new courses and Manage student's marks.
            </p>
        </section>

        <div class="pimg2">
            <div class="ptext">
                <span class="border trans">
                </span>
            </div>
        </div>

        <section class="section section-dark">
            <h2>Teacher Panel</h2>
            <p>
                Teacher can be able to upload marks, upload different course materials.
            </p>
        </section>

        <div class="pimg3">
            <div class="ptext">
                <span class="border trans">
                </span>
            </div>
        </div>

        <section class="section section-dark">
            <h2>Student Panel</h2>
            <p>
                Student can view their marksheet and calculate CGPA. They can also download different course materials. 
            </p>
        </section>

        <div class="pimg1">
            <div class="ptext">
                <span class="border">STUDENT MANAGEMENT SYSTEM
                </span>
            </div>
        </div>
           

   

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
