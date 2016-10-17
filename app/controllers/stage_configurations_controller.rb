class StageConfigurationsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_stage

  # GET /project/1/stage/1/stage_configurations/1
  def show
    @configuration = @stage.configuration_parameters.find(params[:id])
    respond_with(@configuration)
  end

  # GET /project/1/stage/1/stage_configurations/new
  def new
    @configuration = @stage.configuration_parameters.new
    respond_with(@configuration)
  end

  # GET /project/1/stage/1/stage_configurations/1;edit
  def edit
    @configuration = @stage.configuration_parameters.find(params[:id])
    respond_with(@configuration)
  end

  # POST /project/1/stage/1/stage_configurations
  def create
    @configuration = @stage.configuration_parameters.build(configuration_params)

    if @configuration.save
      flash[:notice] = 'StageConfiguration was successfully created.'
      respond_with(@configuration, :location => [@project, @stage])
    else
      respond_with(@configuration)
    end
  end

  # PUT /project/1/stage/1/stage_configurations/1
  def update
    @configuration = @stage.configuration_parameters.find(params[:id])

    if @configuration.update_attributes(configuration_params)
      flash[:notice] = 'StageConfiguration was successfully updated.'
      respond_with(@configuration, :location => [@project, @stage])
    else
      respond_with(@configuration)
    end
  end

  # DELETE /project/1/stage/1/stage_configurations/1
  def destroy
    @configuration = @stage.configuration_parameters.find(params[:id])
    @configuration.destroy

    respond_with(@configuration, :location => [@project, @stage], :notice => 'StageConfiguration was successfully deleted.')
  end

private

  def configuration_params
    params.require(:configuration).permit(:name, :value, :type)
  end

end
