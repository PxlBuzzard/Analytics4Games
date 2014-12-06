module a4g.server.app;

import a4g.server.restimpl;

import vibe.http.router;
import vibe.http.server;
import vibe.web.rest;

shared static this()
{
    auto router = new URLRouter;
    router.registerRestInterface( new A4GWebImplementation );

    auto settings = new HTTPServerSettings;
    settings.port = 8080;
    listenHTTP( settings, router );
}
