require 'rails_helper'

describe UpdateWidgetsPositionService do
  describe '#perform' do
    let(:site) { create(:site) }
    let!(:widget_1) { create(:widget, site: site, position: 1) }
    let!(:widget_2) { create(:widget, site: site, position: 2) }
    let!(:widget_3) { create(:widget, site: site, position: 3) }
    let!(:widget_4) { create(:widget, site: site, position: 4) }
    let!(:widget_5) { create(:widget, site: site, position: 5) }

    subject { described_class.new(site, widget_to_move, position_to).perform }

    before { subject }

    context 'when moving to a higher position' do
      let(:widget_to_move) { widget_5 }
      let(:position_to) { 2 }

      it 'rearrange order of widgets' do
        expected = [ widget_1.id, widget_5.id, widget_2.id, widget_3.id, widget_4.id ]
        expect(site.widgets.order(:position).pluck(:id)).to eql(expected)
      end
    end

    context 'when moving to a lower position' do
      let(:widget_to_move) { widget_2 }
      let(:position_to) { 5 }

      it 'rearrange order of widgets' do
        expected = [ widget_1.id, widget_3.id, widget_4.id, widget_5.id, widget_2.id ]
        expect(site.widgets.order(:position).pluck(:id)).to eql(expected)
      end
    end
  end
end
