class FixLocationToRosters < ActiveRecord::Migration
  def change
  	rename_column :rosters, :name_location, :name_location_shift
  end
end