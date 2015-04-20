When(/^I fill registration form with valid data$/) do
  visit('/')
  fill_in 'initial_registration_form[email]', with: 'email@mail.com'
  fill_in 'initial_registration_form[name]', with: 'user name'
  select '28', from: 'initial_registration_form[age]'
  choose 'initial_registration_form[gender]', option: 'male'
  choose 'initial_registration_form[seek_gender]', option: 'female'
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
