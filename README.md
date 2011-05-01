# Ramaze.net

This repository contains the source code of the Ramaze website powered by Zen as well as
a copy of the user guide generated using Sphinx.

## Installation

In order to run this website you'll need to have a copy of Zen >= 0.2.5 and RDiscount.
These can be installed as following:

    $ gem install zen rdiscount

Once Zen is installed you should migrate the database:

    $ rake db:migrate             # Creates the database structure
    $ rake db:user                # Inserts a default user with a random password
    $ rake theme:migrate[ramaze]  # Inserts all the data required by the theme

Once this is done you can go to http://hostname.tld/admin to log in.

## Code blocks

This theme ships with a small "hack" that allows you to use Github like code blocks that
look like the following:

    ```LANGUAGE
    Code goes in here
    ```

This makes it easier for the syntax highlighter (Highlight.js) to highlight the code as
it's code detection feature usually uses the wrong language.

## License

All code used for the website is licensed under the same license as Ramaze: the Ruby 
license.
