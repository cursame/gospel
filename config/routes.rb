Rails.application.routes.draw do
  root 'home#index'

  get 'home/index'

  get 'home/newsletter'

  get 'trainer/follow_user'

  get 'trainer/follow_network'

  get 'trainer/network'

  get 'trainer/admin'

  get 'trainer/teacher'

  get 'trainer/student'



 
end
