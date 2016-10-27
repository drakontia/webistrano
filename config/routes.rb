Webistrano::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy', as: :sign_out
  end

  root :to => 'projects#dashboard'

  resources :projects do
    resources :project_configurations
    resources :stages do
      member do
        get :tasks
        get :capfile
        get :recipes
        put :recipes
      end
      resources :stage_configurations
      resources :roles
      resources :deployments do
        collection do
          get :latest
        end
        member do
          post :cancel
        end
      end
    end
  end

  resources :hosts

  resources :recipes do
    collection do
      get :preview
    end
  end

  resources :users do
    member do
      post :enable
      get :deployments
    end
  end
end
