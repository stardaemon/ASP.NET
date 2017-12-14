<%@ Page Language="C#" MasterPageFile="~/1A_2/Master.master"
    Title="Home Page"%>

<asp:Content ID="Content1"
    ContentPlaceHolderID="ContentPlaceHolder1" runat="server"><br />

             <asp:SiteMapPath ID="SiteMapPath1" runat="server">
      <PathSeparatorTemplate> 
         --> 
       </PathSeparatorTemplate>
    </asp:SiteMapPath> 
    <br />
    <br />

         <a href="DisplayCode.aspx?filename=~/1A_2/top.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>


 <table cellpadding="0" cellspacing="100">
        <tr>
            <td class="auto-style2"><img src="../Images/Mars01.png"></td>
            <td>
                This is the home page of MARS BASE <br />
             </td>
             <td>
                 <img src="../Images/mars02.png" />
             </td>
        </tr>
        </table>
   
   <table  align="center"> 
       <tr>
              
    <asp:HyperLink id="hyperlink3" 
                  NavigateUrl="http://www.monash.edu/disclaimer-copyright"
                  Text="Monash Disclaimer"
                  runat="server"/> 
    <br />
            
           </tr>
       </table>
    <table>
    <tr>
     Email:
    <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="mailto:yli565@student.monash.edu"
                  Text="Author"
                  runat="server"/> 
    <br />
          
    Email:
        <asp:HyperLink id="hyperlink2" 
                  NavigateUrl="mailto:yli565@student.monash.edu"
                  Text="Webmaster"
                  runat="server"/> 
    <br />

         <td with = "100" valign = "top" align="right">
<font size="+2" color="olive" face="Arial">
<asp:AdRotator id="AdRotator1" runat="server"
            Target="_self" Visible="false"/>

 <br>
   <asp:AdRotator id="AdRotator2" runat="server"
            Target="_self" Visible="false"/>
<br>
    <asp:AdRotator id="AdRotator3" runat="server"
            Target="_self" Visible="false"/>
<br>
   <asp:AdRotator id="AdRotator4" runat="server"
            Target="_self" Visible="false"/>
<br>

</font>
</td>
              
           </tr>
       </table>

        </asp:Content> 


   
<%--  --%>