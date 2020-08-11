class Banner < ApplicationRecord
  belongs_to :site

  after_save :update_code_rendered

  private

  def update_code_rendered
    site.update(code_rendered: false)
  end
end
