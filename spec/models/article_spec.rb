require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validations' do
  	it { should validate_presence_of(:title) }
  	it { should validate_presence_of(:content) }
  	it { should validate_presence_of(:cover) }
  end
end
