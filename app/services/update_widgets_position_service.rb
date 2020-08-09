class UpdateWidgetsPositionService
  def initialize(site, widget, position_to)
    @widgets = site.widgets
    @widget = widget
    @position_from = widget.position
    @position_to = position_to
  end

  def perform
    update_positions(@widget, @position_to)
  end

  private

  def update_positions(widget, position)
    next_widget = @widgets.find_by(position: position)
    return if widget.position == position

    widget.position = position
    widget.save

    return unless next_widget

    update_positions(next_widget, increase_or_decrease(position))
  end

  def increase_or_decrease(p)   
    @position_from > @position_to ? p + 1 : p - 1
  end
end
