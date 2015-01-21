class RemoveTitleFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :title
  end
end
