require 'rails_helper'

describe Banner, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:site) }
  end
end
