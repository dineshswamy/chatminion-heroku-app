class CreateMessageOptions < ActiveRecord::Migration
  def change
    create_table :message_options do |t|
      t.integer :message_id
      t.text :options_id

      t.timestamps
    end
  end
end
