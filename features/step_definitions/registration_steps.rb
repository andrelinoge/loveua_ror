When /^I fill registration form with valid data$/ do
  visit('/')
  fill_in 'user[email]', with: 'email@mail.com'
  fill_in 'user[first_name]', with: 'user_name'
  select '28', from: 'user[questionary_attributes][age]'
  choose 'user[gender]', option: :male
  choose 'user[questionary_attributes][seek_gender]', option: User::GENDER_FEMALE
  click_on 'Register'
end

Then /^I should be registred in application$/ do
  sleep 2
  expect(User.exists?(email: 'email@mail.com')).to be_truthy
end

Then /^redirected to next step of registration$/ do
  expect(page).to have_content 'Complete registration'
end

Then /^logged in$/ do
  expect(page).to have_content 'Log out'
end

When /^I fill registration form with invalid data$/ do
  visit('/')
  fill_in 'user[email]', with: 'email#mail.com'
  fill_in 'user[first_name]', with: 'user_name'
  select '28', from: 'user[questionary_attributes][age]'
  choose 'user[gender]', option: :male
  choose 'user[questionary_attributes][seek_gender]', option: User::GENDER_FEMALE
  click_on 'Register'
end

Then /^I should see validation errors$/ do
  sleep 2
  expect(page).to have_content "Email Is invalid"
end

Then /^stay on the same page$/ do
  expect(page).to have_content 'Registration'
end

Given /^I am on complete registration page$/ do
  visit(complete_registration_path)
  expect(page).to have_content 'Complete registration'
end

When /^I fill my personal data and click save$/ do
  mood   = FactoryGirl.create(:mood, name: 'happy')
  zodiak = FactoryGirl.create(:zodiak, name: 'fish')
  
  region = FactoryGirl.create(:region, name: 'Ivano-Frankivsk')
  city   = FactoryGirl.create(:city, name: 'Ivano-Frankivsk', region: region)

  visit(complete_registration_path) #revisit page in order to render all associated options for select boxes
  select mood.name, from: 'user[profile_attributes][mood_id]'
  select zodiak.name, from: 'user_profile_attributes_zodiak_id'

  fill_in 'user_profile_attributes_interesting', with: 'something interesting'
  fill_in 'user_profile_attributes_about', with: 'something about'

  click_on 'Save'
end

Then /^my profile and questionary are updated successfully$/ do
  user = User.first

  expect(user.profile.mood.name).to eq('happy')
  expect(user.profile.zodiak.name).to eq('fish')
end

When /^I fill my questionary data and click save$/ do
  pending
end

Then /^my questionary data is updated successfully$/ do
  pending
end