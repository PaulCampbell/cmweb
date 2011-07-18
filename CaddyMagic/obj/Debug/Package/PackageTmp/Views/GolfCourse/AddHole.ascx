<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<CaddyMagic.Domain.Hole>" %>
    <div class="mapInput">
    <% using (Html.BeginForm()) {%>
    <%= Html.ValidationSummary(true) %>
       <ul class="addHoleForm">
           <li>
        <div class="editor-label">
            Hole number 
        </div>
        <div class="editor-field">
          

        <%=Model.holeNumber %>
         
        </div>
              <%= Html.ValidationMessageFor(model => model.holeNumber) %>
            </li>
              <li>
        <div class="editor-label">
            Par
        </div>
        <div class="editor-field">

            <select id="par">
                <option <% if (Model.par == 3) {%> selected  <% }; %> value="3">3</option>
                <option value="4" <% if (Model.par == 4) {%> selected  <% }; %>>4</option>
                <option value="5" <% if (Model.par == 5) {%> selected  <% }; %>>5</option>
            </select>
         
        </div>
        </li>
              <li>
           <div class="editor-label">
            Stroke index
        </div>
        <div class="editor-field">
            <select id="strokeIndex">
                 <option value="0" <% if (Model.strokeIndex == 0) {%> selected <%} %>>N/A</option>
                <option value="1"<% if (Model.strokeIndex == 1) {%> selected <%} %>>1</option>
                <option value="1"<% if (Model.strokeIndex == 2) {%> selected <%} %>>2</option>
                <option value="1"<% if (Model.strokeIndex == 3) {%> selected <%} %>>3</option>
                <option value="4"<% if (Model.strokeIndex == 4) {%> selected <%} %>>4</option>
                <option value="5"<% if (Model.strokeIndex == 5) {%> selected <%} %>>5</option>
                <option value="6"<% if (Model.strokeIndex ==6) {%> selected <%} %>>6</option>
                <option value="7"<% if (Model.strokeIndex == 7) {%> selected <%} %>>7</option>
                <option value="8"<% if (Model.strokeIndex == 8) {%> selected <%} %>>8</option>
                <option value="9"<% if (Model.strokeIndex == 9) {%> selected <%} %>>9</option>
                <option value="10"<% if (Model.strokeIndex == 10) {%> selected <%} %>>10</option>
                <option value="11"<% if (Model.strokeIndex == 11) {%> selected <%} %>>11</option>
                <option value="12"<% if (Model.strokeIndex == 12) {%> selected <%} %>>12</option>
                <option value="13"<% if (Model.strokeIndex == 13) {%> selected <%} %>>13</option>
                <option value="14"<% if (Model.strokeIndex == 14) {%> selected <%} %>>14</option>
                <option value="15"<% if (Model.strokeIndex == 15) {%> selected <%} %>>15</option>
                <option value="16"<% if (Model.strokeIndex == 16) {%> selected <%} %>>16</option>
                <option value="17"<% if (Model.strokeIndex == 17) {%> selected <%} %>>17</option>
                <option value="18"<% if (Model.strokeIndex == 18) {%> selected <%} %>>18</option>
            </select>

         
        </div>
            
            </li>

            </ul>

        
        <div style="clear:both"></div>
   <%} %>
 
      <div style="padding:20px 0; font-weight:normal;">  Click on the map to add features to this hole - start by adding a tee...</div>
      <div id="map">
            
            </div>
  </div> 

  <script>
      
      <%if (ViewData["feats"] != null) { %>
       var features = <%= ViewData["feats"]%>;
       var overlays = new Array();
       for (i = 0; i < features.length; i++) {
            var o = new GMarker(center, { draggable: true });
            overlays.push(o);
        }
      <%} %>
      var zoomLevel = 17;
      <%if (Model.par > 3){ %>
      zoomLevel = 16;
      <%}%>

  
      load();
      BindMarkerActions();
  </script>