
require 'rails_helper.rb'


RSpec.feature "User logs in successfully", type: :feature do
    before(:all) do
        User.create(name: "ryan", password: "password", phone:"+11234567", email: "ryan@me.com")
    end
     scenario "User successfully signs in" do
        visit login_path
        fill_in "email", with: "ryan@me.com"
        fill_in "password", with: "password"
        click_button "Submit"
        expect(page).to have_content("Welcome to the SMS Reminder App")
    end
    
    scenario "User successfully navigates to the new reminders page from the list of reminders page." do
        visit login_path
        fill_in "email", with: "ryan@me.com"
        fill_in "password", with: "password"
        click_button "Submit"
        expect(page).to have_content("Welcome to the SMS Reminder App")
        click_on "List of Reminders"
        expect(page).to have_content("List Reminders")
        click_on "New Reminder"
        expect(page).to have_content("New Reminder")
        expect(page).to have_field("Title your reminder")
        expect(page).to have_field("Enter a date")
        expect(page).to have_field("Set a time")
        expect(page).to have_field("Notes")
    end
    
    scenario "User successfully creates a new reminder" do
        visit login_path
        fill_in "email", with: "ryan@me.com"
        fill_in "password", with: "password"
        click_button "Submit"
        expect(page).to have_content("Welcome to the SMS Reminder App")
        click_on "New Reminder"
        expect(page).to have_content("Title your reminder")
        fill_in "Title", with: "New Capybara note"
        fill_in "Notes", with: "This is a Capybara note"
        fill_in "Enter a date",  with: DateTime.parse('2012-3-13')
        fill_in "Set a time",  with: DateTime.parse('2012-3-13').to_time
        click_on "Create Reminder"
        expect(page).to have_content("New Capybara note")
        expect(page).to have_content("This is a Capybara note")
    end
    
end