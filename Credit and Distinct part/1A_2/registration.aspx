<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Page Language="C#" MasterPageFile="~/1A_2/Master.master"
    Title="Home Page"%>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />



<script language="c#" runat="server">
private void addRec(object sender, EventArgs e)
{
	lblMsg.Text = "";
	if (!(Page.IsValid))
    {
      return;
    }
	else
	{
        lblMsg.Text = "First name: " + ((TextBox)FormView1.FindControl("FName")).Text + "<br>"
                         + "Last name: " + ((TextBox)FormView1.FindControl("LName")).Text + "<br>"
                         + "Email: " + ((TextBox)FormView1.FindControl("Email")) + "<br>"
                         + "Address: " + ((TextBox)FormView1.FindControl("Addr")) + "<br>"
                         + "Postcode: " + ((TextBox)FormView1.FindControl("Post")) + "<br>"
                         + "State: " + ((TextBox)FormView1.FindControl("State")) + "<br>";

        
        
        AccessDataSource1.Insert();         
	}
}
</script>
<head>
<title>Register</title>

</head>

<body>


     <a href="DisplayCode.aspx?filename=~/1A_2/registration.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>

 <asp:SiteMapPath ID="SiteMapPath1" runat="server">
      <PathSeparatorTemplate> 
         --> 
       </PathSeparatorTemplate>
    </asp:SiteMapPath>
        <br />
   
    
    
     <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/register.mdb" 
        DeleteCommand="DELETE FROM [register] WHERE [Email] = ?" 
        InsertCommand="INSERT INTO [register] (  [First_name], [Last_name],  [Email], [Address], [Postcode], [State]) VALUES (?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [register]" 
        UpdateCommand="UPDATE [register] SET [First_name] = ?, [Last_name] = ?, [Email] = ?, [Address] = ?, [Postcode] = ?, [State] = ? WHERE [Email] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Email" Type="String" />
        </DeleteParameters>
       
        <UpdateParameters>
            <asp:Parameter Name="First_name" Type="String" />
            <asp:Parameter Name="Last_name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Postcode" Type="Int32" />
            <asp:Parameter Name="State" Type="String" />
        </UpdateParameters>


        <InsertParameters>
            <asp:formparameter Name="First_name" formfield="FName" />
            <asp:formparameter Name="Last_name" FormField="LName" />
            <asp:formparameter Name="Email" FormField="Email" />
            <asp:formparameter Name="Address" FormField="Addr" />
            <asp:formparameter Name="Postcode" FormField="Post" />
            <asp:formparameter Name="State" FormField="State" />
        </InsertParameters>
        

    </asp:AccessDataSource>
    <br />


    


    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DefaultMode="Insert" DataSourceID="AccessDataSource1">
        <InsertItemTemplate>

	<asp:Label ID="lblFName" Font-Bold="true" Font-Name="Arial" Text="First Name"  runat="server"/>
	<asp:TextBox id="FName" Columns="50" runat="server" Text='<%# Bind("First_Name")%>' />
	<br />
	<asp:RequiredFieldValidator ID="vFName" ControlToValidate="FName" Display="Dynamic" ErrorMessage="Please Enter First Name"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	<asp:Label ID="lblLName" Font-Bold="true" Font-Name="Arial" Text="Last Name"  runat="server"/>
	<asp:TextBox id="LName" Columns="50" runat="server" Text='<%# Bind("Last_Name") %>'/>
	<br />
	<asp:RequiredFieldValidator ID="vLName" ControlToValidate="LName" Display="Dynamic" ErrorMessage="Please Enter Last Name"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />	
	<asp:Label ID="lblEmail" Font-Bold="true" Font-Name="Arial" Text="Email"  runat="server"/>
	<asp:TextBox id="Email" Columns="50" runat="server" Text='<%#Bind("Email") %>'/>
	<br />
	<asp:RequiredFieldValidator ID="vEmail" ControlToValidate="Email" Display="Dynamic" ErrorMessage="Please Enter an Email Address"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	<asp:Label ID="lblreEmail" Font-Bold="true" Font-Name="Arial" Text="Re-Enter Email Address"  runat="server"/>
	<asp:TextBox ID="reEmail" Columns="50" runat="server"/>
	<br />	
	<asp:RequiredFieldValidator ID="vreEmail" ControlToValidate="reEmail" Display="Dynamic" ErrorMessage="Please re-Enter an Email Address"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	<asp:RegularExpressionValidator ID="regEmail" ControlToValidate="Email" Display="Dynamic" ValidationExpression=".*@.*\..*" ErrorMessage="Please Enter a Valid Email Address"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	<asp:CompareValidator ID="comEmail" ControlToCompare="Email" ControlToValidate="reEmail" Display="Dynamic" ErrorMessage="Email Address Don't Match"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	
	<asp:Label ID="lblAdd" Font-Bold="true" Font-Name="Arial" Text="Address"  runat="server"/>
	<asp:TextBox id="Addr" Columns="50" runat="server" Rows="3" TextMode="MultiLine"  Wrap="true" Text='<%# Bind("Address") %>'/>
	<br />
	<asp:RequiredFieldValidator ID="vAddr" ControlToValidate="Addr" Display="Dynamic" ErrorMessage="Please Enter An Address"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />
	
	<asp:Label ID="lblPost" Font-Bold="true" Font-Name="Arial" Text="Postcode"  runat="server"/>
	<asp:TextBox id="Post" Columns="50" runat="server" Text='<%# Bind("Postcode") %>'/>
	
	<asp:Label ID="lblState" Font-Bold="true" Font-Name="Arial" Text="State"  runat="server"/>
	<asp:DropDownList id="State" runat="server">
		<asp:ListItem Text="ACT" Value="ACT"/>
		<asp:ListItem Text="NT" Value="NT"/>
		<asp:ListItem Text="NSW" Value="NSW"/>
		<asp:ListItem Text="QLD" Value="QLD"/>
		<asp:ListItem Text="SA" Value="SA"/>
		<asp:ListItem Text="WA" Value="WA"/>
		<asp:ListItem Text="TAS" Value="TAS"/>
		<asp:ListItem Text="VIC" Value="VIC" Selected="true"/>
	</asp:DropDownList>
	<br />
	<asp:RequiredFieldValidator ID="vPost" ControlToValidate="Post" Display="Dynamic" ErrorMessage="Please Enter a Postcode"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<asp:RangeValidator ID="rgPost" ControlToValidate="Post" MinimumValue="1000" MaximumValue="9999" Type="Integer" Display="Dynamic" ErrorMessage="Please Enter a Valide Postcode"  Font-Name="Arial" ForeColor="#FF0000" runat="server"/>
	<br />	




     <asp:HyperLink id="hyperlink" 
                  NavigateUrl="~/1A_2/customer.aspx"
                  Text="Click here to see all the customers"
                  runat="server"/> 

    <br />
    <br />

	<asp:Button ID="btnSub" OnClick="addRec" Text="Submit" runat="server"  OnClientClick="addRec" CommandName="Insert"/>
	<br />	
    </InsertItemTemplate>
        </asp:FormView>
    
           <asp:Label ID="lblMsg" Font-Name="Arial"  ForeColor="#0066FF" runat="server"/>





</body>

            </asp:Content> 