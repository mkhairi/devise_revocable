# DeviseRevocableSession

A module for devise to revoke sessions.

This is borrowed heavily from: https://github.com/mkhairi/devise_revocable and https://www.jonathanleighton.com/articles/2013/revocable-sessions-with-devise/.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise_revocable_session'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install devise_revocable_session
```

## Usage

Install using the generator

```bash
$ rails g devise_revocable_sessions
```

Add `:revocable_session` to your model's devise declaration.

## Development

### Making Changes

1. Clone or fork the repository
2. Create a feature branch for your changes
3. Run `bundle install`
4. Make your changes
6. Test the gem locally
    * Run `gem build *.gemspec` to build the gem locally
    * Run `gem install --local devise_revocable_session-X.X.X.gem` to install the gem locally
7. Make a pull request back to this repository

### Releasing

1. Make sure the `lib/devise_revocable_session/version.rb` file is updated with a new version
2. Run `git tag vX.X.X && git push --tag`
3. Run `gem build *.gemspec`
4. Run `gem push *.gem` to push the new version to RubyGems
5. Run `rm *.gem` to clean up your local repository

To set up your local machine to push to RubyGems via the API, see the [RubyGems documentation](https://guides.rubygems.org/publishing/#publishing-to-rubygemsorg).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dispatchitinc/devise_revocable_session. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the DeviseRevocableSession project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Copyright

Copyright (c) 2022 Dispatch. See [MIT License](LICENSE.txt) for further details.
