-module(chat1).
-export([start/1]).

start(Browser) ->
    receive
        {From, websocketReady} ->
            running(From, [])
    after 1000 ->
        start(Browser)
    end.

running(Browser, L) ->
    receive
	{Browser, {struct, [{join,Who}]}} ->
	    Browser ! [{cmd,append_div},{id,scroll}, 
		       {txt, list_to_binary([Who, " joined the group", "<br>"])}],
	    L1 = [Who,"<br>"|L],
	    Browser ! [{cmd,fill_div}, {id,users},
		       {txt, list_to_binary(L1)}],
	    running(Browser, L1);
	{Browser,{struct, [{entry,<<"tell">>},{txt,Txt}]}} ->
	    Browser ! [{cmd, append_div}, {id,scroll},
		       {txt,list_to_binary([" > ", Txt, "<br>"])}],
	    running(Browser, L);
	X ->
	    io:format("chat received:~p~n",[X])
    end,
    running(Browser, L).


