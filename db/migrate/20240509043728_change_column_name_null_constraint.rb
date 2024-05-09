class ChangeColumnNameNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null :rooms, :name, false
  end
end
