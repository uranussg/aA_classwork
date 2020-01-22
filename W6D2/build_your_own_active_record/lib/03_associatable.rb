require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
    # ...
  end

  def table_name
    self.class_name.underscore + 's'
    # ...
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = (options[:foreign_key] || (name.to_s + "_id").to_sym)
    @primary_key = (options[:primary_key] || :id)
    @class_name = (options[:class_name]  || name.to_s.camelcase)
    # ...
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = (options[:foreign_key] || (self_class_name.underscore + "_id").to_sym)
    @primary_key = (options[:primary_key] || :id)
    @class_name = (options[:class_name]  || name.to_s[0...-1].camelcase)
    # ...
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    bt = BelongsToOptions.new(name, options)
    self.assoc_options[name] = bt
    define_method(name) do 

      #join_class = options[class_name].model_class

      # data = DBconnection.execute(<<-SQL)
      # SELECT
      #   *
      # FROM 
      #   #{bt.table_name}
      # WHERE
      #   #{self.send(:foreign_key)} = #{bt.table_name.}
      # SQL

      # self.new(data.first)

      bt.model_class.where({bt.primary_key => self.send(bt.foreign_key)}).first
    end
    # ...
  end

  def has_many(name, options = {})
    self_class_name = self.to_s
    bt = HasManyOptions.new(name, self_class_name, options)
    define_method(name) do 

      # join_class = options[class_name].model_class

      # datas = DBconnection.execute(<<-SQL)
      # SELECT
      #   *
      # FROM 
      #   #{join_class}
      # WHERE
      #   #{self.send(:primary_key)} = #{bt.model_class.send(:foreign_key)}
      # SQL
      # datas.map { |data| self.new(data)}
      bt.model_class.where({bt.foreign_key => self.send(bt.primary_key)})
    end
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end
