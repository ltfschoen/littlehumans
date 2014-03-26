class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :name_baby
      t.datetime :time_born
      t.string :name_location_born
      t.references :user
      t.references :roster

      t.timestamps
    end
  end
end
