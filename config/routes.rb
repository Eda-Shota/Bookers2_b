Rails.application.routes.draw do
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  get 'search' => 'searches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    #このように親子関係を持たせることで /books/:book_id/book_commentsの形のURLになり、params[:book_id]Bookのidが取得できる。
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end

end