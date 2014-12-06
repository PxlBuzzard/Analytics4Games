module a4g.server.restimpl;

import a4g.common.restinterface;

import vibe.web.rest;
import vibe.data.json;

class A4GWebImplementation : A4GWebInterface
{
    @method(HTTPMethod.POST)
    void store( string key, DataEntry data )
    {

    }

    @method(HTTPMethod.GET)
    DataEntry[] find( string key )
    {
        return [];
    }
}
