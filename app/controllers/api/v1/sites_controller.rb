module Api
  module V1
    class SitesController < ApplicationController
      before_action :new, only: [:create]
      before_action :set_site, only: [:update, :destroy, :page]

      def create
        @site.save!
        render json: @site, status: :created
      rescue => e
        render json: {
          error: e.record.errors.full_messages
        }, status: :unprocessable_entity
      end

      def update
        @site.update!(site_params.merge(code_rendered: false))
        render json: @site, status: :ok
      rescue => e
        render json: {
          error: e.record.errors.full_messages
        }, status: :unprocessable_entity
      end

      def destroy
        @site.destroy
        render status: :ok
      end

      def index
        render json: Site.all, status: :ok
      end

      def page
        if @site.page
          render json: @site.page, status: :ok
        else
          render json: { error: ['Page not rendered'] } , status: :unprocessable_entity
        end
      end
  
      private

      def set_site
        @site = Site.find(params[:id])
      end

      def new
        @site = Site.new(site_params)
      end

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
