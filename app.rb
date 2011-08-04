require 'zen'
require 'ramaze/log/rotatinginformer'

Ramaze.setup(:verbose => false) do
  gem 'rdiscount', ['~> 1.6.8']
end

# Load the configuration files
require __DIR__('config/config')

# Load all our custom Rack middlewares
require __DIR__('config/middlewares')

# Load the database configuration file
require __DIR__('config/database')

# Load all the routes
require __DIR__('config/routes')

# Make sure that Ramaze knows where you are
Ramaze.options.roots.push(Zen.root)

# Load the database
Zen.init

# Load the theme before all packages so that it shows up in the settings manager.
require __DIR__('theme/ramaze')
require __DIR__('plugin/markup')

# Load all core extensions that ship with Zen.
require 'zen/package/all'

Zen.post_init
