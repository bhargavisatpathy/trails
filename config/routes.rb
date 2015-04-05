Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :trails do
        get '/', to: "trails#index"
        get '/:id', to: "trails#show"
        get '/:id/birds', to: "birds#show"
      end
    end
  end
end
