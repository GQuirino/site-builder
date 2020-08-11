require 'rails_helper'

describe Site, type: :model do
  describe 'Associations' do
    it { is_expected.to have_one(:banner) }
    it { is_expected.to have_many(:widgets) }
    it { is_expected.to have_many(:page_codes) }
  end

  describe '#pages' do
    let(:site) { build_stubbed(:site) }
    let(:relation) { double(:relation, first: page_code) }
    
    before do
      allow(site).to receive_message_chain(:page_codes, :order).and_return(relation)
    end

    subject { site.page }

    context 'with page code' do
      let(:page_code) { build_stubbed(:page_code, site: site) }
      
      it{ is_expected.to eql(page_code)}
    end

    context 'without page code' do
      let(:page_code) { nil }

      it{ is_expected.to be_nil }
    end
  end
end
