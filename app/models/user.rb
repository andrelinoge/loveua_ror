class User < ActiveRecord::Base
	MALE   = 1
	FEMALE = 2

	ROLE_USER  = 10
	ROLE_ADMIN = 20

	has_secure_password

	validates :password, length: { minimum: 6 }, allow_blank: true

	validates_presence_of :name, :email, :gender, on: :create
	validates :email, email: true, uniqueness: true, on: :create

	validates :gender, inclusion: { in: [User::MALE, User::FEMALE] }

	before_create :generate_password
	after_create :send_welcome_email

	before_save { self.email.downcase! }

	has_one :profile
	has_one :questionary

	accepts_nested_attributes_for :profile
	accepts_nested_attributes_for :questionary

	mount_uploader :avatar, AvatarUploader

	attr_accessor :remember_token

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(self.remember_token))
	end

	def forget
    update_attribute(:remember_digest, nil)
  end

	def authenticated?(remember_token)
		return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def is_admin?
  	self.role == ROLE_ADMIN
  end

	private

	def generate_password
		if self.password.empty?
			@generated_password = ('a'..'z').to_a.shuffle.first(8).join
			self.password = @generated_password
		else
			@generated_password = self.password
		end
	end

	def send_welcome_email
		RegistrationMailer.welcome(self, @generated_password).deliver_now if self.email.present?
	end
end
