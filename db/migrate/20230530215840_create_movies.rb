class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year_released
      t.integer :budget
      t.float :worldwide_gross
      t.string :imdb_id
      t.string :description
      t.string :content_rating
      t.integer :movie_length
      t.float :rating
      t.string :trailer
      t.string :plot
      t.string :banner

      t.timestamps
    end
  end
end
