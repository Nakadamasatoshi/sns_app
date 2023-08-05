Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # PostsController
  get '/', to: 'posts#index', as: 'index_post'
  
  get 'posts/new', to: 'posts#new', as: 'new_post'
  
  post 'posts/new', to:'posts#create', as: 'create_post'
  #2-12で追加
  get 'posts/edit/:id', to: 'posts#edit', as:'edit_post'
  post 'posts/edit/:id', to: 'posts#update', as:'update_post'
  #ここまで
  #2-12削除分で追加
  delete 'posts/destroy/:id', to: 'posts#destroy', as: 'destroy_post'
  #ここまで
  #2-13本文で追加
  get 'posts/show/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  post 'posts/show/:post_id/comments/new', to: 'comments#create', as: 'create_comment'
  # ここまで
  #ここから修正します
  #2-13で追加
  get 'profile/show', to: 'profile#show', as: 'show_profile'
  get 'profile/new', to: 'profile#new', as: 'new_profile'
  post 'profile/new', to: 'profile#create', as: 'create_profile'
  #ここまで
  # Topics Controller
  # 2-11課題で追加
  get 'topics/index', to: 'topics#index', as: 'index_topics'
  # ここまで
  get 'topics/new', to: 'topics#new', as: 'new_topics'
  #2-12課題で「:id」をつけた
  get 'topics/edit/:id', to: 'topics#edit', as: 'edit_topics'
  
  post 'topics/new', to: 'topics#create', as: 'create_topics'
  
  post 'topics/edit/:id', to: 'topics#update', as: 'update_topics'
  #2-12課題「削除」分として追加
  delete 'topics/destroy/:id', to: 'topics#destroy', as: 'destroy_topics'
end
