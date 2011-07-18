<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	 Caddy Magic - Contact us
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="mainContent">
<script type="text/javascript" src="../../Content/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {



        // validate signup form on keyup and submit
        $("#emailForm").validate({
            rules: {
                txtSubject: "required",
                txtMessage: "required",
                txtEmail: {
                    required: true,
                    email: true
                }
            },
            messages: {
                txtSubject: "Please enter a subject",
                txtMessage: "Please enter your message",
                txtEmail: {
                    required: "Please enter an email address",
                    email: "Please enter a valid email address"
                }
            }
        });
    });
  
 
     

</script>

			<h1>Contact us</h1>
			<% if (ViewData["MessageStatus"] == "sent")
      { %>
			<p>Thanks a lot for your message.  We will read it and get back to you as soon as possible.</p>
			<%}
      else
      { %>
			
			<p>If you have any questions or feedback about Caddy Magic, we'd love to hear it! 
			Please use the form below to get in touch and let us know what you're thinking.</p>
			<div class="contactForm">
			<%Html.BeginForm("Contact", "Home", FormMethod.Post,new { @Id = "emailForm" });%>
		    <label for="txtSubject">Subject</label>
		    <%=Html.TextBox("txtSubject", null, new { @class="txtSubject"})%><br /><br />
		    <label for="txtEmail">Email address</label>
		    <%= Html.TextBox("txtEmail", null, new { @class="txtEmail"})%><br /><br />
		       <label for="txtMessage">Message</label>
		    <%= Html.TextArea("txtMessage", new { @class = "textArea txtMessage" })%><br /><br /><br /><br />
		    <input type="submit" value="Send message" class="btn green" />
		    <%Html.EndForm();%>
		    
		    <%} %>
		    </div>
		    
		   
    </div>
    
    <div class="smallColumn">
	<%Html.RenderPartial("StandardRightColumn"); %>
    </div>
    
    <div class="clear">
    	
   </div>

</asp:Content>
