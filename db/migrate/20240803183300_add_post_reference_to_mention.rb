class AddPostReferenceToMention < ActiveRecord::Migration[7.0]
  def change
    add_column :mentions, :post_id, :integer
  end
end
