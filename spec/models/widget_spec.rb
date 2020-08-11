require 'rails_helper'

describe Widget, type: :model do  
  describe 'Associations' do
    it { is_expected.to belong_to(:site) }
  end

  describe 'Validations' do
    let!(:site){ build_stubbed(:site) }

    before do
      allow(subject).to receive(:site).and_return(site)
      allow(site).to receive(:update)
    end

    it { is_expected.to validate_presence_of(:position).with_message('must be integer between (1-10)') }
    it { is_expected.to validate_uniqueness_of(:position).scoped_to(:site_id) }
  end
end
