# Below are the routes for madmin
namespace :madmin do
  resources :subjects
  resources :students
  resources :branches
  resources :attendances
  resources :admins
  resources :teachers
  root to: "dashboard#show"
end
