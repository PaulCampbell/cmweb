<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CaddyMagic.Domain.Feature>" %>


<%= Html.ActionLink("Save", "SaveFeature", null, new { @class="actionButton"})%>
<%= Html.ActionLink("Cancel", "SaveFeature", null, new { @class="cancelButton"} %>

