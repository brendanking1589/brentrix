class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.page(params[:page]).per(10)

    render("doctors/index.html.erb")
  end

  def show
    @provider = Provider.new
    @doctor = Doctor.find(params[:id])

    render("doctors/show.html.erb")
  end

  def new
    @doctor = Doctor.new

    render("doctors/new.html.erb")
  end

  def create
    @doctor = Doctor.new

    @doctor.first_name = params[:first_name]
    @doctor.last_name = params[:last_name]
    @doctor.phone_number = params[:phone_number]
    @doctor.doctor_image = params[:doctor_image]

    save_status = @doctor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/doctors/new", "/create_doctor"
        redirect_to("/doctors")
      else
        redirect_back(:fallback_location => "/", :notice => "Doctor created successfully.")
      end
    else
      render("doctors/new.html.erb")
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])

    render("doctors/edit.html.erb")
  end

  def update
    @doctor = Doctor.find(params[:id])

    @doctor.first_name = params[:first_name]
    @doctor.last_name = params[:last_name]
    @doctor.phone_number = params[:phone_number]
    @doctor.doctor_image = params[:doctor_image]

    save_status = @doctor.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/doctors/#{@doctor.id}/edit", "/update_doctor"
        redirect_to("/doctors/#{@doctor.id}", :notice => "Doctor updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Doctor updated successfully.")
      end
    else
      render("doctors/edit.html.erb")
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])

    @doctor.destroy

    if URI(request.referer).path == "/doctors/#{@doctor.id}"
      redirect_to("/", :notice => "Doctor deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Doctor deleted.")
    end
  end
end
