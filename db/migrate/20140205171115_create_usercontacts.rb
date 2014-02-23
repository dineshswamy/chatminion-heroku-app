class CreateUsercontacts < ActiveRecord::Migration
  def change
    create_table :usercontacts do |t|
      t.string :user_id
      t.string :friend_id
      t.string :rel_status

      t.timestamps
    end
  end
end
