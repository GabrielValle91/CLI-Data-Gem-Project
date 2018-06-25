# MoviesNearby

Welcome to MoviesNearby! This gem allows the user to enter a zip code to return a list of movies in theaters near that zip code. The user can then ask for more detail on a movie in the list.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'movies_nearby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install movies_nearby

## Usage

To use this gem, run the movies-nearby file in the bin folder. The user will be prompted to enter a zip code and a list of movies in theaters near you will be returned.
The user will then have the option of acquiring more detail about a movie in the list by entering the list number corresponding to the movie.
The user can exit the application at any time by entering 'exit'.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'GabrielValle91'/movies_nearby.
