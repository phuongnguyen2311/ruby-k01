class LovesToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :loves, :text
  end
end
