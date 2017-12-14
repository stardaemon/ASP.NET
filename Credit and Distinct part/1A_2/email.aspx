<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Page Language="C#" MasterPageFile="~/1A_2/Master.master"%>



<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />


     <asp:SiteMapPath ID="SiteMapPath1" runat="server">
      <PathSeparatorTemplate> 
         --> 
       </PathSeparatorTemplate>
    </asp:SiteMapPath>
        <br />
    <br />


<script runat="server">
    
    public void SendEmail(object sender, EventArgs e)
    {
        MailMessage newMsg = new MailMessage();
        
        foreach(GridViewRow gvRow in gvCustomers.Rows)
        {
            CheckBox cb = (CheckBox)gvRow.FindControl("chkEmail");
            
            if(cb != null && cb.Checked)
            {
                newMsg.To.Add(new MailAddress(gvRow.Cells[3].Text,
                    gvRow.Cells[1].Text + " " + gvRow.Cells[2].Text));
            }
        }

        newMsg.From = new MailAddress("yli565@student.monash.edu", "Mars Base");
        newMsg.Subject = txtSubject.Text;
        newMsg.Body = txtMsg.Text;
        
        
        try
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.monash.edu.au";
            smtp.Send(newMsg);
            lblMail.Text = "Mail Successfully Sent";
        }
        catch (Exception exc)
        {
            lblMail.Text = exc.Message;
        }
    }



    protected void gv_Sorting(object sender, GridViewSortEventArgs e)
    {
        switch (e.SortExpression)
        {
            case "First_Name":
                {
                    AccessDataSource1.SelectCommand = "SELECT [First_Name], [Last_Name], [Email], [ID] FROM [register] order by First_Name";
                    AccessDataSource1.DataBind();
                }
                break;
            case "Last_Name":
                {
                    AccessDataSource1.SelectCommand = "SELECT [First_Name], [Last_Name], [Email], [ID] FROM [register] order by Last_Name";
                    AccessDataSource1.DataBind();                
                }
                break;
            case "Email":
                {
                    AccessDataSource1.SelectCommand = "SELECT [First_Name], [Last_Name], [Email], [ID] FROM [register] order by Email";
                    AccessDataSource1.DataBind();
                }
                break;
        }
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Send Email</title>
</head>
<body>
    
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/register.mdb" SelectCommand="SELECT [First_Name], [Last_Name], [Email], [ID] FROM [register]"></asp:AccessDataSource>

         <a href="DisplayCode.aspx?filename=~/1A_2/email.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>


    <asp:label ID="lblMail" runat="server" />
    <p />

    <asp:GridView ID="gvCustomers" runat="server" 
        DataSourceID="AccessDataSource1" DataKeyNames="ID"
        OnSorting="gv_Sorting"       
         AutoGenerateColumns="false"
        CellPadding="5">
        <Columns>
            <asp:BoundField DataField="ID" Visible="false" />
            <asp:BoundField DataField="First_Name" HeaderText="Given Name" SortExpression="First_Name"/>
            <asp:BoundField DataField="Last_Name" HeaderText="Family Name" SortExpression="Last_Name"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>

            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chkEmail" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    <br /><br /><br />


    <table>
        <tr>
            <td width="15%">From</td>
            <td>Mars Base</td>
            </tr>
        <tr>
            <td width="15%">Subject</td>
            <td>
                <asp:TextBox ID="txtSubject" Width="350" runat="server" />
                </td>
            </tr>
        <tr>
            <td>Message</td>
            <td>
                <asp:TextBox runat="server" ID="txtMsg"
                    TextMode="MultiLine" Columns="55" Rows="15" />
                </td>
            </tr>
        </table>
    <br />

    <asp:Button ID="SendMail" runat="server"
        OnClick="SendEmail" Text="Send Email" />
    <br /><br />


</body>

</html>


    </asp:content>