require 'rails_helper'

describe GenerateHtml do
  describe '#perform' do
    let(:site) { create(:site, code_rendered: false) }
    let(:action_controller_base) { double(:action_controller_base) }

    before do
      allow(ActionController::Base).to receive(:new).and_return(action_controller_base)
      allow(action_controller_base).to receive(:render_to_string)
      subject
    end

    subject { described_class.perform(site) }

    it 'calls ActionController::Base with correct params' do
      expected = {
        partial: 'api/v1/sites/site_template',
        layout: false,
        locals: { site: site }
      }
      expect(action_controller_base).to have_received(:render_to_string).with(expected)
    end
  end
end
