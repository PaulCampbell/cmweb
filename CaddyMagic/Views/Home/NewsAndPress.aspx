<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Caddy Magic - News and Press Releases
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
       <div class="mainContent">
			<h1>News and press releases</h1>
            <div class="story" id="s3">
            
             <h2>Big update available for the beta release</h2>
            <span class="date">26/06/2010</span>
            <p>
                I've put out a big update for the beta release today.
            </p>
            <p>
                The release inludes a lot of bug fixes to problems people were having in the first build. I've also 
                opened up the course download functionlity to test how that works - it's limited to 10 courses, but I'll switch 
                these about regularly.
            </p>
            <p>
                You can get the new build by updating Caddy Magic on your phone. 
            </p>
            </div>
            <div class="story"  id="s2">
            <h2>Beta release... How it's going.</h2>
            <span class="date">23/05/2010</span>
            <p>So, it's the end of day 6 since launching the beta build on the market place.  At the moment the app has over 1000 downloads. </p>
            <p>There are a few bug reports coming in that I'm working on at the moment, so I should have a new build that addresses these problems soon. 
            I have also been busy building a tool to allow people to map their local course online, before they go out and play. More on this later...</p>
            <p>Hope the beta has worked ok for you - please get in touch if you've experienced any problems, and I'll see if I can get to the bottom of it.</p>

            </div>
            <div class="story"  id="s1">
	        <h2>Caddy Magic Beta Realease</h2>
            <span class="date">12/05/2010</span>
            <p>
                Caddy Magic is now available on the Android Marketplace for beta testing.  Get the beta version of Caddy Magic for free now. 
                The current application is the full edition - you can get out, record your local course, and start using the Caddy Magic
                golf range finder now. 
            </p>
            <p>
                This first release has the course download functionality disabled, but users who use the app and upload a course will be eligable 
                for a free full edition when it is released in a few months... <strong>Help us by mapping your local course and we'll save you a few quid
                when the full version comes out.</strong><br /><br />
                Once you've uploaded a course, drop me an email on the contact page, and let me know about it! When the full version is released, I'll send it to you for free!

            </p>
            <p>Go to the market place on your phone and search for Caddy Magic to get the beta release!</p>
            </div>
    </div>
    
    <div class="smallColumn">
		<%Html.RenderPartial("StandardRightColumn"); %>
    	
   </div>
   <div class="clear">
    	
   </div>
</asp:Content>
