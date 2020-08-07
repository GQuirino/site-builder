module Api
  module V1
    class SitesController < ApplicationController
      before_action :new, only: [:create]

      def create
        begin
          @site.save!
          render json: @site, status: :created
        rescue => e
          render json: {error: e.as_json}, status: :unprocessable_entity
        end
      end

      def new
        @site = Site.new(site_params)
      end

      private

      def site_params
        params.require(:site).permit([
                                       :title,
                                       :icon,
                                       :background_color,
                                       banner_attributes: %i[id title_color background_color],
                                       widgets_attributes: [:id, :title, :content, :background_color, :position]
                                     ])
      end
    end
  end
end
