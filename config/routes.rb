Rails.application.routes.draw do
  resources :tipos
  resources :contatos

  resources :auths, only: [:create]

  get '/contatos/:id/telefones', to: 'contatos#telefones'

end
