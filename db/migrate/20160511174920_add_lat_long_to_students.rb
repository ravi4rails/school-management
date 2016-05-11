class AddLatLongToStudents < ActiveRecord::Migration
  def change
    add_column :students, :latitude, :float
    add_column :students, :longitude, :float
  end
end
