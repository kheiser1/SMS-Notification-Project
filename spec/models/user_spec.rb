require 'rails_helper'
RSpec.describe  User, type: :model do
 	# before starting tests, create a test user
	before(:all) do
    User.create(name: "ryan", password: "password", phone:"+11234567", email: "ryan@me.com")
    #User.create(username: "ry", password: "", phone:"+11234567", email: "ryan@me.com")
    end
  
    # set test data to the users we created above
    let(:valid_user) { User.first }
	#let(:invalid_user) { User.last }

	describe "has" do
    	it "a username" do
          expect(valid_user.name).to eq "ryan"
		end
        
        it "a phone" do
          expect(valid_user.phone).to eq "+11234567"
		end
        
        it "a email" do
          expect(valid_user.email).to eq "ryan@me.com"
		end
	end
	 describe "validates" do
      
      	let(:user_with_bad_username) {User.new(name: "ry", password: "password", phone:"+11234567", email: "ryan@me.com")}
		let(:user_with_bad_email) {User.new(name: "ryan", password: "password", phone:"+11234567", email: "ryanmecom")}
		let(:user_with_no_password){User.new(name: "ryan", phone:"+11234567", email: "ryan@me.com")}

     	it "the username" do
          expect(user_with_bad_username).to_not be_valid
		end
        
        it "the email" do
          expect(user_with_bad_email).to_not be_valid
		end
		it "the password" do
          expect(user_with_no_password).to_not be_valid
		end
    end
 end