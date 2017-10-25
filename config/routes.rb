Rails.application.routes.draw do
  mount ImageUploader::UploadEndpoint => "/images/upload"
  resources :posts
  
  root to: "posts#index"
end
