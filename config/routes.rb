# frozen_string_literal: true

Rails.application.routes.draw do
  # root route
  root 'static_pages#home'

  # routes for static pages index and show
  get 'static_pages/index'
  get 'static_pages/show'
end

