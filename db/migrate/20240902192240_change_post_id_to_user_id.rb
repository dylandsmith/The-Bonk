class ChangePostIdToUserId < ActiveRecord::Migration[7.0]
  def change
    rename_column :mentions, :post_id, :user_id
  end
end
