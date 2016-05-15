class AddSectionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :section_id, :integer
  end
end
