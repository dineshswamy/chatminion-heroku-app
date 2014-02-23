class UniqueUser < ActiveRecord::Migration
  def change
  	#migration to set users email id as unique
  	add_index :users , :email , unique: true
  end
end
