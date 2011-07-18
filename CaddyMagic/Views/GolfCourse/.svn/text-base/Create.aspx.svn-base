<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CaddyMagic.Domain.GolfCourse>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Caddy Magic - Create golf course
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../../Content/jquery.validate.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {

	        $("form").validate({
	            rules: {
	                name: "required",
	                latitude: "required",
	                longitude: "required"
	            },
	            messages: {
	                name: "Please enter a name",
	                latitude: " ",
	                longitude: "Please find the club house on the map and click it"
	            }
	        });

	        $('#txtaddresssearch').focus(function () {
	            if ($(this).val() == "Roundhay, Leeds") {
	                $(this).val("");
	            }
	        });

	        $('#txtaddresssearch').keyup(function (e) {

	            if (e.keyCode == 13) {
	                alert('Enter key was pressed.');
	                showAddress($('#txtaddresssearch').val());
	                return false;
	            }
	        });
	        $('#butSearch').click(function () {

	            showAddress($('#txtaddresssearch').val());
	            return false;
	        })
	    });

	    function load() {
	        if (GBrowserIsCompatible()) {
	            var map = new GMap2(document.getElementById("map"));
	            map.addControl(new GSmallMapControl());
	            map.addControl(new GMapTypeControl());
	            var center = new GLatLng(53.83312, -1.49656);
	            map.setCenter(center, 15);
	            geocoder = new GClientGeocoder();
	            var marker = new GMarker(center, { draggable: false });
	            map.addOverlay(marker);
	          

	            GEvent.addListener(map, 'click', function (overlay, point) {
	                if (overlay) {
	                    // map.removeOverlay(overlay);
	                 //   alert('overlayclicked' + overlay.toString);
	                } else if (point) {
	                    var matchll = /\(([-.\d]*), ([-.\d]*)/.exec(point);
	                    var message = "";
	                    if (matchll) {
	                        map.clearOverlays();
	                        var lat = parseFloat(matchll[1]);
	                        var lon = parseFloat(matchll[2]);
	                        lat = lat.toFixed(6);
	                        lon = lon.toFixed(6);
	                        message = "geotagged geo:lat=" + lat + " geo:lon=" + lon + " ";
	                        $("#lblLat").val(point.lat().toFixed(5));
	                        $("#lblLon").val(point.lng().toFixed(5));
	                        var marker = new GMarker(new GLatLng(lat, lon), { draggable: true });
	                        map.addOverlay(marker);
	                        alert('overlayclicked' + overlay.toString);
	                    } else {
	                        message = "<b>Error extracting info from</b>:" + point + "";

	                    }

	                }
	            });

                   

	            GEvent.addListener(map, "moveend", function () {
	                   

	                GEvent.addListener(marker, "dragend", function () {
	                    var point = marker.getPoint();
	                    map.panTo(point);
	                       

	                });

	            });

	        }
	    }

	    function showAddress(address) {
            
	        var map = new GMap2(document.getElementById("map"));
	        map.addControl(new GSmallMapControl());
	        map.addControl(new GMapTypeControl());
	        if (geocoder) {

	            geocoder.getLatLng(
                        address,
                    function (point) {
                        if (!point) {
                            alert(address + " not found. Try searching for an area or nearby town.");
                        } else {
                            $("#lblLat").val(point.lat().toFixed(5));
                            $("#lblLon").val(point.lng().toFixed(5));
               
                            map.setCenter(point, 14);
                            var marker = new GMarker(point, { draggable: false });
                            map.addOverlay(marker);

                        }
        }
    );
                }
                GEvent.addListener(map, 'click', function (overlay, point) {
                    if (overlay) {
                        // map.removeOverlay(overlay);
                        //   alert('overlayclicked' + overlay.toString);
                    } else if (point) {
                        var matchll = /\(([-.\d]*), ([-.\d]*)/.exec(point);
                        var message = "";
                        if (matchll) {
                            map.clearOverlays();
                            var lat = parseFloat(matchll[1]);
                            var lon = parseFloat(matchll[2]);
                            lat = lat.toFixed(6);
                            lon = lon.toFixed(6);
                            message = "geotagged geo:lat=" + lat + " geo:lon=" + lon + " ";
                            $("#lblLat").val(point.lat().toFixed(5));
                            $("#lblLon").val(point.lng().toFixed(5));
                            var marker = new GMarker(new GLatLng(lat, lon), { draggable: true });
                            map.addOverlay(marker);
                            alert('overlayclicked' + overlay.toString);
                        } else {
                            message = "<b>Error extracting info from</b>:" + point + "";

                        }

                    }
                });
	    }
</script> 

    <div class="mainContent">

<h1>Map a golf course</h1>
<p>
 Add your course before you head out to play to start using Caddy Magic first time out with it. Once you've created 
 your local golf course, you can download it straight to your phone.
</p>
<p>Just fill out the form below, then add the holes and features by selecting them on the map...</p>
<% using (Html.BeginForm()) {%>
    <%= Html.ValidationSummary(true) %>

     
           <ul class="form">
           <li>
        <div class="editor-label">
            Course name
        </div>
        <div class="editor-field">
            <%= Html.TextBoxFor(model => model.name, new {@class="txtName" })%>
         
        </div>
              <%= Html.ValidationMessageFor(model => model.name) %>
            </li>
            <li>
        <div class="editor-label">
            Course description
        </div>
        <div class="editor-field">
            <%= Html.TextAreaFor(model => model.description, new { @rows = 4})%>
          
        </div>
        </li>
        <li>
               
 
    <div class="mapInput">
<div class="editor-label">
  <strong> Course position</strong> 
    </div> <div style="clear:both"></div>
    <small>Find the course you want to add on the map and click on the clubhouse.</small>
    <div style="height:36px;">        
    <input type="text" size="60" name="address" id="txtaddresssearch" value="Roundhay, Leeds" style="float:left; margin-top:2px; margin-right:4px; padding:5px 2px;" /> 
    <input type="button" value="Search" id="butSearch" class="btn green" /> 
   
 
    </div> 

 
  
<div id="map">
    
        </div> 
        <div>
                Latitude: <input class="longText floated" name="latitude" type="text" readonly="true" id="lblLat"/>
   
            Longitude: <input class="longText floated" name="longitude" type="text" readonly="true" id="lblLon" />
              <div style="clear:both"></div>
        </div> 
            </div>

        <div style="clear:both"></div> 
        </li>
           </ul>
        <p>
            <input type="submit" value="Create golf course" class="btn green" />
        </p>
 

<% } %>



</div>
 
<div>
</div>
    
    <div class="smallColumn">
	<%Html.RenderPartial("StandardRightColumn"); %>
    	  	
   
</div>
<div class="clear">
</div>
  
</asp:Content>

