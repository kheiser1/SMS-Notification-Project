Feature: User Logs into the Reminder app

As a user
So that the user can Login
I want to be able to log into the app

Scenario: As a user I want to be able to log into the app from the Login page
Given I am on the "Login" page
When I click on the "Signup" link
Then I should be on the "Signup!" page
When I fill in a User field:
  | Name                 | Jazz             |
  | Email                | jazz@email.com   |
  | Phone                | 7047777777       |
  | Password             | greenForGo       |
  | Password Confirmation| greenForGo       |
And I click on the "Submit" button
Given I am on the "Login" page
When I fill in a User field:
    | Email                | jazz@email.com   |
    | Password             | greenForGo       |
And I click on the "Submit" button
Then I should be on the "Welcome to the SMS Reminder App" page

