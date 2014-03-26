class FixHospitalToRosters < ActiveRecord::Migration
  def change
  	rename_column :rosters, :name_hospital, :name_location_hospital
  end
end
