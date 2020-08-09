module Api
  module V1
    class SitesController < ApplicationController
      before_action :new, only: [:create]

      def create
        begin
          if @site.save!
            @site.create_banner!(banner_params)
            @site.widgets.create!(widget_params)
          end
          render json: @site, status: :created
        rescue => e
          render json: { 
            error: e.record.errors.full_messages
          }, status: :unprocessable_entity
        end
        

      end

      def new
        @site = Site.new(site_params)
      end

      private

      def banner_params
        params.require(:banner).permit(%i[
                                         title_color
                                         background_color
                                       ])
      end

      def widget_params
        params.permit(widgets: %i[
                        title
                        content
                        background_color
                        position
                      ]).require(:widgets)
      end

      def site_params
        params.require(:site).permit(%i[
                                       title
                                       icon
                                       background_color
                                     ])
      end
    end
  end
end
