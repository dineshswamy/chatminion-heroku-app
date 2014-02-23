class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :channel_id

      t.timestamps
    end
  end
end
