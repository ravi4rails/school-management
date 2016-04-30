class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :contact
      t.text :address
      t.date :date_of_birth
      t.date :admission_date
      t.date :enrollment_date
      t.string :admission_number
      t.string :enrollment_number
      t.string :category
      t.string :relegion
      t.integer :course_id
      t.references :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
