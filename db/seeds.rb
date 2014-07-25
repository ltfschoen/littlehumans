User.delete_all
Roster.delete_all
Delivery.delete_all

# User
user = User.new
user.email = "ltfschoen@gmail.com"
user.password = "password"
user.name = "Luke"
user.name_location_hospital = "RPA"
user.save

# Roster
roster = Roster.new
roster.name_shift = "Night"
roster.name_location_hospital = "RPA"
roster.name_location_shift = "RNSH"
roster.time_shift_duration = "2 hrs"
roster.user_id = user.id        # first user id
roster.save

roster2 = Roster.new
roster2.name_shift = "Day"
roster2.name_location_hospital = "RPA"
roster2.name_location_shift = "RPA2"
roster2.time_shift_duration = "4 hrs"
roster2.user_id = 200         # first user id
roster2.save

# Delivery
delivery = Delivery.new
delivery.name_baby = "Elmo"
delivery.time_born = Time.now
delivery.name_location_born = 'RPA'
delivery.user_id = user.id        # first user id
delivery.roster_id = roster.id      # first user roster id
delivery.save

delivery = Delivery.new
delivery.name_baby = "Fido"
delivery.time_born = Time.now
delivery.name_location_born = 'RNSH'
delivery.user_id = 100
delivery.roster_id = roster2.id
delivery.save
