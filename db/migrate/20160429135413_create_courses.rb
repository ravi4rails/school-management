class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :duration
      t.references :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
