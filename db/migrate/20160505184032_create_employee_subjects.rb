class CreateEmployeeSubjects < ActiveRecord::Migration
  def change
    create_table :employee_subjects do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true
      t.integer :department_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
