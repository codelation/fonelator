Rails.application.routes.draw do

  devise_for :users
  mount Fonelator::Engine => "/fonelator"
end
