%example

API_KEY = 'enter your api key';

from=GoogleAddressToGeocode('Kyiv, KPI',API_KEY)
to=GoogleAddressToGeocode('Kyiv, Teatralna',API_KEY)

distance=GoogleMapsDistance(from,to,API_KEY)