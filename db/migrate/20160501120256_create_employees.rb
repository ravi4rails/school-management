class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.string :email
      t.string :contact
      t.string :address
      t.date :date_of_birth
      t.integer :age
      t.date :date_of_joining
      t.string :qualification
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
