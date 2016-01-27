Rails.application.routes.draw do
  resources :general_counts
  resources :count_cps
  resources :poll_recs
  resources :answers
  resources :votes
  resources :polls
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
