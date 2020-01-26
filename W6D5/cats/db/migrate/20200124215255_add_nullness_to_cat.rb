class AddNullnessToCat < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:cats, :name, true)
    change_column_null(:cats, :birth_date, true)
    change_column_null(:cats, :sex, true)
    change_column_null(:cats, :color, true)
  end
end
