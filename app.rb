require 'zen'

Ramaze.setup(:verbose => false) do
  gem 'rdiscount', ['~> 1.6.8']
end

# Load the configuration files
require __DIR__('config/config')

# Load the database configuration file
require __DIR__('config/database')

# Load all the routes
require __DIR__('config/routes')

require __DIR__('theme/ramaze')
require __DIR__('markup')

Zen.start
