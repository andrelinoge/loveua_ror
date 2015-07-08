require "rails_helper"

RSpec.describe RegistrationMailer, type: :mailer do
  context 'Welcome' do
    let!(:password) {}

    let(:user) {
      mock_model User,
      name: 'user name',
      email: 'valid@mail.com',
      gender: User::MALE,
      role: User::ROLE_USER,
      password: password
    }

    let(:mail) { RegistrationMailer.welcome(user, password) }

    it 'renders the subject' do
      expect(mail.subject).to eql('Welcome')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'assigns @password' do
      expect(mail.body.encoded).to match(/#{password}/)
    end
  end
end