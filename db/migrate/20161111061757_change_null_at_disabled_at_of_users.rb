class ChangeNullAtDisabledAtOfUsers < ActiveRecord::Migration
  def change
    change_column_null :users, :disabled_at, true
  end
end
