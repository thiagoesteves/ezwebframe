-module(svg1).
-export([start/1]).

start(Browser) ->
    receive
        {From, websocketReady} ->
            From ! [{cmd,add_canvas},{tag,svg},{width,180},{height,120}],
            running(From, 10, 10)
    after 1000 ->
        start(Browser)
    end.


running(Browser, X, Y) ->
    receive
	{Browser,{struct,[{clicked,<<"draw rectangle">>}]}} ->
	    Browser ! [{cmd,add_svg_thing},{type,rect},
		       {rx,3},{ry,3},{x,X},{y,Y},{width,100},{height,50},
		       {stroke,blue},{'stroke-width',2},{fill, red}],
	    running(Browser, X+10, Y+10)
    end.
