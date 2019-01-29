class AddUserIdToRegisteredApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :registered_applications, :user_id, :integer
  end
end
