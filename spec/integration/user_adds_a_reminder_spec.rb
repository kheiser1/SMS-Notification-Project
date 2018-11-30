require 'rails_helper'


RSpec.feature "User adds a reminder", type: :feature do
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
    
end



# feature "User adds a reminder" do
#     scenario "User successfully signs in." do
#         visit login_path
#         fill_in "email", with: "a@a"
#         fill_in "password", with: "aaaaaaaa"
#         click_button "Submit"
#         expect(page).to have_content("Welcome to the SMS Reminder App")
#     end
#     scenario "User successfully navigates to the new reminders page from the list of reminders page." do
#         visit('/welcome/index')
#         click_link "List of Reminders"
#         expect(page).to have_content("Listing Reminders")
#         click_link "New Reminder"
#         expect(page).to have_content("New Reminder")
#         expect(page).to have_field("Title your reminder")
#         expect(page).to have_field("Enter a date")
#         expect(page).to have_field("Set a time")
#         expect(page).to have_field("Notes")
#     end
    
#     scenario "User successfully creates a new reminder" do
#         visit new_users_reminders_path
#         expect(page).to have_content("New Ew")
#         fill_in "Title", with: "New Capybara note"
#         fill_in "Text", with: "This is a Capybara note"
#         click_button "Create Note"
#         expect(page).to have_content("New Capybara note")
#         expect(page).to have_content("This is a Capybara note")
#     end
#     #user successfully deletes something, or updates something
#     #get #1 working
# end