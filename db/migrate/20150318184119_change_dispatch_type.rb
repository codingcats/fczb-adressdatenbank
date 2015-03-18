class ChangeDispatchType < ActiveRecord::Migration
  def change
    remove_column :occasions, :dispatch_mode, :boolean
    add_column :occasions, :dispatch_mode, :integer, default: 0
  end
end
