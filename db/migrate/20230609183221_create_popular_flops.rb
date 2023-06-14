class CreatePopularFlops < ActiveRecord::Migration[7.0]
  def change
    create_table :popular_flops do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
