% GoogleAddressToGeocode look up the latitude and longitude of a an address
function [coordinates] = GoogleAddressToGeocode(address,API_KEY)

% Manual: https://developers.google.com/maps/documentation/geocoding/intro?hl=en

% Input : address - '1217 fayettevelle St., Durham,NC'
%         API_KEY - your google API KEY
% Return: coordinates =[latitude longitude]



% Check to see if address is a valid string
if isempty(address) || ~ischar(address) || ~isvector(address)
    error('Invalid address provided, must be a string');
end


%replace white spaces in the address with '+'
address = regexprep(address, ' ', '+');

queryUrl = sprintf('https://maps.googleapis.com/maps/api/geocode/json?address=%s&key=%s', address,API_KEY);

try
    json_data=urlread(queryUrl);
catch 
    error('Error, could not reach server, is it a valid URL %s?', queryUrl);
end
   
coordinates = ParseGoogleMapsJSON(json_data);

end

% Function to parse the XML response from Google Maps
function [coordinates] = ParseGoogleMapsJSON(json_data)
    map_data=JSON.parse(json_data);
    coordinates=[map_data.results{1,1}.geometry.location.lat map_data.results{1,1}.geometry.location.lng] ;
end


