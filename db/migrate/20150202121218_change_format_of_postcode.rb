class ChangeFormatOfPostcode < ActiveRecord::Migration
  def change
  	change_column :institutions, :postcode, :string
  end
end
