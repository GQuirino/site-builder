# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe WidgetsController, type: :controller do
      describe 'PUT #update' do
        let(:update_postition_service){ double(:update_postition_service) }
        let!(:site){ create(:site) }
        let!(:widget) { create(:widget, position: 1, site: site) }
        let(:widget_attributes) do
          {
            title: 'New_widget_title_color',
            content: 'New_content',
            background_color: 'new_color'
          }
        end
        let(:params) do
          {
            id: widget.id,
            widget: widget_attributes
          }
        end

        before do
          allow(UpdateWidgetsPositionService).to receive(:new).and_return(update_postition_service)
          allow(update_postition_service).to receive(:perform)
        end

        subject { put :update, params: params }

        context 'with valid attributes' do
          before do
            allow(controller).to receive(:update_position?).and_return(false)
          end

          it { is_expected.to have_http_status(:ok) }

          it 'assigns @site' do
            subject
            expect(assigns(:widget)).to eql(widget)
          end

          it 'update widget with params' do
            expect do
              subject
              widget.reload
            end.to change { widget.title }.from(widget.title).to(widget_attributes[:title])
              .and change { widget.content }.from(widget.content).to(widget_attributes[:content])
              .and change { widget.background_color }.from(widget.background_color).to(widget_attributes[:background_color])
          end

          it 'update site code_rendered' do
            site.update(code_rendered: true)

            expect do
              subject
              site.reload
            end.to change { site.code_rendered }.from(true).to(false)
          end
        end

        context 'when position updates' do
          let(:widget_attributes) do
            {
              title: 'New_widget_title_color',
              content: 'New_content',
              background_color: 'new_color',
              position: '3'
            }
          end

          before do
            allow(controller).to receive(:update_position?).and_return(true)
          end

          it 'calls UpdateWidgetsPositionService' do
            subject
            expect(UpdateWidgetsPositionService).to have_received(:new).with(widget.site, widget.reload, widget_attributes[:position])
          end
        end
      end

      describe 'DELETE #destroy' do
        let!(:widget) { create(:widget, position: 1) }

        subject { delete :destroy, params: { id: widget.id } }

        it { is_expected.to have_http_status(:ok) }

        it 'assigns @widget' do
          subject
          expect(assigns(:widget)).to eql(widget)
        end

        it 'delete widget' do
          expect { subject }.to change(Widget, :count).by(-1)
        end
      end
    end
  end
end
