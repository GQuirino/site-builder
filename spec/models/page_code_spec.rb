require 'rails_helper'

describe PageCode, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:site) }
    it { is_expected.to validate_presence_of(:html) }
  end
end
