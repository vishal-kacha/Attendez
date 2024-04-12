Rails.application.routes.draw do
  devise_for :students, path: 'students', controllers: {
    sessions: "students/sessions",
    registrations: "students/registrations"
  }

  devise_for :teachers, path: 'teachers', controllers: {
    sessions: "teachers/sessions",
    registrations: "teachers/registrations"
  }

  devise_for :admins, path: 'admins', controllers: {
    sessions: "admins/sessions",
    registrations: "admins/registrations"
  }
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
