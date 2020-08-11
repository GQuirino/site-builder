class PageCode < ApplicationRecord
  belongs_to :site

  validates :html, presence: :true
end
