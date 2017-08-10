<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentDownload.aspx.cs" Inherits="StudentManagement.studentDownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download Section</title>
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
                                    <li><a href="studentPanel.aspx">View Marks</a></li>
                                    <li class="active"><a href="#">Download Section</a></li>
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

        <!-- Select year & semester start -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Select Year and Semester</h4>
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
                        <asp:Button ID="displayButton" runat="server" Text="Display" CssClass="btn btn-success" ValidationGroup="valGroup1" OnClick="displayButton_Click"/>
                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="Label2" runat="server"></asp:Label>

        <!-- Select year & semester end -->

        <!-- Downloads table start-->
        <hr />
        <div class="container">

            <div class="panel panel-default panel-primary">
            <div class="panel-heading">Course Materials</div>

            <asp:Repeater ID="downloadRepeater" runat="server" OnItemCommand="downloadRepeater_ItemCommand">
                <HeaderTemplate>
                    <table class="table table-condensed" id="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Course Name</th>
                        <th>File Name</th>
                        <th>Description</th>
                        <th>Course Teacher</th>
                    </tr>
                </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr> 
                        <td>
                            <asp:Label ID="myLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        </td>
                        <td><%# Eval("courseTitle") %></td>
                        <td>
                            <asp:LinkButton ID="downloadLinkButton" runat="server" Text='<%# Eval("Name") %>' OnClick="downloadLinkButton_Click" CommandName="something"></asp:LinkButton>
                        </td>
                        <td><%# Eval("Extension") %></td>
                        <td><%# Eval("TeacherEmail") %></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>

                </FooterTemplate>
            </asp:Repeater>
                    
        </div>
        </div>
        <!-- Downloads table end-->
       
    </form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
