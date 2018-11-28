# require 'rails_helper'
# require 'date'
# RSpec.describe  Reminder, type: :model do
# 	# before starting tests, create a test user
# 	before(:all) do
#     Reminder.create(title: "Reminder Title ", date: Date.new(2018, 12, 2), time: Time.now, notes: "Reminder Notes")
#     #User.create(username: "ry", password: "", phone:"+11234567", email: "ryan@me.com")
#     end
  
#     # set test data to the users we created above
#     let(:valid_reminder) { Reminder.first }
# 	#let(:invalid_user) { User.last }

# 	describe "has" do
#     	it "a title" do
#           expect(valid_reminder.title).to eq "Reminder Title"
# 		end
        
#         it "a date" do
#           expect(valid_reminder.date).to eq Date.new(2018, 12, 2)
# 		end
        
#         it "a time" do
#           expect(valid_reminder.time).to eq Time.now
# 		end
# 		it "notes" do
#           expect(valid_reminder.notes).to eq "Reminder Notes"
# 		end
# 	end
# 	 describe "validates" do
      
#       #	let(:reminder_with_no_title) {Reminder.new(date: "password", phone:"+11234567", email: "ryan@me.com")}
# 	    #let(:reminder_with_no_date) {Reminder.new(name: "ryan", password: "password", phone:"+11234567", email: "ryanmecom")}
# 		#let(:reminder_with_no_time){Reminder.new(name: "ryan", phone:"+11234567", email: "ryan@me.com")}
# 	#	let(:reminder_with_no_notes){Reminder.new(name: "ryan", phone:"+11234567", email: "ryan@me.com")}

#      #	it "the username" do
#           expect(user_with_bad_username).to_not be_valid
# 		end
        
#         it "the email" do
#           expect(user_with_bad_email).to_not be_valid
# 		end
# 		it "the password" do
#           expect(user_with_no_password).to_not be_valid
# 		end
   # end
# end