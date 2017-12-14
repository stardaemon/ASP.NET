<%@ Page Language="C#" Debug="true"MasterPageFile="~/1A_2/Master.master"%>



<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />

     <asp:SiteMapPath ID="SiteMapPath1" runat="server">
      <PathSeparatorTemplate> 
         --> 
       </PathSeparatorTemplate>
    </asp:SiteMapPath>
        <br />
    <br />

<script language="C#" runat="server">

    private void findCustomer(object sender, EventArgs e)
    {
        Button btn=(Button)sender;
        
        switch (btn.CommandName)
        {
            case "ID":
                AccessDataSource1.SelectCommand = "SELECT * FROM [register] Where id Like '%" + txtId.Text.Trim(' ')+"%'";               
                break;
             case "Name":
                AccessDataSource1.SelectCommand = "SELECT * FROM [register] Where First_Name Like '%"+txtName.Text.Trim(' ')+"%' or Last_Name Like '%" +txtName.Text.Trim(' ')+"%'";
                break;
            case "Address":
                AccessDataSource1.SelectCommand = "SELECT * FROM [register] Where Address Like '%" +txtAddress.Text.Trim(' ')+"%'";
                break;
        }
        
        lv.DataSource= AccessDataSource1;
      
            lv.DataBind();
    }

</script>



<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/register.mdb"
     SelectCommand="SELECT * FROM [register]"></asp:AccessDataSource>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Search A Customer</title>
</head>
<body>
 

         <a href="DisplayCode.aspx?filename=~/1A_2/search.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>

        <center><h2>Find A Customer</h2></center>

        <table>
            <tr>
                <td colspan="2"> Please enter part, or all, the customer's id(without any spaces). <br /> 
                </td>
            </tr>
            <tr>
                <td class="text">
                    <asp:TextBox ID="txtId" runat="server" Width="100"></asp:TextBox>
                    </td>
                <td>
                    <asp:Button ID="btnId" OnClick="findCustomer" runat="server" Text="Click to find a customer by ID" CommandName="ID"/>
                    </td>
                </tr>
            <tr>
                <td><b> or </b></td>
                </tr>
            
             <tr>
                <td colspan="2"> Please enter part, or all, the customer's name(without any spaces). <br /> 
                </td>
            </tr>
            <tr>
                <td class="text">
                    <asp:TextBox ID="txtName" runat="server" Width="100"></asp:TextBox>
                    </td>
                <td>
                    <asp:Button ID="btnName" OnClick="findCustomer" runat="server" Text="Click to find a customer by Name" CommandName="Name"/>
                    </td>
                </tr>
            <tr>
                <td><b> or </b></td>
                </tr>
             



             <tr>
                <td colspan="2"> Please enter part, or all, the customer's Address(without any spaces). <br /> 
                </td>
            </tr>
            <tr>
                <td class="text">
                    <asp:TextBox ID="txtAddress" runat="server" Width="100"></asp:TextBox>
                    </td>
                <td>
                    <asp:Button ID="btnAddress" OnClick="findCustomer" runat="server" Text="Click to find a customer by Address" CommandName="Address"/>
                    </td>
                </tr>

            </table>
        <br /><br /><br />
    
        <asp:listView ID="lv" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <b>First Name: <%# Eval("First_Name") %><br />
                                Last Name: <%# Eval("Last_Name") %><br />
                                Email:<%# Eval("Email") %><br />
                                Address: <%# Eval("Address") %><br />
                                Postcode:<%# Eval("Postcode") %><br />
                                State:<%# Eval("State") %><br />
                        </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:listView>

</body>
</html>


    
            </asp:Content> 