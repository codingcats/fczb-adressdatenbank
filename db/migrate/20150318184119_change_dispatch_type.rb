class ChangeDispatchType < ActiveRecord::Migration
  def change
    delete_column :occasions, :dispatch_mode, :boolean
    add_column :occasions, :dispatch_mode, :integer, default: 0
  end
end
