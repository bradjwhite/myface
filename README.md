# myface cookbook

# Requirements
  - Chef 11.04 or higher
  - CentOS 6.3

# Usage
Example cookbook written to show Application Cookbook pattern

# Attributes
['myface']['database']['host'] - Host serving myface database
['myface']['database']['username'] - User for myface app to access db
['myface']['database']['password'] - password for myface app to access db
['myface']['database']['dbname'] - Name of myface db schema in mysql

['myface']['database']['seed_file'] - Name of file used to seed myface db

# Recipes
default.rb
  - Installs the full myface stack on a single node

database.rb
  - Installs MySQL
  - Creates MySQL schema, seeds schema with test data

webserver.rb
  - Installs Apache & Mod PHP
  - Installs the php-mysql library
  - Disables Apache Default Website
  - Configures Apache for MyFace
  - Deploys MyFace

# Author

Author:: Bradford White(bwhite@24hourfit.com)
