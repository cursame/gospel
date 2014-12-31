Rails.application.routes.draw do

  ########## vistas principales ######
  root 'home#index'
  get 'home/index'
  get 'home/newsletter', as: :newsletter

  ######## herramientas de logueo ##########

  get 'trainer/follow_user'
  get 'trainer/follow_network'
  get 'trainer/follow'
  post 'trainer/follow'
  get 'trainer/unfollow', as: :exit

  ######## vistas  de contenidos ##########

  get 'trainer/network', as: :institution
  get 'trainer/admin', as: :admin
  get 'trainer/teacher', as: :teacher
  get 'trainer/student', as: :student

  ######## api #########

  get 'create_user', to: 'register_api#create_user'
  get 'create_network', to: 'register_api#create_network'
  get 'register_session', to: 'register_api#register_session'
  post 'create_user', to: 'register_api#create_user'
  post 'create_network', to: 'register_api#create_network'
  post 'register_session', to: 'register_api#register_session'

  ######## paginador ########

  get 'next_steap', to: 'trainer#update_steap', as: :next_steap
  get 'preview_steap', to: 'trainer#preview_steap', as: :preview_steap
  post 'trainer/update_steap'

end
