module a4g.common.restinterface;

import vibe.web.rest;
import vibe.data.json;

struct DataEntry
{
    string type;
    Json payload;
}

interface A4GWebInterface
{
    @method(HTTPMethod.POST)
    void storeData( string key, DataEntry data );

    @method(HTTPMethod.GET)
    DataEntry[] getData( string key );
}
