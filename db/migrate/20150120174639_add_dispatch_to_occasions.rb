class AddDispatchToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :dispatch_mode, :boolean
  end
end
