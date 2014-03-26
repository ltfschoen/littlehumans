class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :name_shift
      t.string :name_hospital
      t.string :name_location
      t.datetime :time_shift_start
      t.datetime :time_shift_end
      t.decimal :time_shift_duration, :precision => 4, :scale => 2
      t.references :user

      t.timestamps
    end
  end
end
