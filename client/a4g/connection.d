module a4g.connection;

import a4g.common;

import vibe.web.rest;
import vibe.data.json;

template typeName( T )
{
    static if( __traits( compiles, __traits( identifier, T ) ) )
        enum typeName = __traits( identifier, T );
    else
        enum typeName = T.stringof;
}

struct A4GConnection
{
public:
    @disable this();
    this( string connectionUrl )
    {
        client = new RestInterfaceClient!A4GWebInterface( connectionUrl );
    }

    void store( T )( string key, T data )
    {
        DataEntry entry;
        entry.type = typeName!T;
        entry.payload = data.serializeToJson();
        client.store( key, entry );
    }

    T[] retrieve( T )( string key )
    {
        import std.array: appender;

        auto results = appender!(T[]);
        auto entries = client.retrieve( key );

        foreach( entry; entries )
            if( entry.type == typeName!T )
                results ~= entry.payload.deserializeJson!T;

        return results.data;
    }

private:
    RestInterfaceClient!A4GWebInterface client;
}
