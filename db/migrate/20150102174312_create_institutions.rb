class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :street
      t.string :postcode
      t.string :city

      t.timestamps
    end
  end
end
