class InitialRegistrationForm
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :age, :gender, :seek_gender

	validates_presence_of :name, :email, :age, :gender, :seek_gender
	validates :email, email: true
	validate :unique_email

	validates :age, inclusion: { in: 18..80 }
	validates :gender, inclusion: { in: User::MALE..User::FEMALE }
	validates :seek_gender, inclusion: { in: User::MALE..User::FEMALE }

	def initialize(attributes = {})
		if attributes.present? 
			attributes.each do |name, value|
				send("#{name}=", value)
			end

			convert_types
		end
	end

	def convert_types
		self.age = self.age.to_i
		self.gender = self.gender.to_i
		self.seek_gender = self.seek_gender.to_i
	end

	def persisted?
		false
	end

	def unique_email
		errors.add(:email, 'Email already in use') if User.exists?(email: self.email)
	end

	def create_user
		random_password = ('0'..'z').to_a.shuffle.first(8).join

		user = User.new({
			name: self.name,
			email: self.email,
			gender: self.gender,
			password: random_password
		})

		user.save(validate: false) and return user
	end
end