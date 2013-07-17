# myface cookbook

# Requirements
  - Chef 11.04 or higher
  - CentOS 6.3

# Usage
Example cookbook written to show Application Cookbook pattern

# Attributes
None (yet)

# Recipes
default.rb
  - Creates myface users
  - Installs MySQL
  - Creates MySQL schema, seeds schema with test data
  - Installs Apache & Mod PHP
  - Installs the php-mysql library
  - Disables Apache Default Website
  - Configures Apache for MyFace
  - Deploys MyFace

# Author

Author:: Bradford White(bwhite@24hourfit.com)
