require 'rails_helper'

describe Widget, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:site) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:position).with_message('must be integer between (1-10)') }
    it { is_expected.to validate_uniqueness_of(:position).scoped_to(:site_id) }
  end
end
