Rails.application.routes.draw do
  get 'response_question/:question_id/index', to: 'response_question#index', as: 'response_question_index'
  post 'response_question/create'
  get 'response_question/:question_id/show', to: 'response_question#show', as: 'response_question_show'
  resources :answers
  resources :questions
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "questions#index"
end
