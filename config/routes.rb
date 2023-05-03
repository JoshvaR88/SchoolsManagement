Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Admin routes
  namespace :admin do
    resources :schools, only: [:index, :new, :create] do
      resources :school_admins, only: [:new, :create]
    end
  end

  # SchoolAdmin routes
  namespace :school_admin do
    resources :schools, only: [:edit, :update] do
      resources :courses, only: [:index, :new, :create]
      resources :batches, only: [:index, :new, :create, :show, :update] do
        resources :enrolment_requests, only: [:index, :update]
      end
    end
  end

end
