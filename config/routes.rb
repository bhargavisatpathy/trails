Rails.application.routes.draw do
<<<<<<< HEAD

  namespace :api do
    namespace :v1 do
      namespace :trails do
        get '/', to: "trails#index"
        get '/:id/birds', to: "birds#show"
      end
    end
  end
=======
>>>>>>> 331f99cd470a816229c84e7b5e59d7e7276e7a28
end
