<%@ Page Language="C#" Debug="true" MasterPageFile="~/1A_2/Master.master"%>



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

    void displayCustomer(object sender, GridViewCommandEventArgs e)
    {
        lblDisplayCustomer.Text = "First Name: </b>" + gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text
            + "<br />Last Name:</b>" + gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text +
            "<br />Email: </b>" + gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text + "<br />Address:" +
            gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text + "<br />Postcode:</b>" +
            gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].Text + "<br />State:</b>" +
            gvCustomer.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].Text;
    }

    protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>


     <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/register.mdb" 
            SelectCommand="SELECT * FROM [register]"></asp:AccessDataSource>
    



<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>GridView</title>
</head>
<body>
    

 <asp:HyperLink id="hyperlink" 
                  NavigateUrl="~/1A_2/search.aspx"
                  Text="Click here to search a customer"
                  runat="server"/> 

    <br />
    <br />






     <a href="DisplayCode.aspx?filename=~/1A_2/customer.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a> 





    <asp:Label ID="lblDisplayCustomer" runat="server" />
        <p />
        <asp:GridView ID="gvCustomer" runat="server" DataSourceID="AccessDataSource1" AutoGenerateColumns="false" OnRowCommand="displayCustomer">

            <Columns>
                <asp:ButtonField ButtonType="Button" Text="Display" />
                <asp:BoundField DataField="First_Name" HeaderText="First Name" ReadOnly="true" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" ReadOnly="true" />
                <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="true" />
                <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="true" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" ReadOnly="true" />
                <asp:BoundField DataField="State" HeaderText="State" ReadOnly="true" />
            </Columns>
      </asp:GridView>




</body>
</html>

    
            </asp:Content> 