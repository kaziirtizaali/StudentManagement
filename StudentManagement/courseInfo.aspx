<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="courseInfo.aspx.cs" Inherits="StudentManagement.courseInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Courses</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Main.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
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
                            <li><a href="index.aspx">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin Panel<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="studentInfo.aspx">Add Student Info</a></li>
                                    <li class="active"><a href="#">Add New Courses</a></li>
                                    <li><a href="allStudentMarksInfo.aspx">View All Student's Marks</a></li>
                                </ul>
                            </li>
                            <li class="active">
                                <asp:Button ID="signOutbtn" runat="server" class="btn btn-default navbar-btn" Text="Sign Out" OnClick="signOutbtn_Click"/>
                            </li>                       
                        </ul>
                    </div>
                </div>
            </div>
    
    </div>

        <!-- Course Info Start -->
        <div class="container">
            <div class="form-horizontal">
                <h2>Add Course</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="#"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="idTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Course Title"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="courseTitleTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="courseTitleTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Course No."></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="courseNoTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="courseNoTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Credit Hour"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="creditHourTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFatherName" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="creditHourTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Department"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForDepartment" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Department" Value="none"></asp:ListItem>
                            <asp:ListItem Text="CSE" Value="CSE"></asp:ListItem>
                            <asp:ListItem Text="EEE" Value="EEE"></asp:ListItem>
                            <asp:ListItem Text="Civil" Value="Civil"></asp:ListItem>
                            <asp:ListItem Text="Textile" Value="Textile"></asp:ListItem>
                            <asp:ListItem Text="ME" Value="ME"></asp:ListItem>
                            <asp:ListItem Text="Architecture" Value="Architecture"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Please Select a department!!" ControlToValidate="DropDownListForDepartment" InitialValue="none" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Course Teacher"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="teacherTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="teacherTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Teacher's Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="teacherEmailTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="teacherEmailTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="addButton" runat="server" Text="Add Course" CssClass="btn btn-success" ValidationGroup="valGroup1" OnClick="addBtn_Click"/>
                        <asp:Button ID="updateButton" runat="server" Text="Update Data" CssClass="btn btn-primary" OnClick="updateButton_Click"/>
                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CssClass="btn btn-warning" ValidationGroup="valGroup1" OnClick="deleteBtn_Click"/>
                        <asp:Button ID="clearButton" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="clearBtn_Click"/>
                    </div>
                </div>
                
            </div>
        </div>

        <!-- Course Info End -->

        <!-- Course Table Start -->
        <hr />
        <div class="container">

            <div class="panel panel-default">
            <div class="panel-heading">Course Information</div>

            <asp:Repeater ID="courseRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover" id="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Course Title</th>
                        <th>Course No.</th>
                        <th>Credit Hour</th>
                        <th>Department</th>
                        <th>Course Teacher</th>
                        <th>Teacher's Email</th>
                    </tr>
                </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("courseTitle") %></td>
                        <td><%# Eval("courseNo") %></td>
                        <td><%# Eval("creditHour") %></td>
                        <td><%# Eval("department") %></td>
                        <td><%# Eval("courseTeacher") %></td>
                        <td><%# Eval("teacherEmail") %></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>

                </FooterTemplate>
            </asp:Repeater>
    
        </div>
        </div>

        <!-- Course Table End -->
    </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var table = document.getElementById('table'), rIndex;
        for (var i = 0; i < table.rows.length; i++) {
            table.rows[i].onclick = function () {
                rIndex = this.rowIndex;
                document.getElementById("idTextBox").value = this.cells[0].innerHTML;
                document.getElementById("courseTitleTextBox").value = this.cells[1].innerHTML;
                document.getElementById("courseNoTextBox").value = this.cells[2].innerHTML;
                document.getElementById("creditHourTextBox").value = this.cells[3].innerHTML;
                document.getElementById("DropDownListForDepartment").value = this.cells[4].innerHTML;
                document.getElementById("teacherTextBox").value = this.cells[5].innerHTML;
                document.getElementById("teacherEmailTextBox").value = this.cells[6].innerHTML;
            }
        }
    </script>

</body>
</html>
