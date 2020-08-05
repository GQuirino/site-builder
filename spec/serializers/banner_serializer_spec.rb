require 'rails_helper'

describe BannerSerializer do
  let(:banner) { build_stubbed(:banner) }

  subject { described_class.new(banner).as_json }

  it { expect(subject[:id]).to eql(banner.id) }
  it { expect(subject[:title_color]).to eql(banner.title_color) }
  it { expect(subject[:background_color]).to eql(banner.background_color) }
end
