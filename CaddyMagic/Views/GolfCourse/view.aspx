<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CaddyMagic.Domain.GolfCourse>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= Html.Encode(Model.name) %> - Caddy Magic Golf Courses
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
    $(document).ready(function () {
        $('#ddHole').change(function () {

            $.get('/GolfCourse.aspx/HoleMap', { holeId: $('#ddHole').val() },
           function (data) {
               $('#mapHolder').html(data);
           });

        });
    });
</script>
  <div class="mainContent">
  <div>
    <h1 class="cName"><%= Model.name %></h1>
    <p class="cArea"><%= Model.area %></p>
    </div>
    <div style="clear:both"></div>
    <div>
    <p>
        <%= Model.description %>
    </p>
    </div>
     <div class="mapInput">
    <div style="margin-bottom:10px;"><strong>Select a hole to view: </strong>
       <%=Html.DropDownList("ddHole", (List<SelectListItem>)ViewData["HolesDropDown"], new { @style=" font-size:large;"})%>
       </div>
 <div id="mapHolder">

    <% Html.RenderAction("HoleMap", "GolfCourse", new { holeId = Model.holes.FirstOrDefault().Id });%>
  </div>
</div>
    </div>
    <div class="smallColumn">
    
	<%Html.RenderPartial("StandardRightColumn"); %>
   
   
</div>
<div class="clear">
</div>

</asp:Content>
