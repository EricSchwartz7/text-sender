Rails.application.routes.draw do

  root 'messages#new'
  
  resources :messages

  post '/receive_text', to: 'messages#receive_text', as: 'receive_text'

end
