class AddUserViewedToMention < ActiveRecord::Migration[7.0]
  def change
    add_column :mentions, :user_has_viewed, :boolean
  end
end
