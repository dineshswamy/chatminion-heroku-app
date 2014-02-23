class RecreateTables < ActiveRecord::Migration
  def change
  	create_table :usercontacts do |t|
      t.string :user_id
      t.string :friend_id
      t.string :rel_status

      t.timestamps
  	end
      create_table :users do |t|
      t.string :email
      t.string :channel_id

      t.timestamps
     end
      add_index :users , :email , unique: true
  end
end
