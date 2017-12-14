<%@ Page Language="C#" Debug="true"  MasterPageFile="~/1A_2/Master.master"%>



<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />


<script runat="server">

void login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        AccessDataSource1.SelectCommand = ("Select * From [login]  Where username = '" + Login.UserName + "' AND password = '" + Login.Password + "'");
        AccessDataSource1.Select(DataSourceSelectArguments.Empty);
    }
    
private void CheckLogin(object sender, SqlDataSourceStatusEventArgs e)
    {
        if(e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(Login.UserName, false);
        }
        else
        {
            Login.FailureText = "Invalid Login";
        }
    }

</script>




<body>
    
    
         <a href="DisplayCode.aspx?filename=~/1A_2/login.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/login.mdb" SelectCommand="SELECT * FROM [login]" OnSelected="CheckLogin"></asp:AccessDataSource>

    

        <asp:Login ID="Login" runat="server"
            OnAuthenticate="login_Authenticate" 
            TitleText="<br />Please enter yourdetails<br />
                               below To Login this site <br /><br />"
            UserNameLabelText="Username:"
            UserNameRequiredErrorMessage="Username Required<p />"
            PasswordLabelText="Password:"
            PasswordRequiredErrorMessage="Password required"
            Height="250" Width="330"
        LoginButtonText="Click to login" 
            DisplayRememberMe="false">
        </asp:Login>

        <p />
        <asp:ValidationSummary ID="vlSummary1" Font-Names="Arial"
            Visible="true" runat="server" ValidationGroup="Login"
            HeaderText="Please correct the following errors:" />
        
    

</body>


            </asp:Content> 