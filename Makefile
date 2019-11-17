all:
	rebar3 get-deps	
	rebar3 compile
	cd demos; make
