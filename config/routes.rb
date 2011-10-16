CourseManager::Application.routes.draw do
  resources :lecturers, only: [:index, :show]
  resources :courses, only: [:index, :show]
  resources :enrollments, only: [:create]

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :students

  get 'home/index'
  root :to => 'home#index'

  match '*a', :to => 'errors#routing'
end
