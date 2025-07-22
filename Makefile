.PHONY: all release compile test clean doc dialyzer

PROJECT = lhttpc

REBAR := rebar3
DIALYZER = dialyzer

APPS = kernel stdlib sasl inets ssl public_key crypto compiler

all: compile

compile:
	$(REBAR) compile

doc:
	$(REBAR) edoc

test:	compile
	$(REBAR) eunit

release: all dialyze test
	$(REBAR) release

clean:
	$(REBAR) clean

dialyzer:
	@$(REBAR) dialyzer
