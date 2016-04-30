class AddAddressFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :country, :string
  end
end
