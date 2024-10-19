class AddMentionHandleToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :handle, :string
  end
end
