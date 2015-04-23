class User < ActiveRecord::Base
	MALE   = 1
	FEMALE = 2

	ROLE_USER  = 10
	ROLE_ADMIN = 20

	has_secure_password

	validates :password, length: { minimum: 6 }

	validates_presence_of :name, :email, :gender
	validates :email, email: true, uniqueness: true

	validates :gender, inclusion: { in: [User::MALE, User::FEMALE] }
end
