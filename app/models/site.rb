class Site < ApplicationRecord
  has_one :banner
  has_many :widgets

  accepts_nested_attributes_for :widgets
  accepts_nested_attributes_for :banner
end
