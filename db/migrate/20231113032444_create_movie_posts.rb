class CreateMoviePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_posts do |t|
      t.integer :user_id
      t.integer :movie_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
