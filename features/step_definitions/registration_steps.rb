When(/^I fill registration form with valid data$/) do
  visit('/')
  fill_in 'email', with: 'email@mail.com'
  fill_in 'name', with: 'user name'
  select '28', from: 'age'
  choose 'male'
  choose 'seek_female'
  click_on 'Register'
end

Then(/^I should be registred in application$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^redirected to next step of registration$/) do
  pending # express the regexp above with the code you wish you had
end
