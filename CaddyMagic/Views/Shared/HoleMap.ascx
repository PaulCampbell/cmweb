<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CaddyMagic.Domain.Hole>" %>
<script type="text/javascript">
var locations_array = []

     function mapLoad() {
        if (GBrowserIsCompatible()) {
            var map = new GMap2(document.getElementById("map"));
            map.addControl(new GSmallMapControl());
            map.addControl(new GMapTypeControl());
          var centre =   SetMapCentre(features,mapCentreLat, mapCentreLong)
            var center = new GLatLng(centre[0], centre[1]);
            map.setCenter(center, 17);
            map.setMapType(G_SATELLITE_MAP);
          
            for (i=0;i<features.length;i++)
                {
                    
              
                   AddViewMarker(map, features[i],features)  ;
                }


            }
    }

   
    var mapCentreLong = -1.49656
    var mapCentreLat = 53.83312
    var features = new Array();
    <% foreach (var f in Model.features)
   {
       Response.Write(String.Format("var f{3} = {{	featureType : '{0}',	latitude : {2},	longitude : {1}    }};  features.push(f{3});", f.featuretype.Name, f.longitude, f.latitude, f.Id));
   } %>

  
  
</script>

   
    <div style="width:47%; float:left; font-weight:bold;">Par: <%=Model.par.ToString() %></div>   
     <div style="width:47%; float:left;font-weight:bold;">Stroke index: <%if(Model.strokeIndex== 0) { %> - <%} else {Response.Write(Model.strokeIndex.ToString()); }%></div>
<div style="clear:both; padding-bottom:4px"></div>
<div id="map">
    
</div> 

 <script>
     SetMapCentre(features);
     mapLoad();
 </script>