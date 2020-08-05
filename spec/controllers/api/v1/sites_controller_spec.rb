require 'rails_helper'

module Api
  module V1
    describe SitesController, type: :controller do
      describe 'POST create' do
        let(:site_params) { attributes_for(:site) }
        let(:banner_params) { attributes_for(:banner) }
        let(:widget_params) { [attributes_for(:widget)] }

        subject { post :create, params: { site: site_params, banner: banner_params, widgets: widget_params } }

        it { is_expected.to have_http_status(:created) }

        it 'creates site' do
          expect { subject }.to change(Site, :count).by(1)
        end

        it 'creates banner' do
          expect { subject }.to change(Banner, :count).by(1)
        end

        it 'creates widget' do
          expect { subject }.to change(Widget, :count).by(1)
        end
      end

      describe '#new' do
        let(:site_params) { attributes_for(:site) }

        it 'assigns site' do
          get :new, params: { site: site_params }

          expect(assigns(:site)).to be_a_new(Site)
        end
      end
    end
  end
end
