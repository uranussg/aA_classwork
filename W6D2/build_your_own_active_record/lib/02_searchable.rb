require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ? " }.join("AND ")
    values = params.values
    datas = DBConnection.execute(<<-SQL, values)
    SELECT
      *
    FROM
      #{table_name}
    WHERE
      #{where_line}
    SQL
    datas.map { |data| self.new(data)}
  end
end

class SQLObject
  extend Searchable
  # Mixin Searchable here...
end
