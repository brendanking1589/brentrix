class ProvidersController < ApplicationController
  def index
    @providers = Provider.all

    render("providers/index.html.erb")
  end

  def show
    @procedure = Procedure.new
    @provider = Provider.find(params[:id])

    render("providers/show.html.erb")
  end

  def new
    @provider = Provider.new

    render("providers/new.html.erb")
  end

  def create
    @provider = Provider.new

    @provider.doctor_id = params[:doctor_id]
    @provider.provider_code_string = params[:provider_code_string]
    @provider.location_id = params[:location_id]

    save_status = @provider.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/providers/new", "/create_provider"
        redirect_to("/providers")
      else
        redirect_back(:fallback_location => "/", :notice => "Provider created successfully.")
      end
    else
      render("providers/new.html.erb")
    end
  end

  def edit
    @provider = Provider.find(params[:id])

    render("providers/edit.html.erb")
  end

  def update
    @provider = Provider.find(params[:id])

    @provider.doctor_id = params[:doctor_id]
    @provider.provider_code_string = params[:provider_code_string]
    @provider.location_id = params[:location_id]

    save_status = @provider.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/providers/#{@provider.id}/edit", "/update_provider"
        redirect_to("/providers/#{@provider.id}", :notice => "Provider updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Provider updated successfully.")
      end
    else
      render("providers/edit.html.erb")
    end
  end

  def destroy
    @provider = Provider.find(params[:id])

    @provider.destroy

    if URI(request.referer).path == "/providers/#{@provider.id}"
      redirect_to("/", :notice => "Provider deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Provider deleted.")
    end
  end
end
