# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe BannersController, type: :controller do
      describe 'PUT #update' do
        let(:site){ create(:site, code_rendered: true) }
        let(:banner) { create(:banner, site: site) }
        let(:banner_attributes) do
          {
            title_color: 'New_title_color',
            background_color: 'new_color'
          }
        end
        let(:params) do
          {
            id: banner.id,
            banner: banner_attributes
          }
        end

        subject { put :update, params: params }

        it { is_expected.to have_http_status(:ok) }

        it 'assigns @banner' do
          subject
          expect(assigns(:banner)).to eql(banner)
        end

        it 'update banner with params' do
          expect do
            subject
            banner.reload
          end.to change { banner.title_color }.from(banner.title_color).to(banner_attributes[:title_color])
            .and change { banner.background_color }.from(banner.background_color).to(banner_attributes[:background_color])
        end

        it 'update site code_rendered' do
          expect do
            subject
            site.reload
          end.to change { site.code_rendered }.from(true).to(false)
        end
      end

      describe 'DELETE #destroy' do
        let!(:banner) { create(:banner) }

        subject { delete :destroy, params: { id: banner.id } }

        it { is_expected.to have_http_status(:ok) }

        it 'assigns @site' do
          subject
          expect(assigns(:banner)).to eql(banner)
        end

        it 'delete banner' do
          expect { subject }.to change(Banner, :count).by(-1)
        end
      end
    end
  end
end
