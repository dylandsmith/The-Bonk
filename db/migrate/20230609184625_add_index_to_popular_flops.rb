class AddIndexToPopularFlops < ActiveRecord::Migration[7.0]
  def change
    add_index :popular_flops, :movie_id
  end
end
