# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe SitesController, type: :controller do
      describe 'POST #create' do
        let(:site_params) { attributes_for(:site) }
        let(:banner_params) { attributes_for(:banner) }
        let(:widget_params) { [attributes_for(:widget)] }
        let(:body) do
          {
            site: site_params
              .merge(banner_attributes: banner_params)
              .merge(widgets_attributes: widget_params)
          }
        end

        subject { post :create, params: body }

        context 'with valid attributes' do
          it { is_expected.to have_http_status(:created) }

          it 'assigns @site' do
            subject

            expect(assigns(:site)).to be_a(Site)
          end

          it 'creates site' do
            expect { subject }.to change(Site, :count).by(1)
          end

          it 'creates banner' do
            expect { subject }.to change(Banner, :count).by(1)
          end

          it 'creates widget' do
            expect { subject }.to change(Widget, :count).by(1)
          end

          it 'sets code_rendered to false' do
            subject
            expect(Site.last.code_rendered).to be_falsey
          end
        end

        context 'with invalid attributes' do
          let(:widget_params) { [attributes_for(:widget, position: 20)] }

          it { is_expected.to have_http_status(:unprocessable_entity) }

          it 'not creates site' do
            expect { subject }.to_not change(Site, :count)
          end

          it 'not creates banner' do
            expect { subject }.to_not change(Banner, :count)
          end

          it 'not creates widget' do
            expect { subject }.to_not change(Widget, :count)
          end

          it 'render error message' do
            expect(JSON.parse(subject.body)).to eql('error' => ['Widgets position must be integer between (1-10)'])
          end
        end
      end

      describe 'PUT #update' do
        let(:site) { create(:site, code_rendered: true) }
        let!(:banner) { create(:banner, site: site) }
        let!(:widget) { create(:widget, site: site, position: 1) }
        let(:site_attributes) do
          {
            id: site.id,
            title: 'New_title',
            icon: 'New_icon_path',
            background_color: 'new_color'
          }
        end
        let(:banner_attributes) do
          {
            id: banner.id,
            title_color: 'New_title_color',
            background_color: 'new_color'
          }
        end
        let(:widgets_attributes) do
          [
            {
              id: widget.id,
              title: 'New_widget_title_color',
              content: 'New_content',
              background_color: 'new_color'
            }
          ]
        end
        let(:params) do
          {
            id: site.id,
            site: site_attributes
              .merge(banner_attributes: banner_attributes)
              .merge(widgets_attributes: widgets_attributes)
          }
        end

        before { subject }

        subject { put :update, params: params }

        context 'with valid attributes' do
          it { is_expected.to have_http_status(:ok) }

          it 'assigns @site' do
            expect(assigns(:site)).to eql(site)
          end

          it 'update site with params' do
            expect do
              subject
              site.reload
            end.to change { site.title }.from(site.title).to(site_attributes[:title])
              .and change { site.icon }.from(site.icon).to(site_attributes[:icon])
              .and change { site.background_color }.from(site.background_color).to(site_attributes[:background_color])
          end

          it 'update banner with params' do
            expect do
              subject
              banner.reload
            end.to change { banner.title_color }.from(banner.title_color).to(banner_attributes[:title_color])
              .and change { banner.background_color }.from(banner.background_color).to(banner_attributes[:background_color])
          end

          it 'update widget with params' do
            expect do
              subject
              widget.reload
            end.to change { widget.title }.from(widget.title).to(widgets_attributes.first[:title])
              .and change { widget.content }.from(widget.content).to(widgets_attributes.first[:content])
              .and change { widget.background_color }.from(widget.background_color).to(widgets_attributes.first[:background_color])
          end

          it 'sets code_rendered to false' do
            subject
            site.reload
            expect(site.code_rendered).to be_falsey
          end
        end

        context 'with invalid attributes' do
          let(:widgets_attributes) do
            [
              {
                id: widget.id,
                title: 'New_widget_title_color',
                content: 'New_content',
                background_color: 'new_color',
                position: 22
              }
            ]
          end

          it { is_expected.to have_http_status(:unprocessable_entity) }

          it 'assigns @site' do
            expect(assigns(:site)).to eql(site)
          end

          it 'render error message' do
            expect(JSON.parse(subject.body)).to eql('error' => ['Widgets position must be integer between (1-10)'])
          end
        end
      end

      describe 'DELETE #destroy' do
        let(:site) { create(:site) }
        let!(:banner) { create(:banner, site: site) }
        let!(:widget) { create(:widget, site: site, position: 1) }

        subject { delete :destroy, params: { id: site.id } }

        it { is_expected.to have_http_status(:ok) }

        it 'assigns @site' do
          subject
          expect(assigns(:site)).to eql(site)
        end

        it 'delete site' do
          expect { subject }.to change(Site, :count).by(-1)
        end

        it 'delete banner' do
          expect { subject }.to change(Banner, :count).by(-1)
        end

        it 'delete widget' do
          expect { subject }.to change(Widget, :count).by(-1)
        end
      end

      describe 'GET #index' do
        let!(:sites) { create_list(:site, 3) }

        subject { get :index }

        it { is_expected.to have_http_status(:ok) }

        it 'render list of sites' do
          expected = ActiveModel::Serializer::CollectionSerializer.new(sites, each_serializer: SiteSerializer).to_json
          expect(JSON.parse(subject.body)).to eql(JSON.parse(expected))
        end        
      end
    end
  end
end
