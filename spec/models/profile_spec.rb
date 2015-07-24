require 'rails_helper'

RSpec.describe Profile, type: :model do
  context "assosiations" do
  	it { should belong_to(:user) }
  	it { should belong_to(:mood) }
  	it { should belong_to(:zodiak) }
  end
end
