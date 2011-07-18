<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<CaddyMagic.Domain.GolfCourse>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
var map ;

    $(document).ready(function () {
        $('.CancelButton').live('click', function(){
            RemoveEditMarker(map,$(this).attr("href") -1);
            return false;
        });


        $('#txtAddHole').click(function () {
              $.get('/GolfCourse.aspx/AddHole', {courseID:<%=Model.Id %> },
                   function (data) {
                       $('#HoleEdit').html(data);
                   });
           
                   return false;
           
        });

        $('.HoleTitle').click(function(){
           
              $.get('/GolfCourse.aspx/EditHole', {holeID:$(this).attr("href") },
                   function (data) {
                       $('#HoleEdit').html(data);
                   });
           
                   return false;
        });
    });

 

//    function jQueryLoad(){
//        
//        var latlong = SetMapCentre(features,<%= Model.latitude  %>,<%= Model.longitude  %>);
//        
//   
//     var map =  $("#map").gMap({ markers: features,
//                      maptype:G_SATELLITE_MAP ,
//                      zoom: zoomLevel,
//                      latitude:latlong[0]  ,
//                      longitude:latlong[1] });


//	            GEvent.addListener(map, 'click', function (overlay, point) {
//	                if (overlay) {
//	                    // map.removeOverlay(overlay);
//	                 //   alert('overlayclicked' + overlay.toString);
//	                } else if (point) {
//	                    var matchll = /\(([-.\d]*), ([-.\d]*)/.exec(point);
//	                    var message = "";
//	                    if (matchll) {
//	          
//	                        var lat = parseFloat(matchll[1]);
//	                        var lon = parseFloat(matchll[2]);
//	                        lat = lat.toFixed(6);
//	                        lon = lon.toFixed(6);
//	                        message = "geotagged geo:lat=" + lat + " geo:lon=" + lon + " ";
//	                       var f = new Object();
//                           f.longitide = lon;
//                           f.latitude = lat;
//                           features.push(f);
//	                        var marker = new GMarker(new GLatLng(lat, lon), { draggable: true });
//	                        map.addOverlay(marker);
//	                        alert('overlayclicked' + overlay.toString);
//	                    } else {
//	                        message = "<b>Error extracting info from</b>:" + point + "";

//	                    }

//	                }
//	            });

//   	        }
        
           var features;

 function load() {
	        if (GBrowserIsCompatible()) {
	             map = new GMap2(document.getElementById("map"));
	            map.addControl(new GSmallMapControl());
	            map.addControl(new GMapTypeControl());
	            var center = new GLatLng(<%=Model.latitude %>,<%=Model.longitude %>);
	            map.setCenter(center, 17);
                map.setMapType(G_SATELLITE_MAP);

                  for (i=0;i<features.length;i++)
                {
              
                   AddEditMarker(map, features[i],features)  ;
                }

	                    	          
	            GEvent.addListener(map, 'click', function (overlay, point) {
	                if (overlay) {
	                 
                    
	                } else if (point) {
	                    var matchll = /\(([-.\d]*), ([-.\d]*)/.exec(point);
	                
	                    if (matchll) {
	                      var lat = parseFloat(matchll[1]);
	                        var lon = parseFloat(matchll[2]);
	                        lat = lat.toFixed(6);
	                        lon = lon.toFixed(6);
	                       var feature = new Object();
                           feature.latitude = lat;
                           feature.longitude = lon;
                           features.push(feature);
	                      
                         AddEditMarker(map, feature,features);
                          
                          
	           
	                    } else {
	                        message = "<b>Error extracting info from</b>:" + point + "";

	                    }

	                }
	            });

                   

	        }
	    }

</script>

     <div class="mainContent">

<h1>Map a golf course</h1>

<div  class="editor-label"><strong>Course name</strong> </div> <%=Model.name %> <br /> <br />

<div class="editor-label"><strong>Course description</strong>  </div> <%=Model.description %> <br /> <br />
    <ul id="holesList">
    <% foreach (CaddyMagic.Domain.Hole h in Model.holes)
       { %>
        <li>
            <h3><a href="<%= h.Id %>" class="HoleTitle">Hole <%= h.holeNumber %></a></h3>

        </li>
        <%} %>
    </ul>
    <div style="clear:both"> </div>
    <a href="#" id="txtAddHole">Add hole</a>

    <div id="HoleEdit">
    
    
    </div>

 </div>
  
    <div class="smallColumn">
	<%Html.RenderPartial("StandardRightColumn", Model.Id); %>
    	  	
   
</div>
<div class="clear">
</div>

</asp:Content>

