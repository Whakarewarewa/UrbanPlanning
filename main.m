API_KEY='...';

n=4;

places_of_interest=cell(n,1);    
coordinates=cell(n,1);

for i=1:n
    places_of_interest{i}=input('Enter address please: ','s');
    
    coordinates{i}=GoogleAddressToGeocode(places_of_interest{i},API_KEY);
end


CreateMarkersJS(coordinates);

web('GoogleMapPloter.html')



C=CreateMatrixC(coordinates, API_KEY);



