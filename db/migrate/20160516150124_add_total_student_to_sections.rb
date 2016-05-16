class AddTotalStudentToSections < ActiveRecord::Migration
  def change
    add_column :sections, :total_students, :integer
  end
end
