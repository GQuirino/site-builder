class Widget < ApplicationRecord
  belongs_to :site

  validates :position, presence: :true, uniqueness: { scope: [:site_id] }, format: { with: /\A([1-9]|10)\z/, message: 'must be integer between (1-10)' }

  after_save :update_code_rendered

  private

  def update_code_rendered
    site.update(code_rendered: false)
  end
end
