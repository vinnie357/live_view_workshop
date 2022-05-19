#!make
.PHONY: help console setup server test server-prod

help:
	@grep ": \#" ${MAKEFILE_LIST} | column -t -s ':' | sort

console: ## Opens the App console.
	iex -S mix

setup: ## Setup the App.
	mix deps.get
	mix compile
	mix format

server: ## Start the App server.
	PORT=4000 mix phx.server

server-prod: ## Start the App server in prod env.
server-prod: MIX_ENV=prod
server-prod: PORT=4000
server-prod: SECRET_KEY_BASE=foobar
server-prod:
	mix phx.digest
	mix phx.server

test: ## Runs the test suite.
	mix format
	mix test
