Rails.application.routes.draw do
  root 'claps#new'
  get  '/view', to: 'claps#view'
  post '/clap', to: 'claps#create'
  get  '/count_clap', to: 'claps#count_clap'
  get  '/about', to: 'about#show'
end
