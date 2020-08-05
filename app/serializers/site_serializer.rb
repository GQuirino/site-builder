class SiteSerializer < ActiveModel::Serializer
  attributes :id, :title, :icon, :background_color

  has_one :banner
  has_many :widgets
end
