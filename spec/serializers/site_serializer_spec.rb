require 'rails_helper'

describe SiteSerializer do
  let(:widgets) { build_stubbed_list(:widget, 10) }
  let(:site) { build_stubbed(:site, :with_banner, widgets: widgets) }

  subject { described_class.new(site).as_json }

  it { expect(subject[:id]).to eql(site.id) }
  it { expect(subject[:title]).to eql(site.title) }
  it { expect(subject[:icon]).to eql(site.icon) }
  it { expect(subject[:background_color]).to eql(site.background_color) }

  it 'serializes banner' do
    expected = BannerSerializer.new(site.banner).as_json

    expect(subject[:banner]).to eql(expected)
  end

  it 'serializes Widgets' do
    expected = ActiveModel::Serializer::CollectionSerializer
                .new(site.widgets, serializer: WidgetSerializer)
                .as_json

    expect(subject[:widgets]).to match_array(expected)
  end
end
