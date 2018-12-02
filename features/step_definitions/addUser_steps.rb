Given("I am on the {string} page") do |string|
  visit login_path
end

When("I click on the {string} link") do |page_name|
  click_link page_name
end

Then("I should be on the {string} page") do |page_name|
  expect(page).to have_content(page_name)
end

Then("I should see the {string} field") do |field_name|
  expect(page).to have_field(field_name)
end

When("I click on the {string} button") do |button_name|
 click_button button_name
end

Then("I should see the {string} page") do |page_name|
  expect(page).to have_content(page_name)
end

And("I fill in a User field:") do |table|
  table = table.hashes
end
