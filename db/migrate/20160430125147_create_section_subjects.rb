class CreateSectionSubjects < ActiveRecord::Migration
  def change
    create_table :section_subjects do |t|
      t.references :section, index: true, foreign_key: true
      t.references :course_subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
