require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      data = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
      SQL

      @columns = data.first.map(&:to_sym)
    end
    @columns
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        # instance_variable_get("@#{column}".to_sym)
        attributes[column]
      end

      define_method("#{column}=".to_sym) do |value|
        # instance_variable_set("@#{column}".to_sym, value)
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name.tableize
    # ...
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
    # ...
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
    SELECT 
      *
    FROM
      #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
    # ...
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
    SELECT
      *
    FROM
      #{table_name}
    WHERE
      id = ?
    SQL

    result.empty? ? nil : self.new(result.first)
    # ...
  end

  def initialize(params = {})
    params.each do |k, v|
      raise "unknown attribute '#{k}'" unless self.class.columns.include?(k.to_sym)
      self.send("#{k}=".to_sym, v) 
    end
    # ...
  end

  def attributes
    # if @attributes.nil?
    #   @attributes = {}
    #   columns.each do |column|
    #     @attributes[column] = @column
    #   end
    # end
    @attributes ||= {}
    # ...
  end

  def attribute_values
    self.class.columns.map do |column|
      self.send(column)
    end
    # ...
  end

  def insert

    col_names = self.class.columns.join(',')

    str = (["?"] * self.class.columns.length).join(',')
    
    DBConnection.execute(<<-SQL, self.attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{str})
    SQL
    # id = DBConnection.get_last_row(<<-SQL)
    #   SELECT 
    #     id
    #   FROM
    #   #{self.class.table_name}
    # SQL
    # self.id = id    
    
    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.map { |column|  "#{column} = ?" }.join(',')
    DBConnection.execute(<<-SQL, self.attribute_values, self.id)
    UPDATE
      #{self.class.table_name}
    SET
      #{col_names}
    WHERE
      id = ?
    SQL

    # ...
  end

  def save
    self.id.nil? ? self.insert : self.update
    # ...
  end
end
