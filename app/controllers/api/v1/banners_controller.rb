module Api
  module V1
    class BannersController < ApplicationController
      before_action :set_banner

      def update
        @banner.update!(banner_params)
        render json: @banner, status: :ok
      rescue StandardError => e
        render json: { error: e.as_json }, status: :unprocessable_entity
      end

      def destroy
        @banner.destroy
        render status: :ok
      end

      private

      def banner_params
        params.require(:banner).permit(%i[title_color background_color])
      end

      def set_banner
        @banner = Banner.find(params[:id])
      end
    end
  end
end
