require 'rails_helper'

describe Reading, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:temp_f) }
    it { should validate_presence_of(:browser_uuid) }
    it { should validate_presence_of(:household_person) }
  end
end
