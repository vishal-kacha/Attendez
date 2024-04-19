Rails.application.routes.draw do
  draw :madmin
  devise_for :students, path: 'students', controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }

  devise_for :teachers, path: 'teachers', controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  root 'pages#home'

  get 'student/:subject_name', to: 'pages#attendance_by_subject', as: 'attendance_by_subject'

  get 'attendance/new'
  post 'attendance/new', to: 'attendance#post'

  get 'attendance/:date/:time/edit', to: 'attendance#edit', as: 'attendance_edit'
  post 'attendance/:date/:time/edit', to: 'attendance#edit_post', as: 'attendance_edit_post'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
