Rails.application.routes.draw do

  get 'dashboard/index'

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}

  root to: 'home#index'

  resources :expenses, only: [:index, :show, :edit, :update, :new, :create, :destroy]

  resources :reports, only: [:index, :show, :edit, :update, :new, :create, :destroy]

  resources :tags, only: [:index, :edit, :update, :new, :create, :destroy]

  get 'reports/remove_expense_from_report/:report_id/:expense_id', :to => 'reports#remove_expense_from_report'

end
