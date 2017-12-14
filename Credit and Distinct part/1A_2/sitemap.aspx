<%@ Page Language="C#" MasterPageFile="~/1A_2/Master.master"
    Title="Home Page"%>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />

            <asp:SiteMapPath ID="SiteMapPath1" runat="server" BackColor="White">  </asp:SiteMapPath>  
    <br />
    <br />

    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

         <a href="DisplayCode.aspx?filename=~/1A_2/sitemap.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>
 
<asp:TreeView ID="TreeView1" runat="server"
DataSourceID="SiteMapDataSource1"
ShowLines="True" />    
        </asp:Content> 


   
<%--  --%>