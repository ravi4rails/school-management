class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :date_of_birth
      t.string :relation
      t.string :contact
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
