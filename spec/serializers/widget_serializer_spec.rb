require 'rails_helper'

describe WidgetSerializer do
  let(:widget) { build_stubbed(:widget) }

  subject { described_class.new(widget).as_json }

  it { expect(subject[:id]).to eql(widget.id) }
  it { expect(subject[:title]).to eql(widget.title) }
  it { expect(subject[:content]).to eql(widget.content) }
  it { expect(subject[:background_color]).to eql(widget.background_color) }
  it { expect(subject[:position]).to eql(widget.position) }
end
