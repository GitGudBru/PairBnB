class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :integer, default: 0
  end
end
