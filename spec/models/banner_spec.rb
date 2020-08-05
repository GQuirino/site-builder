require 'rails_helper'

describe Banner, type: :model do
    it { is_expected.to belong_to(:site) }
end
