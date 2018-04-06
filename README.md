This is the old flathub.org website
===================================

The new site can be found at https://github.com/flathub/linux-store-frontend .

Setup and deployment instructions
---------------------------------

To set up middleman locally on Fedora:

    dnf install ruby rubygems rubygem-bundler rubygem-json

In the git checkout, do a `bundle install`. This installs all 
the needed modules in their appropriate vesions.

Add the middleman binary location (probably ~/bin) to $PATH.

To run a local web server to test the site:

    bundle exec middleman server

Edit the haml/scss files and commit your changes, pushing to 
origin/master.

To deploy, run:

    bundle exec middleman build
    bundle exec middleman deploy

The deploy command pushes an updated version of the site to 
the `gh-pages` branch. A flatpak sysadmin must then be 
called upon to update the live site.
