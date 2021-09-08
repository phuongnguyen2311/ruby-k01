class AddschoolcolToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :year, :integer
    add_column :users, :school, :string
  end
end
