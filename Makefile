test:
	bin/rake test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

check: lint test

.PHONY: test
