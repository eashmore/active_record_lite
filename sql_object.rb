require_relative 'db_connection'
require 'active_support/inflector'

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    cols[0].map!(&:to_sym)
    @columns = cols[0]
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || name.underscore.pluralize
  end
end
