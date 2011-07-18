




function AddEditMarker(map, feature, features) {
    var center = new GLatLng(feature.latitude, feature.longitude);

    var o = overlays[50];
    var marker;
    if (o) {
        marker = o;
    } else {
        marker = new GMarker(center, { draggable: true });
        overlays.push(marker);
    }

    var theFeature = 0;

    for (i = 0; i < features.length; i++) {
        if (features[i].longitude == feature.longitude && features[i].latitude == feature.latitude) {
            theFeature = i;
        }
    }

    GEvent.addListener(marker, "click", function () {
        marker.openInfoWindowHtml('<select name=feature' + theFeature.toString() + '><option value="1">Yellow Tee</option><option value="2">Red Tee</option><option value="3">White Tee</option><option value="4">Bunker</option><option value="5">Green</option><option value="6">Water hazard</option></select> <a href="#" class="actionButton SaveButton">Save</a> <a href="' + i + ' " class="CancelButton">Remove</a>');
    });
    map.addOverlay(marker);
    overlays.push(marker);
}

function AddViewMarker(map, feature, features) {
    var center = new GLatLng(feature.latitude, feature.longitude);
    var marker = new GMarker(center, { draggable: false });

  
    var img = "waterhazard.png";
    switch(feature.featureType)
        {
        case "Yellow Tee":
          img = "yellowtee.png";
          break;
        case "White Tee":
            img = "whitetee.png";
          break;
        case "Red Tee":
            img = "redtee.png";
          break;
        case "Green":
            img = "flag.png";
          break;
        case "Bunker":
           img = "bunker.png";
          break;
        case "Water Hazard":
            img = "waterhazard.png";
          break;
       
        }
//        alert(img);
    GEvent.addListener(marker, "click", function () {
        marker.openInfoWindowHtml('<img class="viewIcon" src="/Content/images/' + img + '" alt="' + feature.featureType + '" /><span style="color:#333333; display:block; position:relative; top:14px;">' + feature.featureType + "</span>");
    });
    map.addOverlay(marker);
}

function RemoveEditMarker(map, fIndex) {

    map.removeOverlay(overlays[fIndex]);
    return false;

}


function SetMapCentre(features,courseCentreLat, courseCentreLong) {
    var longLat = new Array(2);

    if (features.length > 0) {
        var tee;
        var green;
        var mapCentreLat;
        var mapCentreLong;
        for (i = 0; i < features.length; i++) {
            if (features[i].featureType == 'Green') {
                green = features[i];
            }
            if (features[i].featureType == 'Red Tee' || features[i].featureType == 'Yellow Tee' || features[i].featureType == 'White Tee') {
                tee = features[i];
            }
        }


        if (green && tee) {
            mapCentreLong = (green.longitude + tee.longitude) / 2;
            mapCentreLat = (green.latitude + tee.latitude) / 2;
        }
        else if (green) {
            mapCentreLong = green.longitude;
            mapCentreLat = green.latitude;
        }
        else if (tee) {
            mapCentreLong = tee.longitude;
            mapCentreLat = tee.latitude;
        }
        longLat[0] = mapCentreLat;
        longLat[1] = mapCentreLong;
    }
    else {
        longLat[0] = courseCentreLat;
        longLat[1] = courseCentreLong;
    }

    
    return longLat;

}