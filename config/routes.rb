Rails.application.routes.draw do
  root 'craps#new'
  get  '/view', to: 'craps#view'
  post '/crap', to: 'craps#create'
  post '/reset', to: 'craps#reset'
  get  '/count_crap', to: 'craps#count_crap'

  get  '/admin/login', to: 'admin#show_login_form'
  post '/admin/login', to: 'admin#login'
end
