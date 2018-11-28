Feature: Add a new user

As a new user
So that the new user can Signup!
I want to be able to add a new user

Scenario: As a user I want to be able to create a new user from the Signup! page
Given I am on the "Login!" page
When I click on the "Signup" link
Then I should be on the "Signup!" page
And I should see the "Name" field
And I should see the "Email" field
And I should see the "Phone" field
And I should see the "Password" field
And I should see the "Password Confirmation" field
When I click on the "Submit" button
Then I should see the "Signup!" page