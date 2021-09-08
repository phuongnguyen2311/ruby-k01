class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_comment_id
      t.integer :post_id
      t.text :content

      t.timestamps
    end
    add_index :comments, [:user_comment_id, :post_id]
  end
end
