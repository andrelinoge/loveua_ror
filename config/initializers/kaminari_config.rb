Kaminari.configure do |config|
  config.default_per_page = Rails.env.test? ? 2 : 10
end