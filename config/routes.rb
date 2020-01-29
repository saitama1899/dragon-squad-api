Rails.application.routes.draw do
  mount Badi::Api => '/'

  root to: 'pages#home'
end
