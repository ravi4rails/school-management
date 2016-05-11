class AddAvatarToStudents < ActiveRecord::Migration
  def change
    add_column :employees, :profile_picture, :string
    add_column :students, :profile_picture, :string
    add_column :users, :profile_picture, :string
  end
end
