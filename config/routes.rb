Rails.application.routes.draw do
  root 'claps#new'
  get  '/view', to: 'claps#view'
  post '/clap', to: 'claps#create'
  post '/reset', to: 'claps#reset'
  get  '/count_clap', to: 'claps#count_clap'

  get  '/admin/login', to: 'admin#show_login_form'
  post '/admin/login', to: 'admin#login'

  get  '/about', to: 'about#show'
end
