# Load the theme before all packages so that it shows up in the settings manager.
require __DIR__('../vendor/theme/ramaze/lib/ramaze')
require __DIR__('../vendor/plugin/markup')

# Load all core extensions that ship with Zen. 
require 'zen/package/all'

##
# All custom gems can go in here.
#
# require 'rdiscount'
# require 'foobar'
require 'rdiscount'
