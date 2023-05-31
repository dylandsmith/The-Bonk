class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year_released
      t.integer :budget
      t.float :worldwide_gross

      t.timestamps
    end
  end
end
