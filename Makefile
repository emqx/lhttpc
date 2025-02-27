.PHONY: all release compile test clean rel doc build-plt dialyzer

PROJECT = lhttpc

REBAR := rebar3
DIALYZER = dialyzer

APPS = kernel stdlib sasl inets ssl public_key crypto compiler

all: compile

compile:
	$(REBAR) compile

test:	compile
	$(REBAR) eunit

release: all dialyze test
	$(REBAR) release

clean:
	$(REBAR) clean

build-plt: compile
	@$(DIALYZER) --build_plt --output_plt .$(PROJECT).plt \
		--apps $(APPS)

dialyzer:
	@$(DIALYZER) --fullpath  --src ./src \
		--plt .$(PROJECT).plt --no_native \
		-Werror_handling  #-Wrace_conditions
