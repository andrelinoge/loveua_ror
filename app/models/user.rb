class User < ActiveRecord::Base
	MALE   = 1
	FEMALE = 2

	ROLE_USER  = 10
	ROLE_ADMIN = 20

	has_secure_password

	validates :password, length: { minimum: 6 }

	validates_presence_of :name, :email, :gender, on: :create
	validates :email, email: true, uniqueness: true

	validates :gender, inclusion: { in: [User::MALE, User::FEMALE] }

	before_create :generate_password
	after_create :send_welcome_email

	private

	def generate_password
		@generated_password = ('a'..'z').to_a.shuffle.first(8).join
		self.password = @generated_password
	end

	def send_welcome_email
		RegistrationMailer.welcome(self, @generated_password).deliver if self.email.present?
	end
end
