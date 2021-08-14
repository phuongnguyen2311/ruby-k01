class ChangepostIdColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :post_id, :micropost_id
  end
end
