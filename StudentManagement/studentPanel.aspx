<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentPanel.aspx.cs" Inherits="StudentManagement.studentPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Panel</title>
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
    <!-- ONLINE -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
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
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student's Corner<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li class="active"><a href="#">View Marks</a></li>
                                    <li><a href="studentDownload.aspx">Download Section</a></li>
                                </ul>
                            </li>
                            <li class="active">
                                <asp:Button ID="signOutbtn" runat="server" class="btn btn-default navbar-btn" Text="Sign Out" OnClick="signOutbtn_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <!-- Some student details start -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Welcome</h4>
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
                <br />
                <h4>Select Your Desired Year and Semester</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Select Year"></asp:Label>
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
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Select Semester"></asp:Label>
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
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="displayButton" runat="server" Text="Show Marksheet" CssClass="btn btn-success btn-lg" OnClick="displayBtn_Click" ValidationGroup="valGroup1"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- some student details end -->
        
        <!-- marks view table start-->
        <hr />
        <div class="container">

            <div class="panel panel-default panel-primary">
            <div class="panel-heading">Your Marks</div>

            <asp:Repeater ID="marksDisplayRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table table-condensed" id="table">
                <thead>
                    <tr>
                        <th>Course Title</th>
                        <th>Course No.</th>
                        <th>Credit Hour</th>
                        <th>Course Teacher</th>
                        <th>Total Marks</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("courseTitle") %></td>
                        <td><%# Eval("courseNo") %></td>
                        <td><%# Eval("creditHour") %></td>
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
        <!-- marks view table start-->

        <div class="container">
            <div class="form-horizontal" style="padding-bottom: 50px">
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="cgpaButton" runat="server" Text="Calculate CGPA" CssClass="btn btn-lg cyan darken-3 waves-effect" OnClick="cgpaButton_Click" ValidationGroup="valGroup1" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="cgpaLabel" runat="server" CssClass="col-md-5 control-label" Font-Bold="true" Font-Size="Large" ForeColor="Green"></asp:Label>
                </div>
            </div>
        </div>

        

    </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
</body>
</html>
