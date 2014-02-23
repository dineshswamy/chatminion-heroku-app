class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :user_message
      t.text :transform_pattern

      t.timestamps
    end
  end
end
