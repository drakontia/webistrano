class Deployment < ActiveRecord::Base
end

class AddRealStatusFieldToDeployment < ActiveRecord::Migration
  def self.up
    add_column :deployments, :status, :string, :default => "running"
    Deployment.where(success: 0).update_all("status = 'failed'")
    Deployment.where(success: 1).update_all("status = 'success'")
    remove_column :deployments , :success
  end

  def self.down
    add_column :deployments, :success, :integer, :default => 0
    Deployment.where(status: 'failed').update_all("success = 0")
    Deployment.where(status: 'success').update_all("success = 1")
    remove_column :deployments, :status
  end
end
