% Function create markers.js file which is used within GoogleMapPloter.html
% as source of markers coordinates

function CreateMarkersJS( coordinates )
% coordinates={[lat,lng];[lat,lng];[lat,lng]}


%var markers = [{lat: 37.769, lng: -122.446},{lat: 58.769, lng: -142.446}];

markers='var markers = [';
for i=1:length(coordinates)
    
    currect_coordinate=coordinates{i};
    
    marker=strcat('{lat: ',num2str(currect_coordinate(1)),', lng: ',num2str(currect_coordinate(2)),'}');
    if (i==1)
        markers=strcat(markers,marker);
    else
        markers=strcat(markers,',',marker);
    end
end

markers=strcat(markers,'];')

fid = fopen( 'markers.js', 'w' );
fprintf( fid, '%s', markers);
fclose(fid);

end

