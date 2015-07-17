class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	MALE   = 1
	FEMALE = 2

	ROLE_USER  = 10
	ROLE_ADMIN = 20

  ROLES = %w[admin moderator user]

	validates_presence_of :first_name, :gender, on: :create

	validates :gender, inclusion: { in: [User::MALE, User::FEMALE] }

	#before_create :generate_password
	#after_create :send_welcome_email

	has_one :profile
	has_one :questionary

	accepts_nested_attributes_for :profile
	accepts_nested_attributes_for :questionary

	mount_uploader :avatar, AvatarUploader

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def is_guest?
  	self.role.nil?
  end

  def password_required?
    new_record? ? false : super
  end

	private

	def generate_password
		if self.password.empty?
			@generated_password = ('a'..'z').to_a.shuffle.first(8).join
			self.password = @generated_password
      self.password_confirmation = @generated_password
		else
			@generated_password = self.password
		end
	end

	def send_welcome_email
		RegistrationMailer.welcome(self, @generated_password).deliver_now if self.email.present?
	end
end
