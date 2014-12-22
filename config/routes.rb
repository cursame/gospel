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



 
end
