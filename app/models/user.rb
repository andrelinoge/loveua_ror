class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	GENDER_MALE   = 1
	GENDER_FEMALE = 2

  enum role: [:guest, :user, :moderator, :admin]
  enum gender: {
    male: GENDER_MALE, 
    female: GENDER_FEMALE
  }

	validates_presence_of :first_name, :gender, on: :create

	has_one :profile
	has_one :questionary

	accepts_nested_attributes_for :profile
	accepts_nested_attributes_for :questionary

	mount_uploader :avatar, AvatarUploader

  after_initialize :set_default_role, if: :new_record?
  before_create :generate_password
  after_create :send_welcome_mail

  def password_required?
    new_record? ? false : super
  end

	private

  def set_default_role
    self.role ||= :guest
  end

  def generate_password
    if self.password.nil?
      @generated_password = Devise.friendly_token.first(8)
      self.password       = @generated_password
    else
      @generated_password = self.password
    end
  end

  def send_welcome_mail
    RegistrationMailer.welcome(self, @generated_password).deliver_now
  end
end
