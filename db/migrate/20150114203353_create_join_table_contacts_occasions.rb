class CreateJoinTableContactsOccasions < ActiveRecord::Migration
  def change
    create_join_table :contacts, :occasions do |t|
    end
  end
end
