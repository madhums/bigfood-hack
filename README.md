## Bigfood Backend

A backend for Bigfood project. Built with [RubyOnRails](https://rubyonrails.org/).

## Requirements

- ruby 3.3.0 (use [rbenv](https://github.com/rbenv/rbenv) to manage ruby versions)
- postgres >= 14.5
- nodejs >= 20.x

## Development

Clone the repo

```sh
bundle install
rake db:create
rake db:migrate
cp .env.development.local.erb .env.development.local # replace necessary values
# also create a copy for .env.test.local
bin/dev
```

We use [standardrb](https://github.com/standardrb/standard) for code linting and formatting.

Install the editor extension so that code is formatted as you type
