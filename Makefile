#!make
.PHONY: help console setup server test

help:
	@grep ": \#" ${MAKEFILE_LIST} | column -t -s ':' | sort

console: ## Opens the App console.
	iex -S mix

setup: ## Setup the App.
	mix deps.get
	mix compile
	mix format

server: ## Start the App server.
	mix format
	PORT=4000 mix phx.server

test: ## Runs the test suite.
	mix format
	mix test
