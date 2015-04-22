class InitialRegistrationForm
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :age, :gender, :seek_gender

	validates_presence_of :name, :email, :age, :gender, :seek_gender
	validates :email, email: true
	validate :unique_email

	#validate range of age
	#validate gender and seek_gender

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end

	def persisted?
		false
	end

	def unique_email
		errors.add(:email, 'Email already in use') if User.exists?(email: self.email)
	end

	def create_user
	end
end