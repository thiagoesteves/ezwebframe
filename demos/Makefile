## set the paths for a default setup

all: beam
	erl -pa ../_build/default/lib/cowboy/ebin\
            -pa ../_build/default/lib/ranch/ebin\
            -pa ../_build/default/lib/cowlib/ebin\
            -pa ../_build/default/lib/ezwebframe/ebin\
	    -pa ./ebin\
            -s ezwebframe_demos start

beam: 
	erlc -o ebin *.erl */*.erl

clean:
	rm -rf *~ *.beam *.tmp
