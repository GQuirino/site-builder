class WidgetSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :background_color, :position
end
