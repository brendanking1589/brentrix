class PatientsController < ApplicationController
  def index
    @patients = Patient.all

    render("patients/index.html.erb")
  end

  def show
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
