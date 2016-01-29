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
  get 'poll_recs/show_count/:id', to: 'poll_recs#show_count'
  get 'poll_recs/show_countCP/:id', to: 'poll_recs#show_countCP'
  get 'poll_recs/show_countByCP/:id/:cp', to: 'poll_recs#show_countByCP'
  get 'poll_recs/show_polls/all', to: 'poll_recs#show_polls'

end
