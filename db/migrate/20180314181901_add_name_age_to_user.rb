class AddNameAgeToUser < ActiveRecord::Migration[5.1]

	add_column :users, :name, :string 
	add_column :users, :age, :integer
  def change
  end
end
