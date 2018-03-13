class PatientsController < ApplicationController
  def index
    @q = Patient.ransack(params[:q])
    @patients = @q.result(:distinct => true).includes(:procedures, :payments, :locations).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@patients.where.not(:address_latitude => nil)) do |patient, marker|
      marker.lat patient.address_latitude
      marker.lng patient.address_longitude
      marker.infowindow "<h5><a href='/patients/#{patient.id}'>#{patient.first_name}</a></h5><small>#{patient.address_formatted_address}</small>"
    end

    render("patients/index.html.erb")
  end

  def show
    @procedure = Procedure.new
    @patient = Patient.find(params[:id])

    render("patients/show.html.erb")
  end

  def new
    @patient = Patient.new

    render("patients/new.html.erb")
  end

  def create
    @patient = Patient.new

    @patient.first_name = params[:first_name]
    @patient.last_name = params[:last_name]
    @patient.address = params[:address]
    @patient.phone_number = params[:phone_number]
    @patient.patient_image = params[:patient_image]

    save_status = @patient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/patients/new", "/create_patient"
        redirect_to("/patients")
      else
        redirect_back(:fallback_location => "/", :notice => "Patient created successfully.")
      end
    else
      render("patients/new.html.erb")
    end
  end

  def edit
    @patient = Patient.find(params[:id])

    render("patients/edit.html.erb")
  end

  def update
    @patient = Patient.find(params[:id])

    @patient.first_name = params[:first_name]
    @patient.last_name = params[:last_name]
    @patient.address = params[:address]
    @patient.phone_number = params[:phone_number]
    @patient.patient_image = params[:patient_image]

    save_status = @patient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/patients/#{@patient.id}/edit", "/update_patient"
        redirect_to("/patients/#{@patient.id}", :notice => "Patient updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Patient updated successfully.")
      end
    else
      render("patients/edit.html.erb")
    end
  end

  def destroy
    @patient = Patient.find(params[:id])

    @patient.destroy

    if URI(request.referer).path == "/patients/#{@patient.id}"
      redirect_to("/", :notice => "Patient deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Patient deleted.")
    end
  end
end
