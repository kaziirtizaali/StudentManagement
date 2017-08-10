<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentInfo.aspx.cs" Inherits="StudentManagement.studentInfo" %>

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
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container-fluid">
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
                                    <li class="active"><a href="#">Add Student Info</a></li>
                                    <li><a href="courseInfo.aspx">Add New Courses</a></li>
                                    <li><a href="allStudentMarksInfo.aspx">View All Student's Marks</a></li>
                                </ul>
                            </li>
                            <li class="active">
                                <asp:Button ID="signOutbtn" runat="server" class="btn btn-default navbar-btn" Text="Sign Out" OnClick="signOutbtn_Click"/>
                            </li>                       
                        </ul>
                        <div class="navbar-form navbar-right">
                            <div class="form-group">
                                <asp:TextBox ID="searchTextBox" runat="server" CssClass="form-control" placeholder="search anything" OnTextChanged="searchTextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                            </div>
                            <asp:Button ID="searchButton" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="searchButton_Click" UseSubmitBehavior="false"/>
                        </div>
                    </div>
                </div>
            </nav>
    
    </div>
        <!-- Student Info Start -->
        <div class="container">
            <div class="form-horizontal">
                <h2>Student Info</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="No."></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="idTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="stdName" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Student Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="stdName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="stdName" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Father's Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="fatherName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFatherName" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="fatherName" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Student ID"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="stdId" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldStdId" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="stdId" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Date of Birth"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="dateOfBirth" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                        
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
                    <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Student's Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="email" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Student's Contact"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="contact" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="contact" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Student's Address"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="address" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="The TextField field is Required !" ControlToValidate="address" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="btn btn-success" ValidationGroup="valGroup1" OnClick="insertBtn_Click"/>
                        <asp:Button ID="updateButton" runat="server" Text="Update" CssClass="btn btn-primary" ValidationGroup="valGroup1" OnClick="updateBtn_Click"/>
                        <asp:Button ID="deleteButton" runat="server" Text="Delete" CssClass="btn btn-warning" ValidationGroup="valGroup1" OnClick="deleteBtn_Click"/>
                        <asp:Button ID="displayButton" runat="server" Text="Display" CssClass="btn btn-info" OnClick="displayBtn_Click"/>
                        <asp:Button ID="clearButton" runat="server" Text="Clear" CssClass="btn btn-primary" ValidationGroup="valGroup1" OnClick="clearBtn_Click"/>
                        <asp:Button ID="marksButton" runat="server" Text="Edit Marksheet" CssClass="btn btn-primary" ValidationGroup="valGroup1" OnClick="marksBtn_Click"/>
                    </div>
                </div>
                
            </div>
        </div>

        <!-- Student Info End -->

        <!-- Student Table Start -->
        <hr />
        <div class="container">

            <div class="panel panel-default">
            <div class="panel-heading">Student Information</div>

            <asp:Repeater ID="studentRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover" id="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Student Name</th>
                        <th>Father Name</th>
                        <th>Student ID</th>
                        <th>Date of Birth</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Address</th>
                    </tr>
                </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("stdName") %></td>
                        <td><%# Eval("fatherName") %></td>
                        <td><%# Eval("stdId") %></td>
                        <td><%# Eval("dateOfBirth") %></td>
                        <td><%# Eval("department") %></td>
                        <td><%# Eval("email") %></td>
                        <td><%# Eval("contact") %></td>
                        <td><%# Eval("address") %></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>

                </FooterTemplate>
            </asp:Repeater>
    
        </div>
        </div>

        <!-- Student Table End -->

        

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
                document.getElementById("stdName").value = this.cells[1].innerHTML;
                document.getElementById("fatherName").value = this.cells[2].innerHTML;
                document.getElementById("stdId").value = this.cells[3].innerHTML;
                document.getElementById("dateOfBirth").value = this.cells[4].innerHTML;
                document.getElementById("DropDownListForDepartment").value = this.cells[5].innerHTML;
                document.getElementById("email").value = this.cells[6].innerHTML;
                document.getElementById("contact").value = this.cells[7].innerHTML;
                document.getElementById("address").value = this.cells[8].innerHTML;
            }
        }
    </script>

</body>
</html>
