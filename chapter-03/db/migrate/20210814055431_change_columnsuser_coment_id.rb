class ChangeColumnsuserComentId < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :user_comment_id, :user_id
  end
end
