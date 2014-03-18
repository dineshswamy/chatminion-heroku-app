class AddColumnForMessages < ActiveRecord::Migration
  def change
  	add_column :messages,:tag,:string
  end
end