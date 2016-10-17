class Role < ActiveRecord::Base
end

class ConvertWwwRolesToWeb < ActiveRecord::Migration
  def self.up
    Role.where(name: 'www').update_all("name = 'web'")
  end

  def self.down
  end
end
