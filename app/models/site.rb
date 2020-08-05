class Site < ApplicationRecord
  has_one :banner
  has_many :widgets
end
