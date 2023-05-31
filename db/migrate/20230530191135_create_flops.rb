class CreateFlops < ActiveRecord::Migration[7.0]
  def change
    create_table :flops do |t|

      t.timestamps
    end
  end
end
