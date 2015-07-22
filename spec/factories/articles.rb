FactoryGirl.define do
  factory :article do
    sequence :title do |n| 
    	"Title #{n}"
    end

		content Faker::Lorem.paragraph(10)

		cover { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'support', 'images', 'article_cover.jpg'))) }
  end

end