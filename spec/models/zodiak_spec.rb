require 'rails_helper'

RSpec.describe Zodiak, type: :model do
  context 'Validations' do
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:css_class) }
  end
end
