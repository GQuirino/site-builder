require 'rails_helper'

describe Site, type: :model do
  describe 'Associations' do
    it { is_expected.to have_one(:banner) }
    it { is_expected.to have_many(:widgets) }
    it { is_expected.to have_many(:page_codes) }
  end
end
