class InitialRegistrationForm
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :age, :gender, :seek_gender

	#validates_presence_of :name, :email, :age, :gender, :seek_gender
	#validate email and email uniquess
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
end