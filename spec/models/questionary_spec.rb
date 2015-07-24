require 'rails_helper'

RSpec.describe Questionary, type: :model do
  context "Assosiations" do
  	it { should belong_to(:user) }
  	it { should belong_to(:city) }
  	it { should belong_to(:region) }
  end

  context "Validation" do
  	it { should validate_numericality_of(:age) }
  	it { should validate_numericality_of(:weight) }
  	it { should validate_numericality_of(:height) }
  end
end
