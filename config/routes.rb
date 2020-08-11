Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :sites, only: [:create, :update, :destroy, :index]
      resources :widgets, only: [:update, :destroy]
      resources :banners, only: [:update, :destroy]
    end
  end
end
