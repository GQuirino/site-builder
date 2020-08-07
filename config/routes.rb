Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :sites, only: [:create, :new, :index]
      resources :widgets, only: [:update, :destroy]
    end
  end
end
