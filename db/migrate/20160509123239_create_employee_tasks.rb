class CreateEmployeeTasks < ActiveRecord::Migration
  def change
    create_table :employee_tasks do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
