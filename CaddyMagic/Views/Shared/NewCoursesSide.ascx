<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<List<CaddyMagic.Domain.GolfCourse>>" %>
<h3>Latest courses</h3>
<ul class="smallList">
<%foreach(var g in ViewData.Model){ %>
    <li><%= Html.ActionLink(g.name, "view", "GolfCourse", new { courseId = g.Id }, null)%></li>
 <%  };%> 
</ul>