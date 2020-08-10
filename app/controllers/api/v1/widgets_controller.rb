module Api
  module V1
    class WidgetsController < ApplicationController
      before_action :set_widget

      def update
        @widget.update!(widget_params.except(:position))
        UpdateWidgetsPositionService.new(@widget.site, @widget, widget_params[:position]).perform if update_position?

        render json: @widget, status: :ok
      rescue StandardError => e
        render json: { error: e.as_json }, status: :unprocessable_entity
      end

      def delete
        @widget.destroy
        render status: :ok
      end

      private

      def widget_params
        params.require(:widget)
              .permit(%i[ title
                          content
                          background_color
                          position])
      end

      def update_position?
        @widget.position != widget_params[:position]
      end

      def set_widget
        @widget = Widget.find(params[:id])
      end
    end
  end
end
