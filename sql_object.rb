require_relative 'db_connection'
require 'active_support/inflector'

class SQLObject
  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || name.underscore.pluralize
  end
end
