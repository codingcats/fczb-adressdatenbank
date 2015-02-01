class AddDeletedAtToModels < ActiveRecord::Migration
  def change
    add_column :contacts, :deleted_at, :datetime
    add_index :contacts, :deleted_at

    add_column :institutions, :deleted_at, :datetime
    add_index :institutions, :deleted_at

    add_column :occasions, :deleted_at, :datetime
    add_index :occasions, :deleted_at
  end
end
