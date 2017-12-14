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


         <a href="DisplayCode.aspx?filename=~/1A_2/documentation.aspx" 
target="_blank"> 
			ShowCode.aspx
	</a>


    <p>
        Author Name:Yunhong Li<br />
        <br />
        Student ID: 25853678 <br />
        <br />
        Unit's Name:Internet applications development<br />
        <br />
        Unit Provider:Monash University, The Caulfield School of Information Technology<br />
        <br />
        Assignment Number:T3A.2<br />
        <br />
        Date of Submission: 21 Jan 2016<br />
        <br />
        Tutors Name:ABM Russel, Chris Messom<br />
        <br />
        Email: <asp:HyperLink id="hyperlink1" 
                  NavigateUrl="mailto:yli565@student.monash.edu"
                  Text="Author"
                  runat="server"/> 
                 <br />
        <br />
         Assignment Specification:<asp:HyperLink id="hyperlink2" 
                  NavigateUrl="http://moodle.vle.monash.edu/mod/page/view.php?id=2756065"
                  Text="Assignment Specification"
                  runat="server"/> 
                 <br />
        <br />
        </ p>


        </asp:Content> 