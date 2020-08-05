require 'rails_helper'

describe Widget, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:site) }
  end
end
