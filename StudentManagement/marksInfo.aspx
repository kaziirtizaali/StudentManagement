<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="marksInfo.aspx.cs" Inherits="StudentManagement.marksInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marks Infromation</title>
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
                                    <li><a href="courseInfo.aspx">Add New Courses</a></li>
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

        <!-- Some student details start -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Student Info For</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Student Name:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="stdNameLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Student ID:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="stdIdLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Student's Email:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="stdEmailLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Department:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="stdDeptLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- some student details end -->

        <!-- Marks Info Start -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Subject Info</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Year"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForYear" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Year" Value="none"></asp:ListItem>
                            <asp:ListItem Text="1st" Value="1st"></asp:ListItem>
                            <asp:ListItem Text="2nd" Value="2nd"></asp:ListItem>
                            <asp:ListItem Text="3rd" Value="3rd"></asp:ListItem>
                            <asp:ListItem Text="4th" Value="4th"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForYear" InitialValue="none" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Semester"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForSemester" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Semester" Value="none"></asp:ListItem>
                            <asp:ListItem Text="1st" Value="1st"></asp:ListItem>
                            <asp:ListItem Text="2nd" Value="2nd"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForSemester" InitialValue="none" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Course Title"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForCourseTitle" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForCourseTitle" InitialValue="0" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" CssClass="col-md-2 control-label" Text="Total Marks"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="marksTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="marksTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Grade"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForGrade" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Grade" Value="none"></asp:ListItem>
                            <asp:ListItem Text="A+" Value="A+"></asp:ListItem>
                            <asp:ListItem Text="A" Value="A"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="A-"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="B+"></asp:ListItem>
                            <asp:ListItem Text="B" Value="B"></asp:ListItem>
                            <asp:ListItem Text="B-" Value="B-"></asp:ListItem>
                            <asp:ListItem Text="C+" Value="C+"></asp:ListItem>
                            <asp:ListItem Text="C" Value="C"></asp:ListItem>
                            <asp:ListItem Text="C-" Value="C-"></asp:ListItem>
                            <asp:ListItem Text="D" Value="D"></asp:ListItem>
                            <asp:ListItem Text="F" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForGrade" InitialValue="none" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                    <div class="col-md-3">
                        <asp:HiddenField ID="HiddenField1" runat="server"/>
                    </div>
                </div>
                
                
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="valGroup1" OnClick="createBtn_Click"/>
                        <asp:Button ID="updateButton" runat="server" Text="Update" CssClass="btn btn-primary" ValidationGroup="valGroup1" OnClick="updateBtn_Click"/>
                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CssClass="btn btn-warning" ValidationGroup="valGroup1" OnClick="deleteBtn_Click"/>
                        <asp:Button ID="clearButton" runat="server" Text="Clear" CssClass="btn btn-primary" OnClick="clearBtn_Click"/>
                    </div>
                </div>
         
            </div>
        </div>

        <!-- Marks Info End -->

        <!-- Marks Table Start -->
        <hr />
        <div class="container">

            <div class="panel panel-default">
            <div class="panel-heading">Course-wise Marks Information</div>

            <asp:Repeater ID="marksRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover" id="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Course Title</th>
                        <th>Course No.</th>
                        <th>Credit Hour</th>
                        <th>Year</th>
                        <th>Semeter</th>
                        <th>Course Teacher</th>
                        <th>Total Marks</th>
                        <th>Grade</th>
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
                        <td><%# Eval("stdYear") %></td>
                        <td><%# Eval("stdSemester") %></td>
                        <td><%# Eval("teacher") %></td>
                        <td><%# Eval("marks") %></td>
                        <td><%# Eval("grade") %></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>

                </FooterTemplate>
            </asp:Repeater>
    
        </div>
        </div>

        <!-- Marks Table End -->

    </form>

    <script type="text/javascript">
        var table = document.getElementById('table'), rIndex;
        for (var i = 0; i < table.rows.length; i++) {
            table.rows[i].onclick = function () {
                rIndex = this.rowIndex;
                document.getElementById("HiddenField1").value = this.cells[0].innerHTML;
                document.getElementById("DropDownListForYear").value = this.cells[4].innerHTML;
                document.getElementById("DropDownListForSemester").value = this.cells[5].innerHTML;
                document.getElementById("DropDownListForCourseTitle").value = this.cells[1].innerHTML;
                
                
                document.getElementById("marksTextBox").value = this.cells[7].innerHTML;
                document.getElementById("DropDownListForGrade").value = this.cells[8].innerHTML;                
            }
        }
    </script>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
