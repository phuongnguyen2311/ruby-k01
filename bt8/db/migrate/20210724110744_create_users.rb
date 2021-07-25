class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :date_of_birth
      t.string :gender
      
      t.timestamps
    end
  end
end
