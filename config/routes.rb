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
  get 'user_implemented', to: 'register_api#user_implemented'

  post 'create_user', to: 'register_api#create_user'
  post 'create_network', to: 'register_api#create_network'
  post 'register_session', to: 'register_api#register_session'
  post 'user_implemented', to: 'register_api#user_implemented'

  ######## paginador ########

  get 'next_steap', to: 'trainer#update_steap', as: :next_steap
  get 'preview_steap', to: 'trainer#preview_steap', as: :preview_steap
  post 'trainer/update_steap'

  ######## admin ########

  get 'analitics', to: 'admin#analitics', as: :analitics
  get 'logginadmin', to: 'admin#capacite', as: :logginadmin
  post 'logginadmin', to: 'admin#capacite'
  get 'admin/loggin', to: 'admin#loggin', as: :admin_loggin
  get 'networks', to: 'admin#networks', as: :networks
  get 'users', to: 'admin#users', as: :users
  ####### admin create ######
  get 'view_admins', to: 'admin#view_admins', as: :view_admins
  get 'admin/new_admin', as: :new_admin
  get 'admin/create_admin', as: :create_admin
  get  'admin/delete_admins', as: :destroy_admin
  post 'admin/delete_admins'
  post 'admin/create_admin'
  ####### admin session #######
  get 'admin/session_create', as: :session_create
  get 'admin/session_destroy', as: :session_destroy
  post 'admin/session_create'
  post 'admin/session_destroy'

end
