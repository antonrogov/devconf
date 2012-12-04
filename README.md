# DevConf

Simple development flow helper that:

* disables development.log
* adds STDOUT logging instead
* accepts `LOG_LEVEL` env variable to set logging level
  * uses DEBUG log level by default for:
    * `rails *` commands
    * app servers (unicorn and thin)
    * DJ workers (`rake jobs:work` command)
  * uses ERROR log level by default for everything else
* loads .env the same way as foreman does

## Installation

Add this line to your application's Gemfile:

    gem 'devconf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devconf

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
