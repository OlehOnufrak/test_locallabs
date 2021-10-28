require 'mysql2'
require 'pry'

module MySqlServer
  module Database
    class Connect
      attr_reader :mysql_client, :table, :table_column

      def initialize(table, table_column)
        @table = table
        @table_column = table_column
      end

      def fetch_all
        perform_mysql_operation do
          result = mysql_client.query("SELECT * from #{table}")

          result.entries
        end
      end

      def fetch_one(id)
        perform_mysql_operation do
          result = mysql_client.query("SELECT * from #{table} WHERE #{table_column}=#{id}")
          result.entries
        end
      end

      private

      def connect_to_db
        host = 'db09'
        username = 'loki'
        password = 'v4WmZip2K67J6Iq7NXC'
        database = 'applicant_tests'

        Mysql2::Client.new(username: username, password: password, database: database, host: host)
      end

      def perform_mysql_operation
        raise ArgumentError, 'No block was given' unless block_given?

        begin
          @mysql_client = connect_to_db

          yield
        rescue StandardError => error
          raise error
        ensure
          mysql_client&.close
        end
      end
    end
  end
end
