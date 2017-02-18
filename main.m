API_KEY='....';

% array of addresses
% places_of_interest = 



% array of addresses coordinates
% coordinates = 


coordinates1=GoogleAddressToGeocode('Kyiv, KPI',API_KEY);
coordinates2=GoogleAddressToGeocode('Kyiv, Teatralna',API_KEY);


coordinates={coordinates1 coordinates2};


C=CreateMatrixC(coordinates, API_KEY)



