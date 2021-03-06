<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Caddy Magic - Golf range finder for your mobile... How it works
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mainContent">
        <h1>How it works</h1>
	    <img src="../../Content/images/LargeScreenShot.jpg" alt="Caddy Magic range finder screen shot" align="right" />
	    <h2>Using Caddy Magic</h2>
	    <p>Using Caddy Magic couldn't be much simpler.  Download your course, 
	    or map it yourself (which is really easy... you don't even have to go out of your way - it just takes 
	    playing a round...)
	    </p>
	    <p>
	    Once you are out on the tee, and all the features of the hole will be listed along with their distance and height relative to you.
       Click on any of the features and the hole will be displayed on a map where you can find the distance to any location on the hole.
	    </p>
	    <h2>Mapping a course</h2>
	    
	    <p>
	        Mapping your home course is easy.  Simply take your phone 
	        around the course next time you're out and mark each of the holes out as you play them.
	    </p>
	    <p>
	        You only need to mark the tee and the green on each hole. Next time you play, you'll get full
	        distance information for each hole.
	    </p>
	    <p> Once your course is mapped, you can upload it and share with other users, so hopefully we can build up
	        quite a little catalogue to share with each other... Helpful for those away days...
	    </p>
        <p>
            Many thanks to all our early users who have been adding maps to the database.  If you've mapped a course, please share it with others by selecting
            upload from the menu in the application.
        </p>
        <%=Html.ActionLink("See the courses already mapped.","Index","GolfCourse",null,null) %>
    </div>
    
    <div class="smallColumn">
			<%Html.RenderPartial("StandardRightColumn"); %>
			
    </div>
    
    <div class="clear">
    	
   </div>

</asp:Content>
