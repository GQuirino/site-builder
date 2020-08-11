class Site < ApplicationRecord
  has_one :banner, dependent: :delete
  has_many :widgets, dependent: :delete_all
  has_many :page_codes, dependent: :delete_all

  accepts_nested_attributes_for :widgets
  accepts_nested_attributes_for :banner

  def page
    page_codes.order(updated_at: :desc).first
  end
end
