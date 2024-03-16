class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      #t.integer :favoritable_id
      #t.string :favoritable_type
      t.integer :user_id
      t.references :favoritable, polymorphic: true, index: true
      t.timestamps
    end
    add_index :favorites, :favoritable_id
  end
end