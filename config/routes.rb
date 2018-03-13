Rails.application.routes.draw do
  # Routes for the Provider resource:
  # CREATE
  get "/providers/new", :controller => "providers", :action => "new"
  post "/create_provider", :controller => "providers", :action => "create"

  # READ
  get "/providers", :controller => "providers", :action => "index"
  get "/providers/:id", :controller => "providers", :action => "show"

  # UPDATE
  get "/providers/:id/edit", :controller => "providers", :action => "edit"
  post "/update_provider/:id", :controller => "providers", :action => "update"

  # DELETE
  get "/delete_provider/:id", :controller => "providers", :action => "destroy"
  #------------------------------

  # Routes for the Patient resource:
  # CREATE
  get "/patients/new", :controller => "patients", :action => "new"
  post "/create_patient", :controller => "patients", :action => "create"

  # READ
  get "/patients", :controller => "patients", :action => "index"
  get "/patients/:id", :controller => "patients", :action => "show"

  # UPDATE
  get "/patients/:id/edit", :controller => "patients", :action => "edit"
  post "/update_patient/:id", :controller => "patients", :action => "update"

  # DELETE
  get "/delete_patient/:id", :controller => "patients", :action => "destroy"
  #------------------------------

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
