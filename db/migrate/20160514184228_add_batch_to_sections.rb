class AddBatchToSections < ActiveRecord::Migration
  def change
    add_column :sections, :batch_id, :integer
  end
end
