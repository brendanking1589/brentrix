Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "doctors#index"
  # Routes for the Payment resource:
  # CREATE
  get "/payments/new", :controller => "payments", :action => "new"
  post "/create_payment", :controller => "payments", :action => "create"

  # READ
  get "/payments", :controller => "payments", :action => "index"
  get "/payments/:id", :controller => "payments", :action => "show"

  # UPDATE
  get "/payments/:id/edit", :controller => "payments", :action => "edit"
  post "/update_payment/:id", :controller => "payments", :action => "update"

  # DELETE
  get "/delete_payment/:id", :controller => "payments", :action => "destroy"
  #------------------------------

  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Procedure resource:
  # CREATE
  get "/procedures/new", :controller => "procedures", :action => "new"
  post "/create_procedure", :controller => "procedures", :action => "create"

  # READ
  get "/procedures", :controller => "procedures", :action => "index"
  get "/procedures/:id", :controller => "procedures", :action => "show"

  # UPDATE
  get "/procedures/:id/edit", :controller => "procedures", :action => "edit"
  post "/update_procedure/:id", :controller => "procedures", :action => "update"

  # DELETE
  get "/delete_procedure/:id", :controller => "procedures", :action => "destroy"
  #------------------------------

  # Routes for the Treatment resource:
  # CREATE
  get "/treatments/new", :controller => "treatments", :action => "new"
  post "/create_treatment", :controller => "treatments", :action => "create"

  # READ
  get "/treatments", :controller => "treatments", :action => "index"
  get "/treatments/:id", :controller => "treatments", :action => "show"

  # UPDATE
  get "/treatments/:id/edit", :controller => "treatments", :action => "edit"
  post "/update_treatment/:id", :controller => "treatments", :action => "update"

  # DELETE
  get "/delete_treatment/:id", :controller => "treatments", :action => "destroy"
  #------------------------------

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
