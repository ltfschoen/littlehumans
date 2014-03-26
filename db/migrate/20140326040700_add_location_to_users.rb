class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_location_hospital, :string
  end
end