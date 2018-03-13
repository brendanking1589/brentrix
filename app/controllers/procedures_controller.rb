class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.page(params[:page]).per(10)

    render("procedures/index.html.erb")
  end

  def show
    @payment = Payment.new
    @procedure = Procedure.find(params[:id])

    render("procedures/show.html.erb")
  end

  def new
    @procedure = Procedure.new

    render("procedures/new.html.erb")
  end

  def create
    @procedure = Procedure.new

    @procedure.provider_id = params[:provider_id]
    @procedure.treatment_id = params[:treatment_id]
    @procedure.patient_id = params[:patient_id]
    @procedure.amount = params[:amount]
    @procedure.date = params[:date]

    save_status = @procedure.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/procedures/new", "/create_procedure"
        redirect_to("/procedures")
      else
        redirect_back(:fallback_location => "/", :notice => "Procedure created successfully.")
      end
    else
      render("procedures/new.html.erb")
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])

    render("procedures/edit.html.erb")
  end

  def update
    @procedure = Procedure.find(params[:id])

    @procedure.provider_id = params[:provider_id]
    @procedure.treatment_id = params[:treatment_id]
    @procedure.patient_id = params[:patient_id]
    @procedure.amount = params[:amount]
    @procedure.date = params[:date]

    save_status = @procedure.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/procedures/#{@procedure.id}/edit", "/update_procedure"
        redirect_to("/procedures/#{@procedure.id}", :notice => "Procedure updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Procedure updated successfully.")
      end
    else
      render("procedures/edit.html.erb")
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])

    @procedure.destroy

    if URI(request.referer).path == "/procedures/#{@procedure.id}"
      redirect_to("/", :notice => "Procedure deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Procedure deleted.")
    end
  end
end
