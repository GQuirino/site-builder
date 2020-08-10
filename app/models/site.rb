class Site < ApplicationRecord
  has_one :banner, dependent: :delete
  has_many :widgets, dependent: :delete_all

  accepts_nested_attributes_for :widgets
  accepts_nested_attributes_for :banner
end
