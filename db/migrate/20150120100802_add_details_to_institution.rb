class AddDetailsToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :website, :string
    add_column :institutions, :comment, :string
  end
end
