module a4g;
public:
import a4g.connection;

void main()
{
    import std.stdio;

    auto conn = A4GConnection( "http://localhost:8080/" );

    foreach( i; 0..10 )
        conn.store( "int", i );

    writeln( "Done storing." );

    foreach( i; conn.retrieve!int( "int" ) )
        writeln( "Int: ", i );

    writeln( "Done retrieving." );
}
