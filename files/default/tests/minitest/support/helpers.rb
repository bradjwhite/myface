module Helpers
  module Myface
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources

  # This function returns an array of all tables in the myface database
    def myface_tables
      require 'mysql'
      connection = ::Mysql.new node['myface']['database']['host'],
                               node['myface']['database']['username'],
                               node['myface']['database']['password']
      mfts = connection.select_db(node['myface']['database']['dbname']).list_tables
    end

  end
end
