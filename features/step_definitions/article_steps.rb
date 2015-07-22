When /^I visit articles page$/ do
	8.times { FactoryGirl.create(:article) }
	visit '/articles'
end

Then /^I should see title, cover and shor text of articles$/ do
	expect(page).to have_content(Article.first.title)
	expect(page).to have_content(Article.first.decorate.short_content)
	expect(page).to have_xpath("//img[@src='#{Article.first.cover.url}']")
end

Then /^I should see pager$/ do
	expect(page).to have_content('Next')
end


When /^click on article title$/ do
	click_on Article.first.title
end

Then /^I should read article$/ do
	expect(page).to have_content(Article.first.content)
end
