module a4g.server.restimpl;

import a4g.common.restinterface;

import vibe.web.rest;
import vibe.data.json;
import vibe.db.mongo.mongo;

MongoClient client;
MongoDatabase db;

shared static this()
{
    client = connectMongoDB( "127.0.0.1" );
    db = client.getDatabase( "a4g" );
}

class A4GWebImplementation : A4GWebInterface
{
    @method(HTTPMethod.POST)
    void store( string key, DataEntry data )
    {
        auto collection = db[ key ];
        collection.insert( data );
    }

    @method(HTTPMethod.GET)
    DataEntry[] retrieve( string key )
    {
        import std.array: array;

        auto collection = db[ key ];
        return collection.find!DataEntry().array();
    }
}
