class ProjectConfigurationsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_project

  # GET /projects/1/project_configurations/1
  def show
    @configuration = current_project.configuration_parameters.find_by(id: params[:id])
    respond_with(@configuration)
  end

  # GET /projects/1/project_configurations/new
  def new
    @configuration = current_project.configuration_parameters.new
    respond_with(@configuration)
  end

  # GET /projects/1/project_configurations/1;edit
  def edit
    @configuration = current_project.configuration_parameters.find_by(id: params[:id])
    respond_with(@configuration)
  end

  # POST /projects/1/project_configurations
  def create
    @configuration = current_project.configuration_parameters.build(configuration_params)

    if @configuration.save
      flash[:notice] = 'ProjectConfiguration was successfully created.'
      respond_with(@configuration, :location => current_project)
    else
      respond_with(@configuration)
    end
  end

  # PUT /projects/1/project_configurations/1
  def update
    @configuration = current_project.configuration_parameters.find_by(id: params[:id])

    if @configuration.update_attributes(configuration_params)
      flash[:notice] = 'ProjectConfiguration was successfully updated.'
      respond_with(@configuration, :location => current_project)
    else
      respond_with(@configuration)
    end
  end

  # DELETE /projects/1/project_configurations/1
  def destroy
    @configuration = current_project.configuration_parameters.find_by(id: params[:id])
    @configuration.destroy

    flash[:notice] = 'ProjectConfiguration was successfully deleted.'
    respond_with(@configuration, :location => current_project)
  end

private

  def configuration_params
    params.require(:configuration).permit(:name, :value, :type)
  end

end
