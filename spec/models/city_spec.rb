require 'rails_helper'

RSpec.describe City, type: :model do
  context 'Validations' do
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:region_id) }
  end

  context "Assosiations" do
  	it { should belong_to(:region) }
  end
end
