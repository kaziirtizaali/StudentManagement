<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teacherPanel.aspx.cs" Inherits="StudentManagement.teacherPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher Panel</title>
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
                            <li class="active"><a href="#">Teacher's Panel</a></li>
                            <li class="active">
                                <asp:Button ID="signOutbtn" runat="server" class="btn btn-default navbar-btn" Text="Sign Out" OnClick="signOutbtn_Click"/>
                            </li>                       
                        </ul>
                    </div>
                </div>
            </div>  
    
    </div>

        <!-- Some teacher details start -->
        <div class="container">
            <div class="form-horizontal">
                <h4>Welcome</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Your Name:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="teacherNameLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Your Email:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="teacherEmailLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Department:"></asp:Label>
                    <div class="col-md-3">
                        <asp:Label ID="teacherDeptLabel" runat="server" CssClass="form-control panel-success text-success"></asp:Label>
                    </div>
                </div>
                <br />
                <h4>Select Marksheet from EXCEL spreadsheet</h4>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Select Source"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="FileUpload1" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Which Sheet?"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="sheetTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="sheetTextBox" ValidationGroup="valGroup1"></asp:RequiredFieldValidator>
                    </div>
                    
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="uploadButton" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="uploadBtn_Click" ValidationGroup="valGroup1"/>

                    </div>
                </div>
                <br />
                <h4>Upload Course Materials</h4>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForYear" InitialValue="none" ValidationGroup="valGroup2"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Semester"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForSemester" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Semester" Value="none"></asp:ListItem>
                            <asp:ListItem Text="1st" Value="1st"></asp:ListItem>
                            <asp:ListItem Text="2nd" Value="2nd"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForSemester" InitialValue="none" ValidationGroup="valGroup2"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" CssClass="col-md-2 control-label" Text="Course Title"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="DropDownListForCourseTitle" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="DropDownListForCourseTitle" InitialValue="0" ValidationGroup="valGroup2"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Select The File"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="The Field field is Required !" ControlToValidate="FileUpload2" ValidationGroup="valGroup2"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="saveButton" runat="server" Text="Save" CssClass="btn btn-success" OnClick="saveBtn_Click" ValidationGroup="valGroup2"/>
                    </div>
                </div>
            </div>
        </div>

        <!-- some teacher details end -->
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
