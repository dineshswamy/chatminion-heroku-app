class ColumnNameChange < ActiveRecord::Migration
  def change
  	rename_column :usercontacts , :friend_id , :relator_id
  end
end
