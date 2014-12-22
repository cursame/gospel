Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'home/newsletter'

  get 'trainer/follow_user'

  get 'trainer/follow_network'

  get 'trainer/network', as: :institution

  get 'trainer/admin', as: :admin

  get 'trainer/teacher', as: :teacher

  get 'trainer/student', as: :student



 
end
