require 'rails_helper'

describe Reminder, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:hour_of_day) }
  end
end
