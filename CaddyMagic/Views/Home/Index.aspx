<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
Caddy Magic - Golf Range Finder for Android Mobile Phones
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="mainContent">
		<h1>The Golf Range Finder for your Android phone</h1>
		<div style="width:250px; float:right;">
		<script>
		    $(document).ready(function() {
		        $('#img1').mouseover(function() {
		            $('#selectedImage').attr("src", "../../content/images/hero.jpg");
		            $('.imgRotatorLinks li img').attr("style", "");
		            $('#img1').attr("style", "border: solid 1px #def2fc;");
		        });
		        $('#img2').mouseover(function() {
		            $('#selectedImage').attr("src", "../../content/images/hero_map.jpg");
		            $('.imgRotatorLinks li img').attr("style", "");
		            $('#img2').attr("style", "border: solid 1px #def2fc;");
		        });
		        $('#img3').mouseover(function() {
		        $('#selectedImage').attr("src", "../../content/images/hero_home.jpg");
		        $('.imgRotatorLinks li img').attr("style", "");
		        $('#img3').attr("style", "border: solid 1px #def2fc;");
		        });
		    });
		</script>
		
		<img id="selectedImage" src="../../content/images/hero.jpg" alt="Caddy Magic screen shot" />
		<ul class="imgRotatorLinks">
		    <li><img id="img1" src="../../content/images/ssListSmall.png" alt="Golf Range Finder: View hole" /></li>
		    <li><img id="img2" src="../../content/images/ssMapSmall.png" alt="Golf Range Finder: Map view" /></li>
		    <li><img id="img3" src="../../content/images/ssHomeSmall.png" alt="Home page" /></li>
		</ul>
		</div>
		<p>Caddy Magic turns your phone into a golf range finder.</p>
		<p>No need to carry extra gadgets around with you... Just download the software and your 
		phone becomes a fully functioning golf range finder!</p>
		<p>It works with any phone running on the Google Android operating system.</p>
		
		<h2>Features</h2>
		<ul class="standardList">
			<li><strong>View the hole on Google Maps</strong> with green and hazards clearly marked.</li>
			<li><strong>Distance to green and hazards</strong> - Tap anywhere on the map to see its distance from you.</li>
			<li><strong>Record your own course</strong> – No need to wait for your local course to be mapped. Map it yourself 
			with our simple user interface.</li>
		
		</ul>
		
		<h2>Get Caddy Magic Now</h2>
		
		<p><strong>Caddy Magic Beta</strong> edition is available for download now on the Android Market.</p>
		<p>It is an early release and we would very much appreciate feedback on how to improve Caddy Magic</p>
		<p><strong>Go to the Android Market on your phone and search for "Caddy Magic" to start using the GPS Range finder now.</strong></p>
		</div>

<div class="smallColumn">
	<%Html.RenderPartial("StandardRightColumn"); %>
</div>

<div class="clear">
	
</div>

</asp:Content>
