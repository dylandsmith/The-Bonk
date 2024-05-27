class CreateMentions < ActiveRecord::Migration[7.0]
  def change
    create_table :mentions do |t|
      t.integer :mentionable_id
      t.string :mentionable_type

      t.timestamps
    end
    add_index :mentions, :mentionable_id
  end
end
