<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content Id="Content1" ContentPlaceHolderId="TitleContent" runat="server">
	Caddy Magic - The Golf Courses
</asp:Content>

<asp:Content Id="Content2" ContentPlaceHolderId="MainContent" runat="server">
<script>
    $(document).ready(function () {
        $('.greyedOut').click(function () {
            $(this).val("");
            $(this).removeClass("greyedOut");
        });


        $('#click').click(function () {
            $.post("/GolfCourse.aspx/Upload",
            payload,
   function (data) {
       alert('done'); ;
   }, "json");



        });

    });


  
</script>

       <div class="mainContent">
			<h1>Golf courses</h1>
			<p>Once you've mapped a course you can share it with other users.  You must have at least a tee and a green
			uploaded for each hole you add in order to share a map. 
			</p>
	        
	         <p>To get one of the courses on your phone, select "Download a Course" from the menu on the Courses screen in Caddy Magic.</p>

         
	       
	      <!--  <% //Html.BeginForm("Search");%>
	        <h3 style="float:left; ">Search Courses</h3> <%= Html.TextBox("txtSearch", "Course name...", new { @class = "as_coursename greyedOut " })%>
	        <input type="submit" value="Find" class="btn green" style="top:-5px"/>
	        <div class="clear"></div>
	        <% //Html.EndForm();%> -->
	         <h2>
	            Latest courses added
	        </h2>
	        <ul class="courseList">
	        <% foreach (CaddyMagic.Domain.GolfCourse c in (List<CaddyMagic.Domain.GolfCourse>)ViewData["courses"])
            { %>
                <li>
                   <div> <h3 style="float:left;"><%= Html.ActionLink(c.name, "view", new { courseID=c.Id })%></h3> <div  style="float:right; font-size:small; padding:2px 0px 0  0px;">Course added: <%=c.created.ToShortDateString() %></div></div>
                   <div class="clear"></div>
                   <div class="coursearea"><%= Html.Encode(c.area) %></div>
                    <div class="coursedescription"><%=  Html.Encode(c.description) %></div>
                    
                </li>
          <%  } %>
	           
	        </ul>
            <ul id="pageLinks">
            <%int NumPages = int.Parse(ViewData["NumCourses"].ToString()) / 10;
              int currentPage = 0;
                while(currentPage <= NumPages)
              { %>
                <li><%=Html.ActionLink((currentPage + 1).ToString(), "Index", new { pageNumber = currentPage+1 })%></li>
                <%currentPage = currentPage + 1;
              } %>

            </ul>

    </div>
    
    <div class="smallColumn">
			<%Html.RenderPartial("StandardRightColumn"); %>
    </div>
    
    <div class="clear">
    	
   </div>

</asp:Content>
