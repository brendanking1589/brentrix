Rails.application.routes.draw do
  # Routes for the Doctor resource:
  # CREATE
  get "/doctors/new", :controller => "doctors", :action => "new"
  post "/create_doctor", :controller => "doctors", :action => "create"

  # READ
  get "/doctors", :controller => "doctors", :action => "index"
  get "/doctors/:id", :controller => "doctors", :action => "show"

  # UPDATE
  get "/doctors/:id/edit", :controller => "doctors", :action => "edit"
  post "/update_doctor/:id", :controller => "doctors", :action => "update"

  # DELETE
  get "/delete_doctor/:id", :controller => "doctors", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
