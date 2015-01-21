class AddDetailsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :title, :string
    add_column :contacts, :form_of_address, :string
    add_column :contacts, :position, :string
    add_column :contacts, :landline, :string
    add_column :contacts, :mobile, :string
    add_column :contacts, :fax, :string
  end
end
