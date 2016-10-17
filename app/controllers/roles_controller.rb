class RolesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :load_stage
  before_filter :load_host_choices, :only => [:new, :edit, :update, :create]

  # GET /projects/1/stages/1/roles/1
  def show
    @role = @stage.roles.find(params[:id])

    respond_with(@role)
  end

  # GET /projects/1/stages/1/roles/new
  def new
    @role = @stage.roles.new
    respond_with(@role)
  end

  # GET /projects/1/stages/1/roles/1;edit
  def edit
    @role = @stage.roles.find(params[:id])
    respond_with(@role)
  end

  # POST /projects/1/stages/1/roles
  def create
    @role = Role.unscoped.where(
      :name     => role_params[:name],
      :host_id  => role_params[:host_id],
      :stage_id => @stage.id
    ).first_or_create(role_params)

    if @role
      @role.save

      respond_with(@role, :location => [@project, @stage], :notice => 'Role was successfully created.')
    else
      respond_with(@role)
    end
  end

  # PUT /projects/1/stages/1/roles/1
  def update
    @role = @stage.roles.find(params[:id])

    if @role.update_attributes(role_params)
      flash[:notice] = 'Role was successfully updated.'
      respond_with(@role, :location => [@project, @stage])
    else
      respond_with(@role)
    end
  end

  # DELETE /projects/1/stages/1/roles/1
  def destroy
    @role = @stage.roles.find(params[:id])
    @role.destroy

    respond_with(@role, :location => [@project, @stage], :notice => 'Role was successfully deleted.')
  end

private

  def load_host_choices
    @host_choices = Host.order("name ASC").collect {|h| [ h.name, h.id ] }
  end

  def role_params
    params.require(:role).permit(:name, :primary, :host_id, :no_release, :no_symlink, :ssh_port, :custom_name)
  end

end
